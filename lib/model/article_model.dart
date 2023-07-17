import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel{
  String id,name,hyperlink,author,summary,publication;
  int date;

  ArticleModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        hyperlink = map['hyperlink']??"",
        date = map['date']??0,
        name = map['name']??'',
        summary = map['summary']??'',
        publication = map['publication']??'',
        author = map['author']??'';



  ArticleModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}