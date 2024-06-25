import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/login_page.dart';
import 'package:placemnet_system_frontend/module/admin/admin_dashboard.dart';
import 'package:placemnet_system_frontend/module/company/company_dashborad.dart';
import 'package:placemnet_system_frontend/module/student/student_Profile_Screen.dart';
import 'package:placemnet_system_frontend/module/student/student_dashboard.dart';
import 'package:placemnet_system_frontend/module/Models/user.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void singUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          token: '',
          role: role);
      http.Response res = await http.post(
        Uri.parse('${DefaultUrl.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Accout created! Login with same credentials');
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${DefaultUrl.uri}/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'role': role,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          String token = jsonDecode(res.body)['token'];
          await prefs.setString('x-auth-token', token);

          // Switch-case to determine role and navigate to corresponding dashboard
          switch (role) {
            case 'Student':
              navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>  const StudentProfileScreen()),
                (route) => false,
              );
              break;
            case 'Company':
              navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => CompnayDashboard()),
                (route) => false,
              );
              break;
            case 'Admin':
              navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AdminDashboard()),
                (route) => false,
              );
              break;
            default:
              // Handle unknown role
              showSnackBar(context, 'Unknown role');
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

void logoutUser({
  required BuildContext context,
 }) async {
  try {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('x-auth-token');

    // Navigate to the login screen and clear the navigation stack
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  } catch (e) {
    showSnackBar(context, 'Logout failed: ${e.toString()}');
  }
}


  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${DefaultUrl.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${DefaultUrl.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
      (route) => false,
    );
  }
}

// Function to check token validity
Future<bool> checkTokenValidity(String token) async {
  try {
    http.Response res = await http.get(
        Uri.parse('${DefaultUrl.uri}/api/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });
    if (res.statusCode == 200) {
      //Token is valid
      return true;
    } else {
      return false;
    }
  } catch (error) {
    print('Error checking token validity: $error ');
    return false;
  }
}

Future<Map<String, dynamic>> fetechUserDetails(
  BuildContext context,  String email, String role) async {

     var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
  
    http.Response response = await http.get(
      Uri.parse('${DefaultUrl.uri}/api/getUser?email=$email&role=$role'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> userDetails = jsonDecode(response.body);
      userProvider.setUser(response.body);
      return userDetails;
    } else {
      throw Exception('Failed to load user details');
    }
}
