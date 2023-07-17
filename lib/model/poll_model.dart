import 'package:cloud_firestore/cloud_firestore.dart';

class PollModel{
  String id,title,question;
  List answers;
  bool multiAnswers,isActive;

  PollModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,

        title = map['title']??'',
        answers = map['answers']??[],
        isActive = map['isActive']??false,
        multiAnswers = map['multiAnswers']??true,
        question = map['question']??'';



  PollModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}