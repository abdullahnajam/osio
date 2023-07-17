import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/poll_model.dart';

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
}