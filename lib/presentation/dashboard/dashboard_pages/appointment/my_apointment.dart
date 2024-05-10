import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../consts/colors.dart';
import '../../model_page/doctor_list_model.dart';
import '../../model_page/my_aapointment_model.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {

  List<upcomingAppointModel> upcomingdoctorList = [
    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Taylor Samaro',
        upcomingDoctorSpecialist: 'Dentist',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'
    ),
    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Chirs',
        upcomingDoctorSpecialist: 'Gynecology',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'
    ),
    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Asshish ',
        upcomingDoctorSpecialist: 'Dentist',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),

    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Rooma ',
        upcomingDoctorSpecialist: 'Gynecology',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg'),

    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Iker Bureau',
        upcomingDoctorSpecialist: 'Dentist',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg'),
    upcomingAppointModel(
        upcomingDoctorName: 'Dr. Akshu ',
        upcomingDoctorSpecialist: 'Gynecology',
        upcomingDoctorAppointDate: '20 june 2024',
        upcomingDoctorImage: 'https://familydoctor.org/wp-content/uploads/2018/02/41808433_l.jpg'),

  ];

  List<pastAppointModel> pastdoctorList = [
    pastAppointModel(
        pastDoctorName: 'Dr. Taylor Samaro',
        pastDoctorSpecialist: 'Dentist',
        pastDoctorAppointDate: '01 jan 2024',
        pastDoctorImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'
    ),
    pastAppointModel(
        pastDoctorName: 'Dr. Chirs',
        pastDoctorSpecialist: 'Gynecology',
        pastDoctorAppointDate: '01 jan 2024',
        pastDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'
    ),
    pastAppointModel(
        pastDoctorName: 'Dr. Asshish ',
        pastDoctorSpecialist: 'Dentist',
        pastDoctorAppointDate: '01 jan 2024',
        pastDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),

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
                            "My Appointments",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
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
                            icon: Icon(Icons.dehaze_outlined),
                            color: Colors.blue,
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width: 0.1,
                      ),
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
                    child: DefaultTabController(
                      length: 2,
                      child: Builder(
                        builder: (BuildContext context) {
                          final TabController tabController =
                          DefaultTabController.of(context)!;

                          return Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: TabBar(
                                  tabs: [
                                    Tab(text: 'Upcoming',),
                                    Tab(text: 'Past'),
                                  ],
                                  controller: tabController, // assign the controller
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height:650,
                                child: TabBarView(
                                  controller: tabController, // assign the controller
                                  children: [

                                    SingleChildScrollView(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: upcomingdoctorList.length,
                                        itemBuilder: (context, index) {
                                          var doctor = upcomingdoctorList[index];
                                          return GestureDetector(
                                            onTap: (){
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(8),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(left: 20, right: 20),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 70,
                                                                        width: 70,
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          child: Image.network(
                                                                            doctor.upcomingDoctorImage,
                                                                            fit: BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 12),
                                                                      Container(
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              child: Text(
                                                                                doctor.upcomingDoctorName,
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            Container(
                                                                              child: Text(
                                                                                doctor.upcomingDoctorSpecialist,
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  color: Colors.black54,
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            Row(
                                                                              children: [
                                                                                Container(
                                                                                  child: Icon(Icons.calendar_month,size: 16,),
                                                                                ),
                                                                                Container(
                                                                                  child: Text(
                                                                                    doctor.upcomingDoctorAppointDate,
                                                                                    style: TextStyle(
                                                                                      fontSize: 12,
                                                                                      color: Colors.black54,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        child: CircleAvatar(
                                                                          radius: 25,
                                                                          backgroundColor: grayforphone,
                                                                          child: Icon(Icons.phone,color: bgColor,),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 4,
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          color: grayforphone,
                                                                          borderRadius: BorderRadius.circular(50), // Adjust the value as needed
                                                                        ),
                                                                        padding: EdgeInsets.all(5),
                                                                        child: Text(
                                                                          "RUNNING",
                                                                          style: TextStyle(fontSize: 10,color: Colors.brown),
                                                                        ),
                                                                      ),


                                                                    ],
                                                                  ),),
                                                              ],
                                                            ),
                                                            SizedBox(height: 20),
                                                          ],
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //       color: Colors.black54,
                                                      //       width: 0.5,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    SingleChildScrollView(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: pastdoctorList.length,
                                        itemBuilder: (context, index) {
                                          var doctor = pastdoctorList[index];
                                          return GestureDetector(
                                            onTap: (){
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(8),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(left: 20, right: 20),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 70,
                                                                        width: 70,
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          child: Image.network(
                                                                            doctor.pastDoctorImage,
                                                                            fit: BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 12),
                                                                      Container(
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              child: Text(
                                                                                doctor.pastDoctorName,
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            Container(
                                                                              child: Text(
                                                                                doctor.pastDoctorSpecialist,
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  color: Colors.black54,
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            Row(
                                                                              children: [
                                                                                Container(
                                                                                  child: Icon(Icons.calendar_month,size: 16,),
                                                                                ),
                                                                                Container(
                                                                                  child: Text(
                                                                                    doctor.pastDoctorAppointDate,
                                                                                    style: TextStyle(
                                                                                      fontSize: 12,
                                                                                      color: Colors.black54,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        child: CircleAvatar(
                                                                          radius: 25,
                                                                          backgroundColor: grayforphone,
                                                                          child: Icon(Icons.phone,color: bgColor,),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 4,
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          color: grayforphone,
                                                                          borderRadius: BorderRadius.circular(50), // Adjust the value as needed
                                                                        ),
                                                                        padding: EdgeInsets.all(5),
                                                                        child: Text(
                                                                          "COMPLETE",
                                                                          style: TextStyle(fontSize: 10,color: Colors.brown),
                                                                        ),
                                                                      ),


                                                                    ],
                                                                  ),),
                                                              ],
                                                            ),
                                                            SizedBox(height: 20),
                                                          ],
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //       color: Colors.black54,
                                                      //       width: 0.5,
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 8,),
                                              ],
                                            ),
                                          );
                                        },
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
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
