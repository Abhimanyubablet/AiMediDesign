import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../consts/colors.dart';
import '../../../model_page/fitness_model_page.dart';
import '../running_walking_tracker/running_walking_tracker_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {

  List<sleepTimeModel> sleepTracker = [
    sleepTimeModel(
      sleeptrackingTime: '6h 47m',
      sleeptrackingDate: '07-04-2024',
        sleeptrackingScore:"Sleep Score : 75"

    ),
    sleepTimeModel(
       sleeptrackingTime: '7h 47m',
       sleeptrackingDate: '06-04-2024',
        sleeptrackingScore:"Sleep Score : 87"

    ),
    sleepTimeModel(
      sleeptrackingTime: '8h 10m',
      sleeptrackingDate: '05-04-2024',
        sleeptrackingScore:"Sleep Score : 93"
    ),
    sleepTimeModel(
      sleeptrackingTime: '4h 23m',
      sleeptrackingDate: '04-04-2024',
        sleeptrackingScore:"Sleep Score : 52"
    ),
  ];


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
                            "Sleep Tracker",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "75",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Total Score",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 7,),
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "6h 47m",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Sleep hours",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 200,
                      child: SimpleBarSleepChart.withSampleData(),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child: Text("Recent Sleep Record",style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                    ),

                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sleepTracker.length,
                        itemBuilder: (context, index) {
                          final entry = sleepTracker[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(20),
                            width: 180,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: lightGray, // Assuming grayforphone is a color variable
                                        child: Icon(Icons.sledding_sharp,color: Colors.green,),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Text(entry.sleeptrackingDate, style: TextStyle(color: Colors.green),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Text(entry.sleeptrackingTime, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                ),
                                Container(
                                  child: Text(entry.sleeptrackingScore,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),
              )
          ),
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