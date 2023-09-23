import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:osio/model/coach_model.dart';
import 'package:osio/model/facility_model.dart';
import 'package:osio/model/program_model.dart';
import 'package:osio/provider/filter_provider.dart';
import 'package:osio/screens/coach_details.dart';
import 'package:osio/screens/discovery_details.dart';
import 'package:osio/screens/filter_screen.dart';
import 'package:osio/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../api/firebase_api.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);

    super.initState();

    _controller = VideoPlayerController.asset("assets/videos/1.mp4")..setLooping(true);
    _initializeVideoPlayerFuture = _controller!.initialize();

    _controller2 = VideoPlayerController.asset("assets/videos/2.mp4")..setLooping(true);
    _initializeVideoPlayerFuture2 = _controller2!.initialize();

    _controller3 = VideoPlayerController.asset("assets/videos/3.mp4")..setLooping(true);
    _initializeVideoPlayerFuture3 = _controller3!.initialize();
  }
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  bool showV1=true;
  bool showV2=true;
  bool showV3=true;
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  VideoPlayerController? _controller2;
  Future<void>? _initializeVideoPlayerFuture2;

  VideoPlayerController? _controller3;
  Future<void>? _initializeVideoPlayerFuture3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,


      body: SafeArea(
        child: Consumer<FilterProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Discover',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w900),),
                      const SizedBox(height: 10,),
                      const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:10,color: Colors.black),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  const FilterScreen()));

                            },
                            child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width*0.35,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('FILTER',style: TextStyle(color: Colors.white),),
                                    const SizedBox(width: 10,),
                                    Image.asset('assets/images/filter.png',height: 12,)
                                  ],
                                )
                            ),
                          ),
                          Consumer<FilterProvider>(
                            builder: (context, provider, child) {
                              if(provider.getFilterCount()>0) {
                                return Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width*0.35,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text('${provider.getFilterCount()}  FILTERS',style: const TextStyle(color: Colors.white),),
                                      const SizedBox(width: 10,),
                                      InkWell(
                                        onTap: (){
                                          provider.reset();
                                        },
                                        child: const Icon(Icons.close,color: Colors.white,size: 20,),
                                      )
                                    ],
                                  )
                              );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 0,),
                    ],
                  ),
                ),
                TabBar(
                  padding: EdgeInsets.zero,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Coaches',
                    ),
                    Tab(
                      text: 'Programs',

                    ),
                    Tab(
                      text: 'Facilities',

                    )
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: ListView(
                          children: [
                            if(showV1)
                              Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(

                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.4,
                                decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50)
                                  ),

                                ),
                                child: Stack(
                                  children: [
                                    FutureBuilder(
                                      future: _initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          _controller!.play();

                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            decoration: const BoxDecoration(

                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),

                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: _controller!.value.aspectRatio,
                                                child: VideoPlayer(_controller!),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              color: primaryColor,
                                            ),

                                            //child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),


                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('Good\nCoaching\nMatters.',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900),),

                                          Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                          SizedBox(height: 20,)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomRight: Radius.circular(50)
                                        ),
                                        gradient: discoverVideoGradient
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 80,
                                          width: 85,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(

                                                  bottomRight: Radius.circular(50)
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/color1.png'),
                                                  fit: BoxFit.cover
                                              )

                                          ),

                                        )
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: (){
                                                print('tapped $showV1');
                                                setState(() {
                                                  showV1=false;
                                                });
                                              },
                                              child: Icon(Icons.close,color: Colors.white,),
                                            )
                                        )
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            FutureBuilder<List<CoachModel>>(
                                future: FirebaseApi.getCoaches(context),
                                builder: (context, AsyncSnapshot<List<CoachModel>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Container(
                                      child: const Text("-",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300)),
                                    );
                                  }
                                  else {
                                    if (snapshot.hasError) {
                                      print("error ${snapshot.error}");
                                      return const Center(
                                        child: Text("Something went wrong"),
                                      );
                                    }

                                    if (snapshot.data!.isEmpty) {
                                      return Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(80),
                                        alignment: Alignment.center,
                                        child: const Text("No data found"),
                                      );
                                    }


                                    else {


                                      return Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 12.0,
                                            childAspectRatio:MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.8),
                                          ),
                                          itemBuilder: (BuildContext context,int index){
                                            return coachCard(snapshot.data![index]);
                                          },
                                          itemCount: snapshot.data!.length,
                                        ),
                                      );
                                    }
                                  }
                                }
                            ),
                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: ListView(
                          children: [
                            if(showV2)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(

                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.4,
                                decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50)
                                  ),

                                ),
                                child: Stack(
                                  children: [
                                    FutureBuilder(
                                      future: _initializeVideoPlayerFuture2,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          _controller2!.play();

                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            decoration: const BoxDecoration(

                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),

                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: _controller2!.value.aspectRatio,
                                                child: VideoPlayer(_controller2!),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              color: primaryColor,
                                            ),

                                            //child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),


                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('Discover\nLocal\nPrograms.',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),

                                          Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                          SizedBox(height: 20,)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomRight: Radius.circular(50)
                                        ),
                                        gradient: discoverVideoGradient
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 80,
                                          width: 85,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(

                                                  bottomRight: Radius.circular(50)
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/color2.png'),
                                                  fit: BoxFit.cover
                                              )

                                          ),

                                        )
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: (){

                                                setState(() {
                                                  showV2=false;
                                                });
                                              },
                                              child: Icon(Icons.close,color: Colors.white,),
                                            )
                                        )
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            FutureBuilder<List<ProgramModel>>(
                                future: FirebaseApi.getPrograms(context),
                                builder: (context, AsyncSnapshot<List<ProgramModel>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Container(
                                      child: const Text("-",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300)),
                                    );
                                  }
                                  else {
                                    if (snapshot.hasError) {
                                      print("error ${snapshot.error}");
                                      return const Center(
                                        child: Text("Something went wrong"),
                                      );
                                    }

                                    if (snapshot.data!.isEmpty) {
                                      return Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(80),
                                        alignment: Alignment.center,
                                        child: const Text("No data found"),
                                      );
                                    }


                                    else {


                                      return Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 12.0,
                                            childAspectRatio:MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.8),
                                          ),
                                          itemBuilder: (BuildContext context,int index){
                                            return programCard(snapshot.data![index]);
                                          },
                                          itemCount: snapshot.data!.length,
                                        ),
                                      );
                                    }
                                  }
                                }
                            ),


                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: ListView(
                          children: [
                            if(showV3)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(

                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.4,
                                decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50)
                                  ),

                                ),
                                child: Stack(
                                  children: [
                                    FutureBuilder(
                                      future: _initializeVideoPlayerFuture3,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          _controller3!.play();

                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            decoration: const BoxDecoration(

                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),

                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: _controller3!.value.aspectRatio,
                                                child: VideoPlayer(_controller3!),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomRight: Radius.circular(50)
                                              ),
                                              color: primaryColor,
                                            ),

                                            //child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),


                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('Train\n& Coach\nAnywhere.',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900),),

                                          Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                          SizedBox(height: 20,)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomRight: Radius.circular(50)
                                        ),
                                        gradient: discoverVideoGradient
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 80,
                                          width: 85,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(

                                                  bottomRight: Radius.circular(50)
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/color3.png'),
                                                  fit: BoxFit.cover
                                              )

                                          ),

                                        )
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: (){
                                                print('tapped $showV1');
                                                setState(() {
                                                  showV3=false;
                                                });
                                              },
                                              child: Icon(Icons.close,color: Colors.white,),
                                            )
                                        )
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            FutureBuilder<List<FacilityModel>>(
                                future: FirebaseApi.getFacility(context),
                                builder: (context, AsyncSnapshot<List<FacilityModel>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Container(
                                      child: const Text("-",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300)),
                                    );
                                  }
                                  else {
                                    if (snapshot.hasError) {
                                      print("error ${snapshot.error}");
                                      return const Center(
                                        child: Text("Something went wrong"),
                                      );
                                    }

                                    if (snapshot.data!.isEmpty) {
                                      return Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(80),
                                        alignment: Alignment.center,
                                        child: const Text("No data found"),
                                      );
                                    }


                                    else {


                                      return Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 12.0,
                                            childAspectRatio:MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.8),
                                          ),
                                          itemBuilder: (BuildContext context,int index){
                                            return facilityCard(snapshot.data![index]);
                                          },
                                          itemCount: snapshot.data!.length,
                                        ),
                                      );
                                    }
                                  }
                                }
                            ),
                            const SizedBox(height: 20,)
                          ],
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
    );
  }

  Widget coachCard(CoachModel model){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  CoachDetail(model)));

      },
      child: Container(

        margin: const EdgeInsets.fromLTRB(10,10,5,10),
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
            color: Color(0xff9E793C)
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
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
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(

                          bottomRight: Radius.circular(50)
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/sub_c_1.png',),
                          fit: BoxFit.cover
                      )

                  ),

                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Text('${model.firstName} ${model.lastName}',style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                  Text(model.state,style: const TextStyle(color: Colors.white),),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('This Coach has not\nyet been rated',textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),)
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget programCard(ProgramModel model){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  DiscoveryDetails(model)));

      },
      child: Container(

        margin: const EdgeInsets.fromLTRB(10,10,5,10),
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
            color: Color(0xff8288C0)
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
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
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(

                          bottomRight: Radius.circular(50)
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/sub_c_2.png',),
                          fit: BoxFit.cover
                      )

                  ),

                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Text(model.program,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                  Text(model.state,style: const TextStyle(color: Colors.white),),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('This Program has not\nyet been rated',textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),)
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget facilityCard(FacilityModel model){
    return InkWell(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  const DiscoveryDetails()));

      },
      child: Container(

        margin: const EdgeInsets.fromLTRB(10,10,5,10),
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
            color: Color(0xff8D2C67)
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
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
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(

                          bottomRight: Radius.circular(50)
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/sub_c_3.png',),
                          fit: BoxFit.cover
                      )

                  ),

                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Text(model.name,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                  Text(model.state,style: const TextStyle(color: Colors.white),),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('This Facility has not\nyet been rated',textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),)
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
