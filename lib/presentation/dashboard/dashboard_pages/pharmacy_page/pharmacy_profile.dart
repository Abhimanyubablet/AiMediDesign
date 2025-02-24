import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../consts/colors.dart';
import '../../model_page/doctor_list_model.dart';
import '../../model_page/pharmacy_model_page.dart';

class PharmacyProfile extends StatefulWidget {
  const PharmacyProfile({super.key});

  @override
  State<PharmacyProfile> createState() => _PharmacyProfileState();
}

class _PharmacyProfileState extends State<PharmacyProfile> with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<pharmacyProfileReviewModel> pharmacyProfileReview = [
    pharmacyProfileReviewModel(
        pharmacyProfileReviewName: 'Sadia',
        pharmacyProfileReviewDate: 'oct 31,2023',
        pharmacyProfileReviewImage: 'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg'),
    pharmacyProfileReviewModel(
        pharmacyProfileReviewName: 'Bureau',
        pharmacyProfileReviewDate: 'sept 12,2023',
        pharmacyProfileReviewImage: 'https://media.istockphoto.com/id/1163538605/photo/laughing-teenager-with-folded-arms.jpg?b=1&s=612x612&w=0&k=20&c=ZVC6TKuT_nYis0XZMgVjFw-3u_4qo6pwv7D66LTUJNY='),
    pharmacyProfileReviewModel(
        pharmacyProfileReviewName: 'Asshish ',
        pharmacyProfileReviewDate: 'sept 29,2023',
        pharmacyProfileReviewImage: 'https://www.shutterstock.com/image-photo/smiling-middle-aged-african-american-600nw-2099982595.jpg'),
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
                            "Pharmacy Profile",
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
                                "https://s3-ap-south-1.amazonaws.com/ricedigitals3bucket/AUPortalContent/2023/06/09133120/Why-study-Pharmacy-Future-Prospects-Opportunities.png")),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "JPG Pharmacy",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Kolkata, West Bengal",
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
                                            "10.20K",
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
                                            "2.65K",
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
                                            "10 Years",
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
                                    Tab(text: 'Overview',),
                                    Tab(text: 'Experience'),
                                    Tab(text: 'Review'),
                                  ],
                                  controller: tabController, // assign the controller
                                ),
                              ),
                              Container(
                                height: 300,
                                child: TabBarView(
                                  controller: tabController, // assign the controller
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10,),
                                          Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(child: Text("Address :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: bgColor),),),
                                                  Container(
                                                    // width: 250,
                                                    child: Text("5a, Sadananda Rd, Hazra, Kalighat, Kolkata, West Bengal 700026",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(child: Text("Phone : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: bgColor),),),
                                                  Container(
                                                    child: Text(" 09245367867",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(child: Text("Opening Time : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: bgColor),),),
                                                  Container(
                                                    child: Text("09:30 AM (Mon-Sat) ",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(child: Text("Closing Time : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: bgColor),),),
                                                  Container(
                                                    child: Text("08:30 PM (Mon-Sat)",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                                  ),
                                                ],
                                              )
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
                                                "JPG Pharmaceutical Shop",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: bgColor
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
                                              Text("Residential medical office",style: TextStyle(fontSize: 12),),
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
                                              child: Text("General sales list and Prescription only medication",style: TextStyle(fontSize: 12),),
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
                                              Text("Jan 1 ,2014 - Working",style: TextStyle(fontSize: 12),),
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
                                            itemCount: pharmacyProfileReview.length,
                                            itemBuilder: (context, index) {
                                              var pharmacyProfile = pharmacyProfileReview[index];
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
                                                                              pharmacyProfile.pharmacyProfileReviewImage),
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
                                                                                pharmacyProfile.pharmacyProfileReviewName,
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
                                                                                pharmacyProfile.pharmacyProfileReviewDate,
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
                                                            width: 0.1,
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
            Expanded(
              child: ElevatedButton(
                // onPressed: _performSignIn,
                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => HospitalDoctorList(),));
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
                  'Upload Prescriptions',
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
