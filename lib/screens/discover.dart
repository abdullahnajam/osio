import 'package:flutter/material.dart';
import 'package:osio/screens/discovery_details.dart';
import 'package:osio/screens/filter_screen.dart';
import 'package:osio/utils/constants.dart';

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
  }
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Discover',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w900),),
                  const SizedBox(height: 10,),
                  const Text('incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, minim veniam, ',style: TextStyle(fontSize:13,color: Colors.black),),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  FilterScreen()));

                    },
                    child: Container(
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
                  const SizedBox(height: 20,),
                ],
              ),
            ),
            TabBar(
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
                                image: DecorationImage(
                                    image: AssetImage('assets/images/head1.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.close,color: Colors.white,),
                                    )
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
                                            image: AssetImage('assets/images/color1.png',),
                                            fit: BoxFit.cover
                                        )

                                    ),

                                  )
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Good\nCoaching\nMatters.',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w900),),

                                      Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                      SizedBox(height: 20,)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  DiscoveryDetails()));

                                  },
                                  child: Container(

                                    margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                        const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20,),
                                              Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                              Text('California',style: TextStyle(color: Colors.white),),
                                              SizedBox(height: 20,),
                                              Row(
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
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(

                                  margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView(
                      children: [
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
                                image: DecorationImage(
                                    image: AssetImage('assets/images/head2.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.close,color: Colors.white,),
                                    )
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
                                              image: AssetImage('assets/images/color2.png',),
                                              fit: BoxFit.cover
                                          )

                                      ),

                                    )
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Discover\nLocal\nPrograms',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w900),),

                                      Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                      SizedBox(height: 20,)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  DiscoveryDetails()));

                                  },
                                  child: Container(

                                    margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                        const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20,),
                                              Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                              Text('California',style: TextStyle(color: Colors.white),),
                                              SizedBox(height: 20,),
                                              Row(
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
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(

                                  margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView(
                      children: [
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
                                image: DecorationImage(
                                    image: AssetImage('assets/images/head3.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.close,color: Colors.white,),
                                    )
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
                                              image: AssetImage('assets/images/color3.png',),
                                              fit: BoxFit.cover
                                          )

                                      ),

                                    )
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Train\n& Coach\nAnywhere',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w900),),

                                      Text('olor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.o olor sit',style: TextStyle(color: Colors.white),),
                                      SizedBox(height: 20,)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  DiscoveryDetails()));

                                  },
                                  child: Container(

                                    margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                        const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20,),
                                              Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                              Text('California',style: TextStyle(color: Colors.white),),
                                              SizedBox(height: 20,),
                                              Row(
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
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(

                                  margin: EdgeInsets.fromLTRB(10,10,5,10),
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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5,10,10,10),

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
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text('Abraham Williamson',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),

                                            Text('California',style: TextStyle(color: Colors.white),),
                                            SizedBox(height: 20,),
                                            Row(
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
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
