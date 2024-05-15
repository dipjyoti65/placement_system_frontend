import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:provider/provider.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentScreenState();
// }

// class _StudentScreenState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserTypeProvider>(context).user;
    return Scaffold(
        body: Column(
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
                onPressed: () {},
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
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              'assets/images/image.jpg',
              fit: BoxFit.cover,
              width: 100.w,
              height: 100.h,
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: coolBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 380.h,
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Name:',
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
                                        child: Text(
                                          //Accepting User name
                                          user.name,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Address:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Guwahati, Assam, India, pin 782427',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Gender:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Male',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Phone:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '8638647674',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Email:',
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
                                        child: Text(
                                          //Acepting User email
                                          user.email,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Branch:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Mca 4th sem',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '10% and Year:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '80%',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '12% and Year:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '72%',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          'Current CGPA:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          '8.4',
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Repeat similar TableRow widgets for other fields
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: secondaryBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            color: creamyWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 40.h,
                          height: 40.h,
                          child: const Icon(
                            CustomIcons.doc_text,
                            color: litBlue,
                          ),
                        ),
                        const Text(
                          "dipjyoti_resume.pdf",
                          style: TextStyle(
                            color: creamyWhite,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CustomIcons.download,
                            color: creamyWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
