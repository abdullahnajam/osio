import 'package:flutter/material.dart';
import 'package:osio/screens/discover.dart';
import 'package:osio/screens/home_page.dart';
import '../../utils/constants.dart';
import '../screens/get_started.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavigationState createState() => new _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavBar>{

  int _currentIndex = 0;

  List<Widget> _children=[];

  @override
  void initState() {
    super.initState();
    _children = [
      Homepage(),
      Discover(),
      Container(),


    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 5),
        height: AppBar().preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                onTabTapped(0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/news.png",height: 20,color: _currentIndex==0?Colors.black:unselectedColor),
                  Text('NEWSFEED',style: TextStyle(color: _currentIndex==0?Colors.black:unselectedColor,fontWeight: FontWeight.w500,fontSize: 12))

                ],
              ),
            ),
            InkWell(
              onTap: (){
                onTabTapped(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/discover.png",height: 20,color: _currentIndex==1?Colors.black:unselectedColor),
                  Text('DISCOVER',style: TextStyle(color: _currentIndex==1?Colors.black:unselectedColor,fontWeight: FontWeight.w500,fontSize: 12))
                ],
              ),
            ),
            InkWell(
              onTap: (){
                onTabTapped(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/person.png",height: 20,color: _currentIndex==2?Colors.black:unselectedColor),
                  Text('PROFILE',style: TextStyle(color: _currentIndex==2?Colors.black:unselectedColor,fontWeight: FontWeight.w500,fontSize: 12),)

                ],
              ),
            ),



          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }
}
