import 'package:ai_med_health/presentation/dashboard/dashboard_pages/hospital_page/hospital_profile.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../consts/colors.dart';
import '../../model_page/doctor_list_model.dart';
import '../../model_page/hospital_model.dart';
import '../home_page.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({super.key});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {

  final List<String> imageUrls = [
    'https://img.freepik.com/free-vector/hospital-healthcare-service-sale-banner_23-2150394136.jpg',
    'https://img.freepik.com/free-vector/flat-design-medical-clinic-facebook-template_23-2149641419.jpg',
    'https://img.freepik.com/free-vector/hospital-healthcare-service-facebook-template_23-2150395866.jpg',
  ];

  List<hospitalListModel> hospitalList = [
    hospitalListModel(
        hospitalListName: 'AMRI Hospital',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNV9zaW1wbGVfM2RfaWxsdXN0cmF0aW9uX29mX2FfcmVjb3Zlcnlfcm9vbV93aV80ZjhkNDIwNC02N2I4LTQwMDQtYTBlNy05YjljMjIyMzE2ZGVfMS5qcGc.jpg'
    ),
    hospitalListModel(
        hospitalListName: 'IRIS MULTISPECIALITY HOSPITAL',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNV9zaW1wbGVfM2RfaWxsdXN0cmF0aW9uX29mX2FfcmVjb3Zlcnlfcm9vbV93aV80ZjhkNDIwNC02N2I4LTQwMDQtYTBlNy05YjljMjIyMzE2ZGVfMS5qcGc.jpg'
    ),
    hospitalListModel(
        hospitalListName: 'Apollo Multispeciality Hospitals',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://www.charnockhospital.com/portfolio/charnock-hospital.kolkata-portfolio-07.jpg'
    ),
    hospitalListModel(
        hospitalListName: 'Fortis Hospital',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://thumbs.dreamstime.com/b/doctors-hospital-corridor-nurse-pushing-gurney-stretcher-bed-male-senior-female-patient-32154012.jpg'
    ),

    hospitalListModel(
        hospitalListName: 'Sterling Hospital',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://t4.ftcdn.net/jpg/02/89/02/21/360_F_289022174_xyKMkL4LNvqlcZ7hUE6oDvr2Ep6XVrrI.jpg'
    ),
    hospitalListModel(
        hospitalListName: 'Ruby General Hospital',
        hospitalListLocation: 'Kolkata, West Bengal',
        hospitalListImage: 'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvaXMxNzM3MS1pbWFnZS1rd3Z3dG9xei5qcGc.jpg'
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
                       hintText: 'Find your suitable hospital!',
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
                 SingleChildScrollView(
                   child: ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: hospitalList.length,
                     itemBuilder: (context, index) {
                       var doctor = hospitalList[index];
                       return GestureDetector(
                         onTap: (){
                           PersistentNavBarNavigator.pushNewScreen(
                             context,
                             screen: HospitalProfile(),
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
                                                 doctor.hospitalListImage,
                                                 fit: BoxFit.cover,
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 12),
                                           Container(
                                             width: 200,
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Container(
                                                   child: Text(
                                                     doctor.hospitalListName,
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
                                                           itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amberAccent,),
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
                                                     doctor.hospitalListLocation,
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
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   margin: EdgeInsets.only(left: 20, right: 20),
                   child: Text(
                     "Available Hospital",
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
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       height: 210,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
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
