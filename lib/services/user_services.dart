import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/module/Models/company_details.dart';
import 'package:placemnet_system_frontend/module/Models/student_details.dart';

class UserService {
  Future<List<CompanyDetails>> getAllStudents() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/getAllStudents'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => CompanyDetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Student Data');
    }
  }

  Future<List<CompanyDetails>> getAllCompany() async {
    final response = await http.get(
      Uri.parse('${DefaultUrl.uri}/getAllComapnyDatas'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => CompanyDetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Companies');
    }
  }
}
