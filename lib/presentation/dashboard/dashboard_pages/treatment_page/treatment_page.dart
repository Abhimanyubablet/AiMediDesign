import 'package:ai_med_health/presentation/dashboard/dashboard_pages/treatment_page/treatment_for_hospital_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../consts/colors.dart';
import '../../model_page/treatment_model.dart';
import '../home_page.dart';
import '../hospital_page/hospital_profile.dart';

class TreatmentPage extends StatefulWidget {
  const TreatmentPage({super.key});

  @override
  State<TreatmentPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {

  List<treatmentCategoryModel> treatmentCategory = [
    treatmentCategoryModel(
      treatmentCategoryName: 'Cardiologist',
      treatmentCategoryIcon: 'assets/images/treatments/cardiology_img_icon.png',
    ),
    treatmentCategoryModel(
      treatmentCategoryName: "Neurologist",
      treatmentCategoryIcon: 'assets/images/treatments/neurology_img_icon.png',
    ),

    treatmentCategoryModel(
      treatmentCategoryName: 'Urologist',
      treatmentCategoryIcon: 'assets/images/treatments/oncology_img_icon.png',
    ),

    treatmentCategoryModel(
      treatmentCategoryName: 'Orthopedics',
      treatmentCategoryIcon: 'assets/images/treatments/ophthalmology_img_icon.png',
    ),

    treatmentCategoryModel(
      treatmentCategoryName: 'Ophthalmology',
      treatmentCategoryIcon: 'assets/images/treatments/orthopedic_img_icon.png',
    ),
    treatmentCategoryModel(
      treatmentCategoryName: 'Oncology ',
      treatmentCategoryIcon: 'assets/images/treatments/urologist_img_icon.png',
    ),
    treatmentCategoryModel(
      treatmentCategoryName: 'Pulmonology ',
      treatmentCategoryIcon: 'assets/images/treatments/pulmonology_img_icon.png',
    ),
    treatmentCategoryModel(
      treatmentCategoryName: 'Hematology ',
      treatmentCategoryIcon: 'assets/images/treatments/hematology_img_icon.png',
    ),
    treatmentCategoryModel(
      treatmentCategoryName: 'Rheumatology ',
      treatmentCategoryIcon: 'assets/images/treatments/rheumatology_img_icon.png',
    ),
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
                        hintText: 'Find your suitable treatment!',
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

                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Set the number of columns here
                          crossAxisSpacing: 5.0, // Adjust spacing between columns
                          mainAxisSpacing: 5.0, // Adjust spacing between rows
                        ),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: TreatmentForHopitalList(),
                                withNavBar: false,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white, // Set a background color if needed
                                borderRadius: BorderRadius.circular(20), // Set border radius
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Clip the image to the rounded corners
                                        child: Image.asset(
                                          treatmentCategory[index].treatmentCategoryIcon,
                                          fit: BoxFit.cover, // Adjust the fit to your requirements
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Text(
                                        treatmentCategory[index].treatmentCategoryName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
