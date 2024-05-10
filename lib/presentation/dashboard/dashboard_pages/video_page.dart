import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../model_page/video_consultation.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  List<videoConsultModel> doctorList = [
    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Taylor Samaro',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'),
    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Iker Bureau',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Asshish ',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),
    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Rooma ',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'),

    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Iker Bureau',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),
    videoConsultModel(
        videoConsultDoctorExpeience: 'Dr. Iker Bureau',
        videoConsultDoctorSpecialist: 'Dentist-Cumillia Medical College',
        videoConsultDoctorImage: 'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'),

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
                          child: Text(
                            "Video",
                            style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400,),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                          ),
                          child: Text(
                            "consultation",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Discover",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                child: Text("Find your suitable doctor!",),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search suitable doctor',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400, color: Colors.black54),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                ),
                                suffixIcon: Icon(
                                  Icons.filter_alt,
                                  color: Colors.blue,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 17.0),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Consult a specialist",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(doctorList[index].videoConsultDoctorImage),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Text("Experience", style: TextStyle(fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Text(doctorList[index].videoConsultDoctorSpecialist),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("\$199",style: TextStyle(fontWeight: FontWeight.bold),),
                                      ),
                                      Container(
                                        child: Icon(Icons.video_camera_back, color: Colors.blue),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )



              ],
            ),
          ),
        ],
      ),
    );
  }
}
