import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/module/admin/edit_profile_screen.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:provider/provider.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({Key? key}) : super(key: key);

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Uint8List? _fetchedImage;

  @override
  void initState() {
    super.initState();
    // Fetch admin details when screen initializes
    _fetchAdminDetails();
  }

  Future<void> _fetchAdminDetails() async {
    try {
      final userProvider =
          Provider.of<UserTypeProvider>(context, listen: false);
      final adminId = userProvider.user.id;

      final response =
          await http.get(Uri.parse('${DefaultUrl.uri}/admin/$adminId'));

      if (response.statusCode == 200) {
        var adminData = json.decode(response.body);
        setState(() {
          _nameController.text = adminData['name'];
          _emailController.text = adminData['email'];
          _phoneController.text = adminData['phone'];
          if (adminData['image'] != null && adminData['image'] is String) {
            _fetchedImage = base64Decode(adminData['image']);
          } else {
            _fetchedImage = null;
          }
        });
      } else {
        print('Failed to load admin details : ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar(context, 'Error fetching admin details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                child: const Icon(Icons.edit),
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
            ],
          ),
        ),
      ),
    );
  }
}
