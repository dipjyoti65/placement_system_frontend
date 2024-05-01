import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';

class CompnayDashborad extends StatelessWidget {
  const CompnayDashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: secondaryBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: creamyWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.edit_1,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/xopuntech.jpeg',
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 100.h,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              decoration: const BoxDecoration(
                color: coolBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    SizedBox(
                      // height: 380.h,
                      child: Scrollbar(
                        trackVisibility: true,
                        child: SingleChildScrollView(
                          // flex: 1,
            
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(1.5),
                                },
                                children: const [
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Company Name:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Xopuntech',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Address:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Guwahati, Assam, India, pin 782427',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
            
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Phone:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            '8638647674',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
            
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Email:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'xopuntech@gmail.com',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
            
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Website:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'www.Xopuntech.com',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: coolBlue,
        child: NavBar()),
      
    );
  }
}
