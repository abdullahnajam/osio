import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:osio/model/coach_model.dart';
import 'package:osio/model/facility_model.dart';
import 'package:osio/model/program_model.dart';
import 'package:provider/provider.dart';

import '../model/poll_model.dart';
import '../provider/filter_provider.dart';

class FirebaseApi{

  static Future<bool> checkIfArticleLimitIsExceeded()async{
    int count=0;
    await FirebaseFirestore.instance.collection('article').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {

        count++;
      });
    });
    return count<5?false:true;
  }

  static Future<bool> activeStatus()async{
    int count=0;
    bool alreadyActive=false;
    bool activeStatus=false;
    await FirebaseFirestore.instance.collection('polls').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        PollModel model=PollModel.fromMap(data, doc.reference.id);
        if(!alreadyActive && model.isActive){
          alreadyActive=true;
        }
        count++;
      });
    });
    if(alreadyActive){
      print('not active');
    }
    else{
      activeStatus=true;
    }
    return activeStatus;
  }

  static Future<List<int>> getPollResults(String pollId)async{
    int count=0;
    bool alreadyActive=false;
    bool activeStatus=false;
    List<int> results=[];
    await FirebaseFirestore.instance.collection('results').where('pollId',isEqualTo: pollId).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        results.add(int.parse(data['answers'].toString()));
      });
    });

    return results;
  }

  static Future<void> setActiveStatus(String id,bool status)async{
    await FirebaseFirestore.instance.collection('polls').doc(id).update({
      "isActive":status,
    });
    await FirebaseFirestore.instance.collection('polls').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async{
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        PollModel model=PollModel.fromMap(data, doc.reference.id);
        if(model.isActive && model.id!=id){
          await FirebaseFirestore.instance.collection('polls').doc(model.id).update({
            "isActive":false,
          });
        }

      });
    });


  }

  static Future<List<CoachModel>> getCoaches(BuildContext context)async{
    List<CoachModel> coaches=[];
    final provider = Provider.of<FilterProvider>(context, listen: false);
    await FirebaseFirestore.instance.collection('coaches').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async{
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        CoachModel model=CoachModel.fromMap(data, doc.reference.id);
        if(provider.names.isNotEmpty){
          provider.names.forEach((element) {
            if('${model.firstName} ${model.lastName}'.toLowerCase().contains(element.toLowerCase())){


              bool available=false;
              coaches.forEach((c) {
                if(c.id==model.id){
                  available=true;
                }
              });
              if(!available){
                if(provider.program.isNotEmpty){
                  if(model.program.toLowerCase().contains(provider.program)){
                    coaches.add(model);
                  }
                }
                else{
                  coaches.add(model);
                }

              }
            }
          });
        }
        else{
          if(provider.program.isNotEmpty){
            bool available=false;
            coaches.forEach((c) {
              if(c.id==model.id){
                available=true;
              }
            });
            if(!available){
              coaches.add(model);
            }
          }
          else{
            coaches.add(model);
          }
        }






      });
    });
    return coaches;

  }

  static Future<List<ProgramModel>> getPrograms(BuildContext context)async{
    List<ProgramModel> programs=[];
    final provider = Provider.of<FilterProvider>(context, listen: false);
    await FirebaseFirestore.instance.collection('programs').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async{
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        ProgramModel model=ProgramModel.fromMap(data, doc.reference.id);
        if(provider.names.isNotEmpty){
          provider.names.forEach((element) {
            if('${model.program}'.toLowerCase().contains(element.toLowerCase())){


              bool available=false;
              programs.forEach((c) {
                if(c.id==model.id){
                  available=true;
                }
              });
              if(!available){
                programs.add(model);

              }
            }
          });
        }
        else{
          programs.add(model);
        }






      });
    });
    return programs;

  }

  static Future<List<FacilityModel>> getFacility(BuildContext context)async{
    List<FacilityModel> facilities=[];
    final provider = Provider.of<FilterProvider>(context, listen: false);
    await FirebaseFirestore.instance.collection('facilities').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async{
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        FacilityModel model=FacilityModel.fromMap(data, doc.reference.id);
        if(provider.names.isNotEmpty){
          provider.names.forEach((element) {
            if('${model.name}'.toLowerCase().contains(element.toLowerCase())){


              bool available=false;
              facilities.forEach((c) {
                if(c.id==model.id){
                  available=true;
                }
              });
              if(!available){
                facilities.add(model);

              }
            }
          });
        }
        else{
          facilities.add(model);
        }






      });
    });
    return facilities;

  }
}