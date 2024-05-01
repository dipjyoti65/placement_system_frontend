import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/module/userModels/user.dart';

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
            // token : ''
            role: role);
        http.Response res = await http.post(
          Uri.parse('${DefaultUrl.uri}/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset= UTF -8'
          },
        );

        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Accout created! Login with same credentials');
          },
        );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
}
