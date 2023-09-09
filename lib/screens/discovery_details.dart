import 'package:flutter/material.dart';
import 'package:osio/model/program_model.dart';
import 'package:osio/utils/constants.dart';

class DiscoveryDetails extends StatefulWidget {
  ProgramModel model;

  DiscoveryDetails(this.model);

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


                Image.asset('assets/images/blur2.png',fit: BoxFit.fitWidth,height: MediaQuery.of(context).size.height*0.5,width: MediaQuery.of(context).size.width,),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close,color: Colors.white,),
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
                              image: AssetImage('assets/images/sub_c_2.png',),
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
                      const Text('3.5',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.white),),
                      const SizedBox(height: 10,),
                      Container(
                        color: color2,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: const Text('GYMS & FACILITIES',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      const SizedBox(height: 10,),
                      Text(widget.model.program,style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.white),),
                      const SizedBox(height: 10,),
                      const Text('California, USA',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),

                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Programs',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black),),
                  const SizedBox(height: 20,),
                  Container(
                    color: color1,
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Text('This is an Example of a Longer Program',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    color: color1,
                    padding: const EdgeInsets.only(left: 10,right: 10), 
                    child: const Text('This is a Shorter Program Name',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    color: color1,
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Text('This is an Example of a Longer Program',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: const Text('VIEW ALL (8)',style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Experiences',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black),),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: const Text('SHARE MY EXPERIENCE',style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(height: 20,),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
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
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: const Text('JADA WOOTEN',style: TextStyle(color: Colors.white,fontSize: 13),),
                          ),
                          const Text('Too intense for no reason ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          const Text('October 12, 2022 | 12:23pm EST',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text('MENTIONS:',style: TextStyle(fontWeight: FontWeight.w500),),
                      const SizedBox(width: 5,),
                      Container(
                        color: color3,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: const Text('COACH NAME',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      Container(
                        color: color1,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: const Text('TSA ALLSTARS',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
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
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: const Text('JADA WOOTEN',style: TextStyle(color: Colors.white,fontSize: 13),),
                          ),
                          const Text('Too intense for no reason ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          const Text('October 12, 2022 | 12:23pm EST',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/chat.png',),
                                    fit: BoxFit.cover
                                )
                            ),
                            alignment: Alignment.topCenter,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text('34',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',style: TextStyle(fontWeight: FontWeight.w300),),

                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text('MENTIONS:',style: TextStyle(fontWeight: FontWeight.w500),),
                      const SizedBox(width: 5,),
                      Container(
                        color: color3,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: const Text('COACH NAME',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                      Container(
                        color: color1,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: const Text('TSA ALLSTARS',style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: Colors.black,thickness: 0.1,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
