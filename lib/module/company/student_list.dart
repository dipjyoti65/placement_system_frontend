import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Student List"),
             Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: secondaryBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: NavBar(),
                     
                    ),
          ],
        ),
      
    );
  }
}