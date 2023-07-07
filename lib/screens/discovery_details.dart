import 'package:flutter/material.dart';
import 'package:osio/utils/constants.dart';

class DiscoveryDetails extends StatefulWidget {
  const DiscoveryDetails({Key? key}) : super(key: key);

  @override
  State<DiscoveryDetails> createState() => _DiscoveryDetailsState();
}

class _DiscoveryDetailsState extends State<DiscoveryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [


                Image.asset('assets/images/blur3.png',fit: BoxFit.fitWidth,height: MediaQuery.of(context).size.height*0.5,width: MediaQuery.of(context).size.width,),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.white,),
                      )
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: 100,
                      decoration: const BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage('assets/images/sub_c_3.png',),
                              fit: BoxFit.cover
                          )

                      ),

                    )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,30,30,20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3.5',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(
                        color: color3,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text('GYMS & FACILITIES',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      SizedBox(height: 10,),
                      Text('Josies\nGym',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text('California, USA',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),

                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coaches',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black),),
                  SizedBox(height: 20,),
                  Container(
                    color: color1,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text('Long Name Coach From Program Here',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    color: color1,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text('This is a Shorter Coaches Name',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    color: color1,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text('This is another Coaches Name FIeld',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('VIEW ALL (8)',style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Experiences',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black),),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('SHARE MY EXPERIENCE',style: TextStyle(color: Colors.white),),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: greenColor,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Text('JADA WOOTEN',style: TextStyle(color: Colors.white,fontSize: 13),),
                          ),
                          Text('Too intense for no reason ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          Text('October 12, 2022 | 12:23pm EST',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('MENTIONS:',style: TextStyle(fontWeight: FontWeight.w500),),
                      SizedBox(width: 5,),
                      Container(
                        color: color1,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text('COACH NAME',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      Container(
                        color: color2,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text('TSA ALLSTARS',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: greenColor,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Text('JADA WOOTEN',style: TextStyle(color: Colors.white,fontSize: 13),),
                          ),
                          Text('Too intense for no reason ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          Text('October 12, 2022 | 12:23pm EST',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('MENTIONS:',style: TextStyle(fontWeight: FontWeight.w500),),
                      SizedBox(width: 5,),
                      Container(
                        color: color1,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text('COACH NAME',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      Container(
                        color: color2,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text('TSA ALLSTARS',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
