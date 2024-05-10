import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

class VisitUserInfo extends StatefulWidget {
  const VisitUserInfo({super.key});

  @override
  State<VisitUserInfo> createState() => _VisitUserInfoState();
}

class _VisitUserInfoState extends State<VisitUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
     body: SingleChildScrollView(
       child: Column(
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
                             "Patient Info",
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
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text("Patient Name",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                      SizedBox(height: 5,),
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            errorText: null,
                            hintText: 'Oshana Singh',
                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                            prefixIcon: Icon(Icons.supervised_user_circle_rounded,
                                color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(child: Text("Age ",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                              SizedBox(height: 5,),
                              Container(
                                height: 65,
                                width: 163,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    errorText: null,
                                    hintText: '22',
                                    hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                                    prefixIcon: Icon(Icons.calendar_month,
                                        color: Colors.black54),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 16.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(child: Text("Age (Month)",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                              SizedBox(height: 5,),
                              Container(
                                height: 65,
                                width: 163,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    errorText: null,
                                    hintText: '9',
                                    hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                                    prefixIcon: Icon(Icons.calendar_month,
                                        color: Colors.black54),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 16.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Container(child: Text("Weight (KG)",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                      SizedBox(height: 5,),
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            errorText: null,
                            hintText: '62',
                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                            prefixIcon: Icon(Icons.monitor_weight_outlined,
                                color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      Container(child: Text("Brifly describe the problem",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                      SizedBox(height: 5,),
                      Container(
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          maxLines: 15, // This allows the TextField to expand dynamically
                          decoration: InputDecoration(
                            errorText: null,
                            hintText: 'Leave a comment here',
                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ],
           ),
         ],
       ),
     ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),

        child: ElevatedButton(
          // onPressed: _performSignIn,
          onPressed: () {
            // Navigator.push(context,MaterialPageRoute(builder: (context) => VisitUserInfo()));
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
            'PROCEED NEXT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
