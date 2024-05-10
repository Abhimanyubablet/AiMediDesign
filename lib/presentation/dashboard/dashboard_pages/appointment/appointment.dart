import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../consts/colors.dart';
import '../../model_page/appointment_model.dart';
import '../doctor_page/doctor_details_page.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool isHovered = false;

  List<monthModel> monthAppointment = [
    monthModel(
        monthDay: 'Mon',
        monthDate: '10',
      ),
    monthModel(
      monthDay: 'Tue',
      monthDate: '11',
    ),
    monthModel(
      monthDay: 'Wed',
      monthDate: '12',
    ),
    monthModel(
      monthDay: 'Thu',
      monthDate: '13',
    ),
    monthModel(
      monthDay: 'Fri',
      monthDate: '14',
    ),
    monthModel(
      monthDay: 'Sat',
      monthDate: '15',
    ),



  ];

  List<morningSlotModel> morningAppointment = [
  morningSlotModel(
  morningTime: '10:30 AM',
  ),
  morningSlotModel(
  morningTime: '11:00 AM',
  ),
  morningSlotModel(
  morningTime: '11:30 AM',
  ),
];

  List<afternoonSlotModel> afternoonAppointment = [
    afternoonSlotModel(
      afternoonTime: '12:30 PM',
    ),
    afternoonSlotModel(
      afternoonTime: '01:00 PM',
    ),
    afternoonSlotModel(
      afternoonTime: '01:30 PM',
    ),
    afternoonSlotModel(
      afternoonTime: '01:45 PM',
    ),
    afternoonSlotModel(
      afternoonTime: '02:00 PM',
    ),
    afternoonSlotModel(
      afternoonTime: '02:30 PM',
    ),
  ];

  List<eveningSlotModel> eveningAppointment = [
    eveningSlotModel(
      eveningTime: '05:30 PM',
    ),
    eveningSlotModel(
      eveningTime: '05:45 PM',
    ),
    eveningSlotModel(
      eveningTime: '06:00 PM',
    ),
    eveningSlotModel(
      eveningTime: '06:15 PM',
    ),
    eveningSlotModel(
      eveningTime: '07:00 PM',
    ),
    eveningSlotModel(
      eveningTime: '08:30 PM',
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
                                offset: Offset(0, 1),
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
                            "Appointment",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
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
                                offset: Offset(0, 1),
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
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://marketplace.canva.com/EAFfJd20pe8/2/0/1600w/canva-blue-minimalist-online-doctor-consultation-site-banner-4yRR6lGPb1o.jpg",
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "November",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: monthAppointment.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHovered = false;
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: isHovered ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                      isHovered ? Colors.white : Colors.black54,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          monthAppointment[index].monthDay,
                                          style: TextStyle(
                                            color:
                                            isHovered ? Colors.white : Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          monthAppointment[index].monthDate,
                                          style: TextStyle(
                                            color:
                                            isHovered ? Colors.white : Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Morning Slots",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: morningAppointment.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHovered = false;
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: isHovered ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color:
                                      isHovered ? Colors.white : Colors.black54,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          child: Text(
                                            morningAppointment[index].morningTime,
                                            style: TextStyle(
                                              color:
                                              isHovered ? Colors.white : Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Afternoon Slots",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                            shrinkWrap: true, // Allow GridView to scroll as parent
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Set grid count to 3
                              crossAxisSpacing: 2.0, // Add some horizontal spacing
                              mainAxisSpacing: 2.0, // Add some vertical spacing
                              childAspectRatio: 220 / 100, // Adjust itemWidth and itemHeight according to your needs

                            ),
                            itemCount: afternoonAppointment.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHovered = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isHovered ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isHovered ? Colors.white : Colors.black54,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          child: Text(
                                            afternoonAppointment[index].afternoonTime,
                                            style: TextStyle(
                                              color: isHovered ? Colors.white : Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Evening Slots",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                            shrinkWrap: true, // Allow GridView to scroll as parent
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Set grid count to 3
                              crossAxisSpacing: 2.0, // Add some horizontal spacing
                              mainAxisSpacing: 2.0, // Add some vertical spacing
                              childAspectRatio: 220 / 100, // Adjust itemWidth and itemHeight according to your needs
                            ),
                            itemCount: eveningAppointment.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHovered = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isHovered ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isHovered ? Colors.white : Colors.black54,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          child: Text(
                                            eveningAppointment[index].eveningTime,
                                            style: TextStyle(
                                              color: isHovered ? Colors.white : Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Fee Information",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isHovered ? Colors.blue : Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.phone,color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text("Voice Call",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      child: Text("Can make a voice call",style: TextStyle(color: Colors.black54),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "\$20",
                              style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isHovered ? Colors.blue : Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.video_camera_back_rounded,color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text("Voice Call",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      child: Text("Can make a voice call",style: TextStyle(color: Colors.black54),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "\$30",
                              style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isHovered ? Colors.blue : Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.chat,color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text("Messaging",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      child: Text("Can make a message",style: TextStyle(color: Colors.black54),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "\$10",
                              style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),

        child: ElevatedButton(
          // onPressed: _performSignIn,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorDetailsPage()));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: bgColor,
            padding: EdgeInsets.symmetric(vertical: 13.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Request For Appointment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
