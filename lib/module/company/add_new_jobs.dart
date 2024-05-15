import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';
import 'package:provider/provider.dart';

import '../../custom__text_field.dart';

class AddNewJobs extends StatefulWidget {
  AddNewJobs({super.key});

  @override
  State<AddNewJobs> createState() => _AddNewJobsState();
}

class _AddNewJobsState extends State<AddNewJobs>{

  final TextEditingController _companyTitleController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _vacancyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _websiteController = TextEditingController();
  final JobService jobService = JobService();

  void addJob() {
    jobService.addJob(
        context: context,
        title: _companyTitleController.text,
        experience: _experienceController.text,
        vacancy: _vacancyController.text,
        description: _descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.left_circle,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: secondaryBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Add New Job",
                        style: TextStyle(
                          color: creamyWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: addJob,
                    icon: const Icon(
                      CustomIcons.ok_circled,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: coolBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    SizedBox(
                      // height: 380.h,
                      child: Scrollbar(
                        trackVisibility: true,
                        child: SingleChildScrollView(
                          // flex: 1,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(1.5),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      const TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Title:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: TextField(
                                              controller:
                                                  _companyTitleController,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: secondaryBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      const TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Experience:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: TextField(
                                              controller: _experienceController,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: secondaryBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      const TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Vacancy:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: TextField(
                                              controller: _vacancyController,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: secondaryBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      const TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Description:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: TextField(
                                              controller:
                                                  _descriptionController,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: secondaryBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // TableRow(
                                  //   children: [
                                  //     const TableCell(
                                  //       child: Padding(
                                  //         padding: EdgeInsets.symmetric(
                                  //             vertical: 8.0),
                                  //         child: Text(
                                  //           'Website:',
                                  //           textAlign: TextAlign.left,
                                  //           style: TextStyle(
                                  //               fontWeight: FontWeight.bold),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     TableCell(
                                  //       child: Padding(
                                  //         padding: const EdgeInsets.symmetric(
                                  //             vertical: 8.0),
                                  //         child: Container(
                                  //           height: 30.h,
                                  //           child: TextField(
                                  //             controller: _websiteController,
                                  //             style: const TextStyle(
                                  //               fontSize: 12,
                                  //             ),
                                  //             decoration: InputDecoration(
                                  //               border: OutlineInputBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(10),
                                  //                 borderSide: const BorderSide(
                                  //                   color: secondaryBlue,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
