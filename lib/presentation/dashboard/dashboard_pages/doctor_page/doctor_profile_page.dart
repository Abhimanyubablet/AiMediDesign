import 'dart:math';

import 'package:ai_med_health/presentation/dashboard/dashboard_pages/appointment/appointment.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/doctor_page/tabbar_pages/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../consts/colors.dart';
import '../../model_page/doctor_list_model.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage>
    with SingleTickerProviderStateMixin {

  late TabController tabController;
  List<doctorProfileReviewModel> doctorProfileReview = [
    doctorProfileReviewModel(
        doctorProfileReviewName: 'Sadia',
        doctorProfileReviewDate: 'oct 31,2023',
        doctorProfileReviewImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
    doctorProfileReviewModel(
        doctorProfileReviewName: 'Bureau',
        doctorProfileReviewDate: 'sept 12,2023',
        doctorProfileReviewImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    doctorProfileReviewModel(
        doctorProfileReviewName: 'Asshish ',
        doctorProfileReviewDate: 'sept 29,2023',
        doctorProfileReviewImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
                            "Doctor Profile",
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
                            icon: Icon(Icons.share),
                            color: Colors.black54,
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                          ),
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
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Image.network(
                                "https://marketplace.canva.com/EAFfJd20pe8/2/0/1600w/canva-blue-minimalist-online-doctor-consultation-site-banner-4yRR6lGPb1o.jpg")),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Dr. Cayden Stack",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "MBBS - Gynecology",
                                  style:
                                  TextStyle(fontSize: 13, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.black54,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Patient",
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 13),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "2.05K",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.black54,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Review",
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 13),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "5.3K",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.watch,
                                      color: Colors.black54,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Experience",
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 12),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "7 Years",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
                  Container(
                    child: DefaultTabController(
                      length: 3,
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
                                    Tab(text: 'Info'),
                                    Tab(text: 'Experience'),
                                    Tab(text: 'Review'),
                                  ],
                                  controller: tabController, // assign the controller
                                ),
                              ),
                              Container(
                                height: 400,
                                child: TabBarView(
                                  controller: tabController, // assign the controller
                                  children: [

                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "About Doctor",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              "Doctors are medical professionals trained to diagnose, treat, and prevent illnesses and injuries.They play a crucial role in promoting health and well-being within communities worldwide.",
                                              style: TextStyle(color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                "Amercan Medical College & Hospital",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Designisation",
                                                style:
                                                TextStyle(color: Colors.black54),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child:
                                              Text("Residential medical office"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Department",
                                                style:
                                                TextStyle(color: Colors.black54),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text("Gynae and abs"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Employment Peroid",
                                                style:
                                                TextStyle(color: Colors.black54),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child:
                                              Text("Jan 1 ,2017 - Jun 15,2021"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                            child: Text(
                                              "Review (3)",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: doctorProfileReview.length,
                                            itemBuilder: (context, index) {
                                              var doctor = doctorProfileReview[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  // PersistentNavBarNavigator.pushNewScreen(
                                                  //   context,
                                                  //   screen: DoctorProfilePage(),
                                                  //   withNavBar: false,
                                                  // );
                                                },
                                                child: Container(
                                                  color: Colors.white,

                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(8),
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 5),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 50,
                                                                        width: 50,
                                                                        child:
                                                                        CircleAvatar(
                                                                          backgroundImage:
                                                                          NetworkImage(
                                                                              doctor.doctorProfileReviewImage),
                                                                          radius:
                                                                          25, // adjust the radius as needed
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width: 12),
                                                                      Container(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            Container(
                                                                              child:
                                                                              Text(
                                                                                doctor.doctorProfileReviewName,
                                                                                style:
                                                                                TextStyle(
                                                                                  fontSize:
                                                                                  16,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              child:
                                                                              Text(
                                                                                doctor.doctorProfileReviewDate,
                                                                                style:
                                                                                TextStyle(
                                                                                  fontSize:
                                                                                  12,
                                                                                  color:
                                                                                  Colors.black54,
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
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        child: RatingBar
                                                                            .builder(
                                                                          minRating:
                                                                          1,
                                                                          itemSize:
                                                                          14.0,
                                                                          direction: Axis
                                                                              .horizontal,
                                                                          allowHalfRating:
                                                                          true,
                                                                          itemCount:
                                                                          5,
                                                                          itemBuilder:
                                                                              (context,
                                                                              _) =>
                                                                              Icon(
                                                                                Icons
                                                                                    .star,
                                                                                color: Colors
                                                                                    .amberAccent,
                                                                              ),
                                                                          onRatingUpdate:
                                                                              (double
                                                                          value) {},
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width: 3),
                                                                      Container(
                                                                        child: Text(
                                                                          "4.9",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            12,
                                                                            color: Colors
                                                                                .black54,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width: 3),
                                                                      Container(
                                                                        child: Text(
                                                                          "(5,380)",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            12,
                                                                            color: Colors
                                                                                .black54,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.black54,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(height: 10,),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.only(left: 10, top: 10),
                                              child: Text(
                                                "Tap here for all reviews",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: bgColor
                                                ),
                                              ),
                                            ),
                                          ),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 13.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Colors.black, width: 1.0), // Border properties
                  ),
                ),
                icon: Icon(
                  Icons.videocam,
                  color: bgColor,
                ), // Video call icon as prefix
                label: Text(
                  'Call',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: bgColor),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                // onPressed: _performSignIn,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Appointment(),));
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
                  'Book',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
