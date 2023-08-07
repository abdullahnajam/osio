import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FilterProvider extends ChangeNotifier {

  List<String> names=[];
  String program='';


  void setProgram(String value) {
    program = value;
    notifyListeners();
  }



  void addName(String value) {
    names.add(value);
    notifyListeners();
  }
  void removeName(String value) {
    names.remove(value);
    notifyListeners();
  }
  int getFilterCount(){
    int count=0;
    if(names.isNotEmpty){
      count++;
    }
    if(program!=''){
      count++;
    }
    return count;
  }

  reset(){
    names=[];
    program='';
    notifyListeners();
  }











}
