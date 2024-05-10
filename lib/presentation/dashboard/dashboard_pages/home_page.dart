import 'package:ai_med_health/consts/colors.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/pharmacy_page/pharmacy_list.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/treatment_page/treatment_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../model_page/dashboard_home_model.dart';
import 'appointment/appointment.dart';
import 'doctor_page/doctor_list_page.dart';
import 'fitness/fitness.dart';
import 'health_and_wellness/health_and_wellness.dart';
import 'hospital_page/hospital_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'assets/images/home_banner_one.jpg',
    'assets/images/banner_two_img.png',
    'assets/images/banner_three_img.png',
  ];


  void _navigateToCategoryPage(String categoryNavigate) {
    // You can add more conditions if needed for other pages
    if (categoryNavigate == 'DoctorListPage') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: DoctorListPage(),
        withNavBar: true,
      );
    }

   else if (categoryNavigate == 'HospitalListPage') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: HospitalListPage(),
        withNavBar: true,
      );
    }

    else if (categoryNavigate == 'TreatmentPage') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: TreatmentPage(),
        withNavBar: true,
      );
    }

    else if (categoryNavigate == 'Appointment') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: Appointment(),
        withNavBar: false,
      );
    }

    else if (categoryNavigate == 'PharmacyList') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: PharmacyList(),
        withNavBar: true,
      );
    }

    else if (categoryNavigate == 'HealthWellness') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: HealthWellness(),
        withNavBar: true,
      );
    }

    else if (categoryNavigate == 'Fitness') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: Fitness(),
        withNavBar: true,
      );
    }

  }

  List<DashboardHomeCategoryModel> heathCategory = [
    DashboardHomeCategoryModel(
      healthCategoryName: 'Doctor',
      healthCategoryIcon: 'assets/images/doctor_image_icon.png',
      healthCategoryNavigate: 'DoctorListPage',
    ),
    DashboardHomeCategoryModel(
      healthCategoryName: "Hospital",
      healthCategoryIcon: 'assets/images/hospital_image_icon.png',
      healthCategoryNavigate: 'HospitalListPage',
    ),

    DashboardHomeCategoryModel(
      healthCategoryName: 'Treatm...',
      healthCategoryIcon: 'assets/images/treatments_image_icon.png',
      healthCategoryNavigate: 'TreatmentPage',
    ),

    DashboardHomeCategoryModel(
      healthCategoryName: 'Appointm...',
      healthCategoryIcon: 'assets/images/appointment_image_icon.png',
      healthCategoryNavigate: 'Appointment',
    ),


    DashboardHomeCategoryModel(
      healthCategoryName: 'Pharmac...',
      healthCategoryIcon: 'assets/images/pharmacy_image_icon.png',
      healthCategoryNavigate: 'PharmacyList',
    ),
    DashboardHomeCategoryModel(
      healthCategoryName: 'Wellness...',
      healthCategoryIcon: 'assets/images/health_wellness_icon_img.png',
      healthCategoryNavigate: '',
    ),
    DashboardHomeCategoryModel(
      healthCategoryName: 'Fitness',
      healthCategoryIcon: 'assets/images/fitness_icon_img.png',
      healthCategoryNavigate: 'Fitness',
    ),
    DashboardHomeCategoryModel(
      healthCategoryName: 'MedGPT',
      healthCategoryIcon: 'assets/images/med_gpt_icon_img.png',
      healthCategoryNavigate: '',
    ),
  ];

  List<TopDoctorCategoryModel> TopDoctor = [
    TopDoctorCategoryModel(
        topDoctorName: 'Dr. Taylor Samaro',
        topDoctorspecilist: 'Dental Sargon',
        topDoctorImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
    TopDoctorCategoryModel(
        topDoctorName: 'Dr. Iker Bureau',
        topDoctorspecilist: 'Dental Sargon',
        topDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    TopDoctorCategoryModel(
        topDoctorName: 'Dr. Asshish ',
        topDoctorspecilist: 'Physiotheripist',
        topDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),
    TopDoctorCategoryModel(
        topDoctorName: 'Dr. Rooma ',
        topDoctorspecilist: 'Homeopathic',
        topDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),
  ];

  List<TopHospitalCategoryModel> TopHospital = [
    TopHospitalCategoryModel(
        topHospitalName: 'Mac Hospital',
        topHospitalLocation: 'Kolkata, West Begal',
        topHospitalImage: 'https://images.pexels.com/photos/236380/pexels-photo-236380.jpeg?cs=srgb&dl=pexels-pixabay-236380.jpg&fm=jpg'
    ),
    TopHospitalCategoryModel(
        topHospitalName: 'Appolo Hospital',
        topHospitalLocation: 'Patna,Bihar',
        topHospitalImage: 'https://d.newsweek.com/en/full/1570341/fe-tophospitals-01.jpg'
    ),
    TopHospitalCategoryModel(
        topHospitalName: 'Holy Family Hospital',
        topHospitalLocation: 'Kolkata, West Begal',
        topHospitalImage: 'https://d.newsweek.com/en/full/1570341/fe-tophospitals-01.jpg'
    ),
    TopHospitalCategoryModel(
        topHospitalName: 'Kolkata Medical College',
        topHospitalLocation: 'Kolkata, West Begal',
        topHospitalImage: 'https://media.istockphoto.com/id/489041732/photo/modern-hospital-building.jpg?s=612x612&w=0&k=20&c=o7p8qoMFYC0VdU8jhf-L3QJmZuj-NfLzyD5bvm1N1yg='
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: bgColor,
                                child: Text("S",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "Welcome",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Hey, Samantha!",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
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
                                  Icons.notifications_none,
                                  color: Colors.blue,
                                ),
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
                        )
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
                        hintText: 'Find your suitable doctor!',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              width: 0.1
                          ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        ),
                        child: Swiper(
                          autoplay: true,
                          itemCount: imageUrls.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.5, // Adjust the multiplier as needed
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
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              _navigateToCategoryPage(heathCategory[index].healthCategoryNavigate);
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
                                          heathCategory[index].healthCategoryIcon,
                                          fit: BoxFit.cover, // Adjust the fit to your requirements
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Text(
                                        heathCategory[index].healthCategoryName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
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


                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Top Doctor",
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
                  Container(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: TopDoctor.length,
                      itemBuilder: (context, index) {
                        return Card(

                          margin: EdgeInsets.only( left: 20,top: 2,bottom: 2),
                          child: Container(
                            height: 170,
                            width: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      TopDoctor[index].topDoctorImage,
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    TopDoctor[index].topDoctorName,
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    TopDoctor[index].topDoctorspecilist,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Top Hospital",
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
                  Container(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: TopHospital.length,
                      itemBuilder: (context, index) {
                        return Card(

                          margin: EdgeInsets.only( left: 20,top: 2,bottom: 2),
                          child: Container(
                            // height: 170,
                            width: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      TopHospital[index].topHospitalImage,
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    TopHospital[index].topHospitalName,
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    TopHospital[index].topHospitalLocation,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
