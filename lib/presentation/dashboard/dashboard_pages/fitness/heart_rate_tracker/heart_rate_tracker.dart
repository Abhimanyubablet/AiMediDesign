import 'package:flutter/material.dart';

import '../../../../../consts/colors.dart';
import 'line_chat.dart';

class HeartRateTracker extends StatefulWidget {
  const HeartRateTracker({super.key});

  @override
  State<HeartRateTracker> createState() => _HeartRateTrackerState();
}

class _HeartRateTrackerState extends State<HeartRateTracker> {

  double _value = 84.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: Column(
        children: [
          Container(
            height: 103,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.blue,
                            ),
                            color: Colors.black54,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text(
                            "Heart Rate",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(
                      height: 30,
                    ),

                   Column(
                     children: [
                       Container(
                         child: Text("Today",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                       ),

                       Container(
                         child: Text("84 bpm",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w600,fontSize: 24,),),
                       ),
                     ],
                   ),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 300,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      child: CustomLineChart(),
                    ),

                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text("Min",style: TextStyle(fontSize: 17,color: Colors.black54),),
                              ),
                              Container(
                                child: Text("50",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text('Average',style: TextStyle(fontSize: 17,color: Colors.black54),),
                              ),
                              Container(
                                child: Text("84",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text("Max",style: TextStyle(fontSize: 17,color: Colors.black54),),
                              ),
                              Container(
                                child: Text("160",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: Text(
                        'Value: $_value',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),

                    Container(
                      child: Slider(
                        value: _value,
                        min: 50.0,
                        max: 160.0,
                        divisions: 110, // 160 - 50 = 110 divisions
                        label: '$_value',
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),

                  ],
                ),
              )
          )
        ],
      ),

    );
  }
}
