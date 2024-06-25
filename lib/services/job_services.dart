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
import 'package:placemnet_system_frontend/module/Models/student_details.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              showSnackBar(context, "Job created successfully");
            });
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future deleteJob(BuildContext context, String jobId) async {
    final response = await http.delete(
      Uri.parse('${DefaultUrl.uri}/deleteJob?jobId=$jobId'),
    );

    if (response.statusCode == 204) {
      showSnackBar(context, 'Job deleted successfully');
    } else {
      throw Exception('Failed to delete job');
    }
  }

  Future<List<JobCartItem>> fetchJobCartItems() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/api/getAllJobs'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => JobCartItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Jobs');
    }
  }

  //Fetch Approved job for each company
  Future<List<JobCartItem>> fetchApprovedJobforCompany(
      BuildContext context, String companyId) async {
    http.Response response = await http.get(
        Uri.parse(
            '${DefaultUrl.uri}/getApprovedJobForCompany?companyId=$companyId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => JobCartItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load approved Jobs');
    }
  }

  //Fetch Student applied for a partcular job of a particular company
  Future<List<StudentDetails>> fetchStudentList(String jobId) async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/getAppliedStudent?jobId=$jobId'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> applicants = data['applicantDetails'];
      return applicants.map((item) => StudentDetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load student list');
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

  Future<List<dynamic>> getStudentAppliedJobs(
      {required BuildContext context}) async {
    var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
    String studentId = userProvider.user.id;

    final response = await http.get(
      Uri.parse(
          '${DefaultUrl.uri}/student/getAppliedJobs?studentId=$studentId'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['appliedJobs'];
    } else {
      // throw Exception('Failed to load Applied Jobs');
      print('Failed to fetch applied jobs: ${response.statusCode}');
      return [];
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
