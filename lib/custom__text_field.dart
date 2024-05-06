import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      child: TextField(
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondaryBlue,
              ),
          ),
        ),
      ),
    );
  }
}
