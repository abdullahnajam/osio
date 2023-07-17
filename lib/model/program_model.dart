import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramModel{
  String id,state,program;

  ProgramModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        
        state = map['state']??'',
        program = map['program']??'';



  ProgramModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}