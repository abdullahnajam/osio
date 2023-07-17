import 'package:cloud_firestore/cloud_firestore.dart';

class CoachModel{
  String id,firstName,lastName,state,program,programId,owner;
  bool isOwner,usasfCoach;

  CoachModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        firstName = map['firstName']??"",
        lastName = map['lastName']??'',
        state = map['state']??'',
        program = map['program']??'',
        programId = map['programId']??'',
        usasfCoach = map['usasfCoach']??false,
        isOwner = map['isOwner']??false,
        owner = map['owner']??'';



  CoachModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}