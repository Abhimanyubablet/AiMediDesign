import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../../../consts/colors.dart';
import '../../../model_page/fitness_model_page.dart';

class RunningWalkingTrackerPage extends StatefulWidget {
  const RunningWalkingTrackerPage({Key? key}) : super(key: key);

  @override
  State<RunningWalkingTrackerPage> createState() => _RunningWalkingTrackerPageState();
}

class _RunningWalkingTrackerPageState extends State<RunningWalkingTrackerPage> {

  List<filnessTimeModel> runningTracker = [
    filnessTimeModel(
     trackingDistance: '3:00',
      trackingDate: '07-04-2024',
    ),
    filnessTimeModel(
      trackingDistance: '3:20',
      trackingDate: '06-04-2024',
    ),
    filnessTimeModel(
      trackingDistance: '3:47',
      trackingDate: '05-04-2024',
    ),
    filnessTimeModel(
      trackingDistance: '3:67',
      trackingDate: '04-04-2024',
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
                            "Running & Walking Tracker",
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
                                    "25",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Total Miles",
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
                                    "10 m/s",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Avg.Pace",
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
                      child: SimpleBarChart.withSampleData(),
                    ),

                     Container(
                       margin: EdgeInsets.only(left: 20,right: 20),
                       child: Text("Recent Routes",style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                     ),

                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: runningTracker.length,
                        itemBuilder: (context, index) {
                          final entry = runningTracker[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(20),
                            width: 200,
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
                                        child: Icon(Icons.location_on_rounded,color: Colors.green,),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Text(entry.trackingDate, style: TextStyle(color: Colors.green),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Text(entry.trackingDistance, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                ),
                                Container(
                                  child: Text("Miles",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
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

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList; // Update the type here
  final bool animate;

  SimpleBarChart(this.seriesList, {required this.animate});

  factory SimpleBarChart.withSampleData() {
    return SimpleBarChart(
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
      OrdinalSales('Mon', 15),
      OrdinalSales('Tue', 25),
      OrdinalSales('Wed', 50),
      OrdinalSales('Thu', 55),
      OrdinalSales('Fri', 45),
      OrdinalSales('Sat', 47),
      OrdinalSales('Sat', 57),
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

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}


