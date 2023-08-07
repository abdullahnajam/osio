import 'package:flutter/material.dart';
import 'package:osio/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/filter_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  SfRangeValues _values = const SfRangeValues(1, 9);
  var nameController=TextEditingController();
  var programController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sort & Filter',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w900),),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(color: Colors.black,thickness: 0.1,),
            const SizedBox(height: 10,),
            const Text('Keyword Search.',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),

            const SizedBox(height: 10,),
            const Text('Search by Name, Keyword, Program...',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w300),),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),

                        hintText: 'Type here',
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    final provider = Provider.of<FilterProvider>(context, listen: false);
                    provider.addName(nameController.text.trim());
                    nameController.text='';
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Consumer<FilterProvider>(
              builder: (context, provider, child) {
                return Wrap(
                  direction: Axis.horizontal,
                  children: provider.names.map((name)=>
                      Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(name,style: const TextStyle(color: Colors.white),),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  provider.removeName(name);
                                },
                                child: const Icon(Icons.close,color: Colors.white,size: 15,),
                              )
                            ],
                          )
                      ),
                  ).toList(),
                );
              },
            ),
            /*Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('JARED',style: TextStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        Icon(Icons.close,color: Colors.white,size: 15,),
                      ],
                    )
                ),
              ],
            ),*/
            const SizedBox(height: 20,),
            const Divider(color: Colors.black,thickness: 0.1,),
            const SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Display Order',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  const Text('Select your preference for sorting results.',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Distance',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: Colors.black,thickness: 0.1,),
                  const SizedBox(height: 20,),
                ],
              ),
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Additional Options',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: const Divider(color: Colors.black,thickness: 0.1,),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Search by Region',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w700),),
                  const SizedBox(height: 5,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('State',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('City',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: const Divider(color: Colors.black,thickness: 0.1,),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Search by Program',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  const Text('Choose a minium and maximum rating',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  Consumer<FilterProvider>(
                    builder: (context, provider, child) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: programController,
                        onChanged: (String value){
                          provider.setProgram(value);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(
                                color: Colors.black,width: 2
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2
                            ),
                          ),
                          border: OutlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          hintText: 'Type Here',
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Text('Filer by Ratings',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  const Text('Choose a minium and maximum rating',style: TextStyle(fontSize:13,color: Colors.black,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Center(
                      child: SfRangeSlider(
                        min: 0,
                        max: 9,
                        values: _values,
                        interval: 1,
                        stepSize: 1,
                        showLabels: true,
                        activeColor: Colors.black,
                        onChanged: (SfRangeValues value) {
                          setState(() {
                            _values = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        alignment: Alignment.center,
                        child: const Text('SAVE CHANGES',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
