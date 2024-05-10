import 'package:ai_med_health/presentation/dashboard/dashboard_pages/doctor_page/doctor_profile_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/home_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../consts/colors.dart';
import '../../../../widgets/persistance_bottom_nav.dart';
import '../../model_page/doctor_list_model.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {

  final List<String> imageUrls = [
    'assets/images/banner_one_img.png',
    'assets/images/banner_two_img.png',
    'assets/images/banner_three_img.png',
  ];

  List<doctorListModel> doctorList = [
    doctorListModel(
        doctorListName: 'Dr. Taylor Samaro',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
    doctorListModel(
        doctorListName: 'Dr. Iker Bureau',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    doctorListModel(
        doctorListName: 'Dr. Asshish ',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),
    doctorListModel(
        doctorListName: 'Dr. Rooma ',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),

    doctorListModel(
        doctorListName: 'Dr. Iker Bureau',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    doctorListModel(
        doctorListName: 'Dr. Iker Bureau',
        doctorListHospital: 'Dentist-Cumillia Medical College',
        doctorListImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),

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
                              // Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
                      "Specialist",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      var doctor = doctorList[index];
                      return GestureDetector(
                        onTap: (){
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: DoctorProfilePage(),
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
                                                doctor.doctorListImage,
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
                                                    doctor.doctorListName,
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
                                                    doctor.doctorListHospital,
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Available Doctor",
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