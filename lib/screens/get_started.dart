import 'dart:async';
import 'package:flutter/material.dart';
import 'package:osio/navigator/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../utils/constants.dart';

class GetStartedScreen extends StatefulWidget {

  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  _loadWidget() async {

    var duration = const Duration(seconds: 9);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async{
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  OnBoardingScreen()));

  }

  Timer? _timer;

  final PageController controller = PageController();
  final PageController controller2 = PageController();
  int currentIndex=0;

  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  VideoPlayerController? _controller2;
  Future<void>? _initializeVideoPlayerFuture2;

  VideoPlayerController? _controller3;
  Future<void>? _initializeVideoPlayerFuture3;

  VideoPlayerController? _controller4;
  Future<void>? _initializeVideoPlayerFuture4;



  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/v1.mp4");
    _initializeVideoPlayerFuture = _controller!.initialize();

    _controller2 = VideoPlayerController.asset("assets/videos/v2.mp4");
    _initializeVideoPlayerFuture2 = _controller2!.initialize();

    _controller3 = VideoPlayerController.asset("assets/videos/v3.mp4");
    _initializeVideoPlayerFuture3 = _controller3!.initialize();

    _controller4 = VideoPlayerController.asset("assets/videos/v4.mp4");
    _initializeVideoPlayerFuture4 = _controller4!.initialize();

    _timer = Timer.periodic(Duration(seconds: 6), (Timer timer) {
      if (currentIndex < 4) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      controller.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      controller2.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    _loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _controller!.play();
                      print('aspect 1 ${_controller!.value.aspectRatio}');
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                      );
                    } else {
                      return Container(
                        color: primaryColor,
                        //child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: _initializeVideoPlayerFuture2,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _controller2!.play();
                      return SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: AspectRatio(
                              aspectRatio: _controller2!.value.aspectRatio,
                              child: VideoPlayer(_controller2!),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: primaryColor,
                        //child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: _initializeVideoPlayerFuture3,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _controller3!.play();
                      print('aspect 3 ${_controller!.value.aspectRatio}');
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.9,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: VideoPlayer(_controller3!),
                        ),
                      );
                    } else {
                      return Container(
                        color: primaryColor,
                        //child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: _initializeVideoPlayerFuture4,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _controller4!.play();
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: AspectRatio(
                          aspectRatio: _controller4!.value.aspectRatio,
                          child: VideoPlayer(_controller4!),
                        ),
                      );
                    } else {
                      return Container(
                        color: primaryColor,
                        //child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],

            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/logo.png',height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Already have an account?',style: TextStyle(color: Colors.white,fontSize: 12),),
                            Text('SIGN IN',style: TextStyle(color: primaryColor,fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 50,),
                    Image.asset('assets/images/slogan.png',height: 200,),
                    SizedBox(height: 50,),
                    SmoothPageIndicator(
                        controller: controller,  // PageController
                        count:  4,
                        effect:  WormEffect(
                          spacing:  10,
                          radius:  4.0,
                          dotWidth:  5.0,
                          dotHeight:  5.0,
                          activeDotColor: primaryColor,
                          dotColor: Colors.grey.shade300,
                          paintStyle:  PaintingStyle.fill,
                          strokeWidth:  1.5,
                        ),  // your preferred  effect
                        onDotClicked: (index){
                          controller.animateToPage(index,duration: const Duration(seconds: 1),curve: Curves.easeInOut);
                          controller2.animateToPage(index,duration: const Duration(seconds: 1),curve: Curves.easeInOut);
                        }
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 140,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller2,
                        children: const [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Our Sport\nis Ours',style: TextStyle(color: primaryColor,fontSize: 25,fontWeight: FontWeight.w900),),
                              Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Discover\nGreatness',style: TextStyle(color: primaryColor,fontSize: 25,fontWeight: FontWeight.w900),),
                              Text('The first  community for young athlete enablement and empowerment.',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Resources\nfor Coaches',style: TextStyle(color: primaryColor,fontSize: 25,fontWeight: FontWeight.w900),),
                              Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sitr adipiscing ',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(' For Guardians\n& Child Athletes',style: TextStyle(color: primaryColor,fontSize: 25,fontWeight: FontWeight.w900),),
                              Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sitr adipiscing elit, sed r adipiscing elit, sed ',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
                            ],
                          ),
                        ],

                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  BottomNavBar()));

                        },
                        child: Container(
                          height: 50,
                         // width: MediaQuery.of(context).size.width*0.8,
                          color: Colors.grey.shade900,
                          alignment: Alignment.center,
                          child: Text('GET STARTED',style: TextStyle(color: primaryColor),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        )

      ),
    );
  }
}
