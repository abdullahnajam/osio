import 'package:cloud_firestore/cloud_firestore.dart';

class FacilityModel{
  String id,state,name,address;

  FacilityModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        
        state = map['state']??'',
        name = map['name']??'',
        address = map['address']??'';



  FacilityModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}