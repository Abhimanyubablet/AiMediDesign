import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../consts/colors.dart';
import '../../model_page/favrouites_doctor_model.dart';
import '../../model_page/my_aapointment_model.dart';

class FavrouitesDoctor extends StatefulWidget {
  const FavrouitesDoctor({super.key});

  @override
  State<FavrouitesDoctor> createState() => _FavrouitesDoctorState();
}

class _FavrouitesDoctorState extends State<FavrouitesDoctor> {
  List<favroriteDoctorListModel> favouritesDoctorList = [
    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Taylor Samaro',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'
    ),
    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Chirs',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'
    ),
    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Asshish ',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),

    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Rooma ',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg'),

    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Iker Bureau',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg'),

    favroriteDoctorListModel(
        favroriteDoctorListName: 'Dr. Akshu ',
        favroriteDoctorListHospital: 'Dentist-Cumillia Medical College',
        favroriteDoctorListImage: 'https://familydoctor.org/wp-content/uploads/2018/02/41808433_l.jpg'),

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
                            "Favorites Doctor",
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
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: favouritesDoctorList.length,
                      itemBuilder: (context, index) {
                        var doctor = favouritesDoctorList[index];
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
                                                        borderRadius: BorderRadius.circular(35), // half of the width/height to make it a perfect circle
                                                        child: CircleAvatar(
                                                          backgroundImage: NetworkImage(doctor.favroriteDoctorListImage),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 12),
                                                    Container(
                                                      width: 150,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              doctor.favroriteDoctorListName,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),

                                                          Container(
                                                            child: Text(
                                                              doctor.favroriteDoctorListHospital,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black54,
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 12),
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
                                                        child: Icon(Icons.favorite_border, color: bgColor), // Use the favorite icon
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 4,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
