import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/module/Models/student_details.dart';

class JobApplicationService {
  void approvedApplication(
      {required BuildContext context,
      required String jobId,
      required String studentId}) async {
    http.Response response = await http.put(
      Uri.parse(
          '${DefaultUrl.uri}/approvedApplication?jobId=$jobId&studentId=$studentId'),
    );

    if (response.statusCode == 200) {
      showSnackBar(context, 'Student is Selected successfully');
    } else {
      // print('Failed to select Student: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception('Student Selection failed');
    }
  }

  void rejectApplication(
      {required BuildContext context,
      required String jobId,
      required String studentId}) async {
    http.Response response = await http.put(
      Uri.parse(
          '${DefaultUrl.uri}/rejectApplication?jobId=$jobId&studentId=$studentId'),
    );
    if (response.statusCode == 200) {
      showSnackBar(context, 'Student is Rejected');
    } else {
      throw Exception('Rejection Failed');
    }
  }

  Future<List<StudentDetails>> fetchSelectedStudent() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/getSelectedCandidated'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => StudentDetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Selected Student Details');
    }
  }
}
