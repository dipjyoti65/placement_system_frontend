import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/student/edit_student_profile.dart';
import 'package:placemnet_system_frontend/module/student/student_drawer.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:provider/provider.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentDashboard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _tenthController = TextEditingController();
  final TextEditingController _twelveController = TextEditingController();
  Uint8List? _fetchedImage;

  @override
  void initState() {
    super.initState();
    _fetchStudentDetails();
  }

  Future<void> _fetchStudentDetails() async {
    try {
      final userProvider =
          Provider.of<UserTypeProvider>(context, listen: false);
      final studentId = userProvider.user.id;

      final response = await http
          .get(Uri.parse('${DefaultUrl.uri}/getStudentDetails/$studentId'));

      if (response.statusCode == 200) {
        var studentData = json.decode(response.body);
        setState(() {
          _nameController.text = studentData['name'];
          _emailController.text = studentData['email'];
          _phoneController.text = studentData['phone'];
          _genderController.text = studentData['gender'];
          _addressController.text = studentData['address'];
          _branchController.text = studentData['branch'];
          _tenthController.text = studentData['tenth'];
          _twelveController.text = studentData['twelve'];
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
      // showSnackBar(context, 'Error fetching student details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    final user = Provider.of<UserTypeProvider>(context).user;
    return Scaffold(
      key: _globalKey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditStudentProfile()));
                      },
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
                backgroundImage: _fetchedImage != null
                    ? MemoryImage(_fetchedImage!)
                    : const AssetImage('assets/images/user.png')
                        as ImageProvider,
              ),
              SizedBox(
                height: 40.h,
              ),
              // Expanded(
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       color: coolBlue,
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(15),
              //         topRight: Radius.circular(15),
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(30.0),
              //       child: Column(
              //         children: [
              //           SizedBox(
              //             height: 380.h,
              //             child: Scrollbar(
              //               trackVisibility: true,
              //               child: SingleChildScrollView(
              //                 // flex: 1,

              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Table(
              //                       columnWidths: const {
              //                         0: FlexColumnWidth(1.5),
              //                         1: FlexColumnWidth(1.5),
              //                       },
              //                       children: [
              //                         TableRow(
              //                           children: [
              //                             const TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Name:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: const EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   //Accepting User name
              //                                   user.name,
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Address:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Guwahati, Assam, India, pin 782427',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Gender:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Male',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Phone:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '8638647674',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         TableRow(
              //                           children: [
              //                             const TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Email:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: const EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   //Acepting User email
              //                                   user.email,
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Branch:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Mca 4th sem',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '10% and Year:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '80%',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '12% and Year:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '72%',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),

              //                         const TableRow(
              //                           children: [
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   'Current CGPA:',
              //                                   textAlign: TextAlign.left,
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ),
              //                             TableCell(
              //                               child: Padding(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 8.0),
              //                                 child: Text(
              //                                   '8.4',
              //                                   textAlign: TextAlign.left,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         // Repeat similar TableRow widgets for other fields
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20.h,
              //           ),
              //           // Container(
              //           //   width: double.infinity,
              //           //   height: 60.h,
              //           //   decoration: BoxDecoration(
              //           //     color: secondaryBlue,
              //           //     borderRadius: BorderRadius.circular(10),
              //           //   ),
              //           //   child: Row(
              //           //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           //     children: [
              //           //       Container(
              //           //         // width: double.infinity,
              //           //         decoration: BoxDecoration(
              //           //           color: creamyWhite,
              //           //           borderRadius: BorderRadius.circular(10),
              //           //         ),
              //           //         width: 40.h,
              //           //         height: 40.h,
              //           //         child: const Icon(
              //           //           CustomIcons.doc_text,
              //           //           color: litBlue,
              //           //         ),
              //           //       ),
              //           //       const Text(
              //           //         "dipjyoti_resume.pdf",
              //           //         style: TextStyle(
              //           //           color: creamyWhite,
              //           //         ),
              //           //       ),
              //           //       IconButton(
              //           //         onPressed: () {},
              //           //         icon: const Icon(
              //           //           CustomIcons.download,
              //           //           color: creamyWhite,
              //           //         ),
              //           //       )
              //           //     ],
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
              TextField(
                controller: _genderController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
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
              TextField(
                controller: _branchController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Branch',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _tenthController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: '10th %',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _twelveController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: '12th %',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: StudentDrawer(
        globalKey: _globalKey,
      ),
    );
  }
}
