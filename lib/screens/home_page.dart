import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osio/api/firebase_api.dart';
import 'package:osio/model/article_model.dart';
import 'package:osio/model/poll_model.dart';
import 'package:osio/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController controller = PageController();
  int _selectedValue = 0;
  bool pollAnswered=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              decoration: const BoxDecoration(
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
                  const SizedBox(height: 80,),
                  Image.asset('assets/images/slogan.png',height: 130,fit: BoxFit.cover,),
                  const SizedBox(height: 20,),
                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:13,color: Colors.white),)
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('polls').where('isActive',isEqualTo: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }

                if(snapshot.data!.size>0){
                  Map<String, dynamic> data = snapshot.data!.docs.first.data() as Map<String, dynamic>;
                  PollModel model=PollModel.fromMap(data, snapshot.data!.docs.first.reference.id);
                  return  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.title,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text(model.question,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                        const SizedBox(height: 30,),
                        if(!pollAnswered)
                          ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.answers.length,
                          itemBuilder: (BuildContext context,int index){
                            return  Row(
                              children: [
                                Radio(
                                  value: index,
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                ),
                                Expanded(child: Text(model.answers[index]))
                              ],
                            );
                          },
                        )
                        else
                          FutureBuilder<List<int>>(
                              future: FirebaseApi.getPollResults(model.id),
                              builder: (context, AsyncSnapshot<List<int>> usersnap) {
                                if (usersnap.connectionState == ConnectionState.waiting) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: CupertinoActivityIndicator(),
                                  );
                                }
                                else {
                                  if (usersnap.hasError) {
                                    print("error ${usersnap.error}");
                                    return Container(
                                      color: primaryColor,
                                      child: Center(
                                        child: Text("something went wrong"),
                                      ),
                                    );
                                  }

                                  if (usersnap.data==null) {
                                    print("error ${usersnap.error}");
                                    return Container(
                                      child: Center(
                                        child: Text("something went wrong"),
                                      ),
                                    );
                                  }



                                  else {
                                    return Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: model.answers.length,
                                          physics: NeverScrollableScrollPhysics(),

                                          itemBuilder: (BuildContext context,int index){
                                            int total=0;
                                            usersnap.data!.forEach((element) {
                                              if(element==index){
                                                total++;
                                              }
                                            });
                                            return Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: StepProgressIndicator(
                                                totalSteps: usersnap.data!.length,
                                                currentStep: total,
                                                padding: 0,
                                                size: 30,
                                                selectedColor:  shades[index],
                                                unselectedColor: Colors.transparent,
                                              ),
                                            );
                                          },
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: model.answers.length,
                                          itemBuilder: (BuildContext context,int index){
                                            return  Container(
                                              color: index==_selectedValue?Color(0xffF6E1B1):Colors.transparent,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(top: 8.0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(5),
                                                    child: Container(
                                                      height: 25,
                                                      width: 4,
                                                      color: shades[index],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(model.answers[index]),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    );

                                  }
                                }
                              }
                          ),




                        const SizedBox(height: 30,),
                        if(!pollAnswered)
                          InkWell(
                          onTap: ()async{
                            await FirebaseFirestore.instance.collection('results').add({
                              "pollId":model.id,
                              "answers":_selectedValue,
                              "createdAt":DateTime.now().millisecondsSinceEpoch,
                            }).then((value) {
                              setState(() {
                                pollAnswered=true;
                              });
                            }).onError((error, stackTrace){

                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: const Text('SUBMIT ANSWER',style: TextStyle(color: Colors.white),),
                          ),
                        )
                        else
                          InkWell(
                            onTap: ()async{
                              setState(() {
                                pollAnswered=false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: const Text('EXIT POLL',style: TextStyle(color: Colors.white),),
                            ),
                          ),

                        const SizedBox(height: 20,),
                      ],
                    ),
                  );
                }
                else{
                  return Container(height: 1,);
                }

              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('article').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.size==0){
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(80),
                    alignment: Alignment.center,
                    child: const Text("No data found"),
                  );
                }
                print("size ${snapshot.data!.size}");
                return  Container(
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: controller,
                          itemCount: snapshot.data!.size,
                          itemBuilder: (BuildContext context,int index){
                            Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                            ArticleModel model=ArticleModel.fromMap(data, snapshot.data!.docs[index].reference.id);
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/home2.png'),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(model.name,style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),),
                                      const SizedBox(height: 20,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        color: Colors.white,
                                        child: Text(model.publication,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
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
                                      Text('By ${model.author}, ${f.format(DateTime.fromMillisecondsSinceEpoch(model.date))}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                                      const SizedBox(height: 10,),
                                      Text(model.summary,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),

                                      const SizedBox(height: 30,),
                                      InkWell(
                                        onTap: ()async{
                                          await launchUrl(Uri.parse(model.hyperlink)).then((value){}).onError((error, stackTrace){
                                            CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.error,
                                              text: 'Unable to launch ${model.hyperlink}. Please check if this is a correct url',
                                            );
                                          });
                                        },
                                        child: Container(
                                            width: MediaQuery.of(context).size.width*0.65,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(25)
                                            ),
                                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text('READ FULL ARTICLE',style: TextStyle(color: Colors.white),),
                                                const SizedBox(width: 10,),
                                                Image.asset('assets/images/link.png',height: 15,)
                                              ],
                                            )
                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                              ],
                            );
                          },
                        ),
                      ),
                      SmoothPageIndicator(
                          controller: controller,  // PageController
                          count:  snapshot.data!.size,
                          effect:  const WormEffect(
                            spacing:  10,
                            radius:  4.0,
                            dotWidth:  5.0,
                            dotHeight:  5.0,
                            activeDotColor: Colors.black,
                            dotColor: Colors.grey,
                            paintStyle:  PaintingStyle.fill,
                            strokeWidth:  1.5,
                          ),  // your preferred  effect
                          onDotClicked: (index){
                            //controller.animateToPage(index,duration: const Duration(seconds: 1),curve: Curves.easeInOut);
                          }
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                );
              },
            ),




            Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home3.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Share Your Cheer Experiences.',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),),

                  const SizedBox(height: 20,),

                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:13,color: Colors.white),),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: const Text('SHARE MY EXPERIENCE',style: TextStyle(color: Colors.black),),
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
