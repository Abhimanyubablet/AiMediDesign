import 'package:ai_med_health/presentation/dashboard/dashboard_pages/fitness/running_walking_tracker/running_walking_tracker_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/fitness/sleep_tracker/sleep_tracker.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/fitness/water_intake/water_intake.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../consts/colors.dart';
import '../../model_page/fitness_model_page.dart';
import '../../model_page/treatment_model.dart';
import 'heart_rate_tracker/heart_rate_tracker.dart';

class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {

  final List<String> imageUrls = [
    'https://img.freepik.com/free-vector/hand-drawn-gym-template-design_23-2150619152.jpg?w=1060&t=st=1715258884~exp=1715259484~hmac=2ce1f0d519e256f4b72ef0da98e897abef323452f20bfda36bea82e77832c6d8',
    'https://img.freepik.com/free-vector/gradient-gym-fitness-webinar_23-2149547425.jpg?w=1060&t=st=1715258919~exp=1715259519~hmac=3d9202b0b4012eb1857d26c261a96f1fb19afe06a74c89e99042e2ab2e19129a',
    'https://img.freepik.com/free-vector/fitness-center-twitch-background_23-2150971434.jpg?w=1060&t=st=1715258994~exp=1715259594~hmac=8ea57be10d4e63dd1fef329356e5dacc0314f0bc6e70ea181cc02cd55d4e4b81',
  ];


  void _navigateToCategoryPage(String categoryNavigate) {
    // You can add more conditions if needed for other pages
    if (categoryNavigate == 'RunningWalkingTrackerPage') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: RunningWalkingTrackerPage(),
        withNavBar: false,
      );
    }

    if (categoryNavigate == 'SleepTracker') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: SleepTracker(),
        withNavBar: false,
      );
    }

   else if (categoryNavigate == 'HeartRateTracker') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: HeartRateTracker(),
        withNavBar: false,
      );
    }

   else if (categoryNavigate == 'WaterIntake') {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: WaterIntake(),
        withNavBar: false,
      );
    }

  }


  List<fitnessCategoryModel> fitnessCategory = [
    fitnessCategoryModel(
        fitnessCategoryName: 'Running Trac....',
        fitnessCategoryIcon: 'assets/images/fitness/running_img_icon.png',
        fitnessCategoryNavigate: "RunningWalkingTrackerPage",
    ),
    fitnessCategoryModel(
      fitnessCategoryName: "Sleep Trac....",
      fitnessCategoryIcon: 'assets/images/fitness/sleep_img_icon.png',
      fitnessCategoryNavigate: "SleepTracker",
    ),

    fitnessCategoryModel(
      fitnessCategoryName: 'Heart Rate',
      fitnessCategoryIcon: 'assets/images/fitness/heart_rate_image_icon.png',
      fitnessCategoryNavigate: "HeartRateTracker",
    ),

    fitnessCategoryModel(
      fitnessCategoryName: 'Water Intake',
      fitnessCategoryIcon: 'assets/images/fitness/water_intake_img_icon.png',
      fitnessCategoryNavigate: "WaterIntake",
    ),

    // fitnessCategoryModel(
    //   fitnessCategoryName: 'Gym',
    //   fitnessCategoryIcon: 'assets/images/fitness/gym_image_icon.png',
    //   fitnessCategoryNavigate: " ",
    // ),
    // fitnessCategoryModel(
    //   fitnessCategoryName: 'Yoga',
    //   fitnessCategoryIcon: 'assets/images/fitness/yoga_image_icon.png',
    //   fitnessCategoryNavigate: " ",
    // ),

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
                        hintText: 'Find your suitable fitness!',
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
                    height: MediaQuery.of(context).size.height * 0.33,
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
                        itemCount: fitnessCategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              _navigateToCategoryPage(fitnessCategory[index].fitnessCategoryNavigate);
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
                                          fitnessCategory[index].fitnessCategoryIcon,
                                          fit: BoxFit.cover, // Adjust the fit to your requirements
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Text(
                                        fitnessCategory[index].fitnessCategoryName,
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

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Top Fitness Brand",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Swiper(
                          autoplay: true,
                          itemCount: imageUrls.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
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
    );
  }
}
