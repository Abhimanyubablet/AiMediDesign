import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../../consts/colors.dart';
import '../running_walking_tracker/running_walking_tracker_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class WaterIntake extends StatefulWidget {
  const WaterIntake({super.key});

  @override
  State<WaterIntake> createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {

  int waterIntake = 0;

  void incrementWaterIntake() {
    setState(() {
      waterIntake += 1;
    });
  }

  void decrementWaterIntake() {
    setState(() {
      if (waterIntake > 0) {
        waterIntake -= 1;
      }
    });
  }

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
                            "Water Intake",
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

                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text("Today",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ),

                   Container(
                     margin: EdgeInsets.only(left: 20,right: 20,),
                     child: Column(
                       children: [
                         Container(
                           child: Text("1200ml",style: TextStyle(fontSize: 25,color: bgColor,fontWeight: FontWeight.w500),),
                         ),
                         Container(
                           child: Text("of 4000ml",style: TextStyle(color: Colors.black54)),
                         ),
                       ],
                     ),
                   ),

                   SizedBox(
                     height: 10,
                   ),

                   Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10)

                     ),
                     child: Column(
                       children: [
                         Container(
                           child: Text("You haven't not drink water since 08:00 AM."),
                         ),
                         Container(
                           child: Text("Take a full glass of water."),
                         ),
                       ],
                     ),
                   ),

                   Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             GestureDetector(
                               onTap:(){decrementWaterIntake();},
                               child: Container(
                                 child: Text("-",style: TextStyle(fontSize: 28,color: Colors.blue),),
                               ),
                             ),
                             Container(
                               child: Row(
                                 children: [
                                   Container(
                                       height:50,
                                       width: 50,
                                      child: Image.asset("assets/images/fitness/glass_image_icon.png"),
                                   ),
                                   Container(
                                     child: Column(
                                       children: [
                                          Container(
                                            child: Text("${waterIntake} glass",style: TextStyle(fontSize: 18)),
                                          )
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             GestureDetector(
                               onTap:(){incrementWaterIntake();},
                               child: Container(
                                 child: Text("+",style: TextStyle(fontSize: 28,color: Colors.blue)),
                               ),
                             ),

                           ],
                         ),
                         Container(
                           width: double.infinity,
                           child: ElevatedButton(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.blue, // Change this to the desired color
                             ),
                             child: Text("Add water log",style: TextStyle(color: Colors.white),),
                           ),
                         ),


                       ],
                     ),
                   ),

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left) of the cross axis
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 20),
                         child: Text(
                           "History",
                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.all(20),
                         width: double.infinity,
                         height: 200,
                         child: SimpleBarSleepChart.withSampleData(),
                       ),
                     ],
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

class SimpleBarSleepChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList; // Update the type here
  final bool animate;

  SimpleBarSleepChart(this.seriesList, {required this.animate});

  factory SimpleBarSleepChart.withSampleData() {
    return SimpleBarSleepChart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() { // Update the type here
    final data = [
      OrdinalSales('Mon', 75),
      OrdinalSales('Tue', 87),
      OrdinalSales('Wed', 93),
      OrdinalSales('Thus', 52),
      OrdinalSales('Fri', 82),
      OrdinalSales('Sat', 92),
      OrdinalSales('Sun', 80),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }
}
