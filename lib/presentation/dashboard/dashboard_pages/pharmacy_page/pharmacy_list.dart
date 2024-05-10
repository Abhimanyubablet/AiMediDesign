import 'package:ai_med_health/presentation/dashboard/dashboard_pages/pharmacy_page/pharmacy_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../consts/colors.dart';
import '../../model_page/pharmacy_model_page.dart';

class PharmacyList extends StatefulWidget {
  const PharmacyList({super.key});

  @override
  State<PharmacyList> createState() => _PharmacyListState();
}

class _PharmacyListState extends State<PharmacyList> {

  List<pharmacyListModel> pharmacyList = [
    pharmacyListModel(
        pharmacyListName: 'JPG Pharmacy ',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://www.royalcarehospital.in/wp-content/uploads/2021/03/pharmacy-1.jpg'),
    pharmacyListModel(
        pharmacyListName: 'Amaira Pharmacy',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://www.rasmussen.edu/images/rasmussenlibraries/blogs/school-of-health-sciences/2023/working-in-a-pharmacy-og.png'),
    pharmacyListModel(
        pharmacyListName: 'Lokenath Pharmacy',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://www.nationalhealthexecutive.com/sites/nhe/files/styles/banner/public/2023-12/Pharmacy%20concept.jpg?itok=Eh9DOKi4'),
    pharmacyListModel(
        pharmacyListName: 'Sanjivani Pharmacy',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://workbc.b89n0c-dev.nimbus.cloud.gov.bc.ca/sites/default/files/styles/hero_image/public/NTI5NzE_G0d33POkoYQsczTb-3131-NOC.jpg?itok=ON052Z0K'),

    pharmacyListModel(
        pharmacyListName: 'Apollo Pharmacy',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://www.clinicalpharmacy.in/sitepad-data/uploads/2022/05/istockphoto-1248170454-612x612.jpg'),
    pharmacyListModel(
        pharmacyListName: 'Shree Shyam Pharmacy',
        pharmacyListLocation: 'Kolkata, West Bengal',
        pharmacyListImage: 'https://thumbs.dreamstime.com/b/portrait-male-pharmacist-pharmacy-16753524.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: Column(
        children: [
          Container(
            height: 190,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child:  Row(
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
                                offset: Offset(
                                    0, 1), // changes position of shadow
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
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
                                offset: Offset(
                                    0, 1), // changes position of shadow
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
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        errorText: null,
                        prefixIcon: Icon(
                            Icons.search), // Use prefixIcon instead of prefix
                        hintText: 'Find your suitable pharmacy!',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              width: 0.3,
                              color: Colors.white), // Set border width to 0.3
                        ),
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

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Top Pharmacy ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left, // Align text to the left
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pharmacyList.length,
                      itemBuilder: (context, index) {
                        var pharmacy = pharmacyList[index];
                        return GestureDetector(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: PharmacyProfile(),
                              withNavBar: false,
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  pharmacy.pharmacyListImage,
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
                                                      pharmacy.pharmacyListName,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: RatingBar.builder(
                                                            minRating: 1,
                                                            itemSize: 14.0,
                                                            direction: Axis.horizontal,
                                                            allowHalfRating: true,
                                                            itemCount: 5,
                                                            itemBuilder: (context, _) => Icon(
                                                              Icons.star,
                                                              color: Colors.amberAccent,
                                                            ),
                                                            onRatingUpdate: (double value) {},
                                                          ),
                                                        ),
                                                        SizedBox(width: 3),
                                                        Container(
                                                          child: Text(
                                                            "4.9",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black54,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 3),
                                                        Container(
                                                          child: Text(
                                                            "(5,380)",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black54,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      pharmacy.pharmacyListLocation,
                                                      style: TextStyle(
                                                        fontSize: 12,
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
                                      SizedBox(height: 10),
                                    ],
                                  ),
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
                        );
                      },
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
