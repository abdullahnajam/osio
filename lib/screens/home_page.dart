import 'package:flutter/material.dart';
import 'package:osio/utils/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home1.png'),
                  fit: BoxFit.cover
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/logo.png',height: 30,fit: BoxFit.cover,color: Colors.white,)
                    ],
                  ),
                  SizedBox(height: 80,),
                  Image.asset('assets/images/slogan.png',height: 130,fit: BoxFit.cover,),
                  SizedBox(height: 20,),
                  Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:13,color: Colors.white),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('How was your previous cheer workout?',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                  SizedBox(height: 10,),
                  Text('Summary area or extension of headline goes here.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: false,
                        onChanged: (value){

                        },
                      ),
                      Expanded(child: Text('This would be the first answer preferably no longer than 90 characters.'))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: false,
                        onChanged: (value){

                        },
                      ),
                      Expanded(child: Text('This is the second answer; additional answers will expand the height of this module.'))
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('SUBMIT ANSWER',style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home2.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Long Cane cheer squad enjoys undefeated season',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    color: Colors.white,
                    child: Text('LAGRANGE DAILY NEWS',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('By Ethan Strong, November 22, 2022',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                  SizedBox(height: 10,),
                  Text('This would be a brief summary from the news article that can be added from the article. Under 120 Characters is best.',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),

                  SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('READ FULL ARTICLE',style: TextStyle(color: Colors.white),),
                        SizedBox(width: 10,),
                        Image.asset('assets/images/link.png',height: 15,)
                      ],
                    )
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home3.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Share Your Cheer Experiences.',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),),

                  SizedBox(height: 20,),

                  Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:13,color: Colors.white),),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('SHARE MY EXPERIENCE',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
