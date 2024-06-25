import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';
import 'package:placemnet_system_frontend/module/company/company_drawer.dart';
import 'package:placemnet_system_frontend/module/company/edit_company_profile.dart';
import 'package:placemnet_system_frontend/module/student/edit_student_profile.dart';
import 'package:placemnet_system_frontend/module/student/student_drawer.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:provider/provider.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompanyProfileScreen> createState() => CompanyProfileScreenState();
}

class CompanyProfileScreenState extends State<CompanyProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
 
  final TextEditingController _addressController = TextEditingController();
 
  Uint8List? _fetchedImage;

  @override
  void initState() {
    super.initState();
    // Fetch student details when screen initializes
    _fetchStudentDetails();
  }

  Future<void> _fetchStudentDetails() async {
    try {
      final userProvider =
          Provider.of<UserTypeProvider>(context, listen: false);
      final companyId = userProvider.user.id;

      final response = await http
          .get(Uri.parse('${DefaultUrl.uri}/getCompany/$companyId'));

      if (response.statusCode == 200) {
        var studentData = json.decode(response.body);
        setState(() {
          _nameController.text = studentData['name'];
          _emailController.text = studentData['email'];
          _phoneController.text = studentData['phone'];
          _addressController.text = studentData['address'];
          if (studentData['image'] != null && studentData['image'] is String) {
            _fetchedImage = base64Decode(studentData['image']);
          } else {
            _fetchedImage = null;
          }
        });
      } else {
        print('Failed to load student details : ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar(context, 'Error fetching student details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _globalKey,
      drawer:CompanyDrawer(
        globalKey: _globalKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15,30,15,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditCompanyProfile(),
                          ),
                        );
                      },
                      icon: const Icon(
                        CustomIcons.edit_1,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: _fetchedImage != null
                  ? MemoryImage(_fetchedImage!)
                  : const AssetImage('assets/images/user.png')
                      as ImageProvider,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.7,
              decoration: const BoxDecoration(
                  color: coolBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,30,20,20),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _phoneController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    const SizedBox(height: 20),
                  
                    const SizedBox(height: 20),
                    TextField(
                      controller: _addressController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //   TextField(
                    //   controller: _tenthController,
                    //   readOnly: true,
                    //   decoration: const InputDecoration(
                    //     labelText: '10th %',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    // TextField(
                    //   controller: _twelveController,
                    //   readOnly: true,
                    //   decoration: const InputDecoration(
                    //     labelText: '12th %',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: Container(color: coolBlue, child: NavBar()),
    );
  }
}
