import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../model_page/chat_model.dart';
import 'home_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<chatUserModel> chatUserList = [
    chatUserModel(
        chatUserName: 'You',
        chatUserImage:
            'https://static.vecteezy.com/system/resources/previews/018/873/933/original/blue-circle-and-white-plus-add-new-create-symbol-user-interface-theme-3d-icon-rendering-illustration-isolated-png.png'),
    chatUserModel(
        chatUserName: 'Riya',
        chatUserImage:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg'),
    chatUserModel(
        chatUserName: 'Rupma',
        chatUserImage:
            'https://www.shutterstock.com/image-photo/young-african-american-man-holding-600nw-2048211917.jpg'),
    chatUserModel(
        chatUserName: 'Daisy',
        chatUserImage:
            'https://img.freepik.com/free-photo/front-view-young-beautiful-female-white-shirt-posing-with-surprised-expression_140725-17256.jpg'),
    chatUserModel(
        chatUserName: 'Sully',
        chatUserImage:
            'https://t4.ftcdn.net/jpg/03/26/98/51/360_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg'),
    chatUserModel(
        chatUserName: 'John',
        chatUserImage:
            'https://as1.ftcdn.net/v2/jpg/03/78/56/18/1000_F_378561867_fy3v4jNapFt7h8nqPTEPjEuYed2wWpa2.jpg'),
  ];

  List<chatDoctorModel> chatDoctorList = [
    chatDoctorModel(
        chatDoctorName: 'Dr. Taylor Samaro',
        chatDoctorInfo: "I am cardio patient. I need your help",
        chatDoctorImage:
            'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg'
    ),
    chatDoctorModel(
        chatDoctorName: 'Dr. Asshish',
        chatDoctorInfo: "I am cardio patient. I need your help",
        chatDoctorImage:
        'https://st4.depositphotos.com/1017986/21088/i/450/depositphotos_210888716-stock-photo-happy-doctor-with-clipboard-at.jpg'
    ),
    chatDoctorModel(
        chatDoctorName: 'Dr. Rooma ',
        chatDoctorInfo: "I am cardio patient. I need your help",
        chatDoctorImage:
        'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'
    ),
    chatDoctorModel(
        chatDoctorName: 'Dr. Iker Bureau',
        chatDoctorInfo: "I am cardio patient. I need your help",
        chatDoctorImage:
        'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: Column(
        children: [

          Container(
            height: 280,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Column(
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
                                    offset: Offset(0, 1),
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
                              child: Text(
                                "Message",
                                style: TextStyle(
                                  fontSize: 18,
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
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: Icon(Icons.message_rounded),
                                color: Colors.blue,
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
                                    offset: Offset(0, 1),
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
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            errorText: null,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.blue,
                            ), // Use prefixIcon instead of prefix
                            hintText: 'Search Chat',
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
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chatUserList.length,
                          itemBuilder: (context, index) {
                            final user = chatUserList[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(user.chatUserImage),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(user.chatUserName),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 340,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.all(20),
                    child: ListView.builder(
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: chatDoctorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        height: 50,
                                        width: 50,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              chatDoctorList[index].chatDoctorImage,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                chatDoctorList[index].chatDoctorName,
                                                style: TextStyle(fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                chatDoctorList[index].chatDoctorInfo,
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
