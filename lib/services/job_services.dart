import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/module/Models/application.dart';
import 'package:placemnet_system_frontend/module/Models/job.dart';
import 'package:placemnet_system_frontend/module/Models/job_cart_item.dart';
import 'package:placemnet_system_frontend/module/Models/user.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:provider/provider.dart';

class JobService {
  void addJob({
    required BuildContext context,
    // required String companyId,
    required String title,
    required String experience,
    required String vacancy,
    required String description,
  }) async {
    try {
      var userProvider = Provider.of<UserTypeProvider>(context, listen: false);

      String email = userProvider.user.email;
      String role = userProvider.user.role;
      String companyId = userProvider.user.id;
      if (companyId == " ") {
        // Fetch user details using the email and role
        Map<String, dynamic> userDetails =
            await fetechUserDetails(context, email, role);

        // Retrieve companyId from the userDetails
        companyId = userDetails['_id'];
      } else {
        print('CompanyId is :------------------>   ${companyId}');

        Job newjob = Job(
            companyId: companyId,
            title: title,
            experience: experience,
            vacancy: vacancy,
            description: description);
        http.Response res = await http.post(
          Uri.parse('${DefaultUrl.uri}/company/postJob'),
          body: newjob.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
        );

        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () {
              showSnackBar(context,"Job created successfully");
            });
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  // Future<List<Job>> fetechAllJobs() async {
  //   http.Response res =
  //       await http.get(Uri.parse('${DefaultUrl.uri}/api/getAllJobs'));
  //   if (res.statusCode == 200) {
  //     final List<dynamic> responseData = json.decode(res.body);
  //     return responseData.map((item) => Job.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load Jobs');
  //   }
  // }

  // Future<Map<String, dynamic>> fetchAllJobs() async {
  //   http.Response response = await http.get(
  //     Uri.parse('${DefaultUrl.uri}/api/getAllJobs'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jobDetails = jsonDecode(response.body);
  //     return jobDetails;
  //   } else {
  //     throw Exception('Failed to load Jobs');
  //   }
  // }

  Future<List<JobCartItem>> fetchJobCartItems() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/api/getAllJobs'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => JobCartItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  void approveJob(
      {required BuildContext context, required String jobId}) async {
    http.Response response = await http.put(
      Uri.parse('${DefaultUrl.uri}/jobs/approve/$jobId'),
    );

    if (response.statusCode == 200) {
      showSnackBar(context, "Job approve successfully");
    } else {
      // print('Failed to approve job: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception('Failed to approve job');
    }
  }

  Future<List<JobCartItem>> fetchApprovedjob() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/api/getApprovedJobs'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => JobCartItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  void applyJob({
    required BuildContext context,
    required String jobId,
  }) async {
    try {
      var userProvider = Provider.of<UserTypeProvider>(context, listen: false);

      String studentId = userProvider.user.id;

      Application newApplication =
          Application(studentId: studentId, jobId: jobId);
      http.Response res = await http.post(
        Uri.parse('${DefaultUrl.uri}/student/applyJob'),
        body: newApplication.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Job Applied Successfully");
          },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
}
