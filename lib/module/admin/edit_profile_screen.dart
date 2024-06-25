import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/constants/utils.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Uint8List? _fetchedImage;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadAdminDetails(BuildContext context, String id) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('${DefaultUrl.uri}/admin/$id'),
    );

    if (_image != null) {
      // Read the image file
      File imageFile = File(_image!.path);
      Uint8List imageBytes = await imageFile.readAsBytes();

      // Decode the image
      img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        // Resize the image to a smaller size (e.g., 600x600 pixels)
        img.Image resizedImage = img.copyResize(image, width: 600);

        // Compress the image to a lower quality (e.g., 70%)
        List<int> compressedImageBytes = img.encodeJpg(resizedImage, quality: 70);

        // Create a MultipartFile from the compressed image bytes
        request.files.add(http.MultipartFile.fromBytes(
          'profileImage',
          compressedImageBytes,
          filename: 'profileImage.jpg',
          contentType: http.MultipartFile.fromString('profileImage.jpg','image/jpeg').contentType,
        ));
      }
    }

    request.fields['name'] = _nameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['phone'] = _phoneController.text;

    final response = await request.send();
    if (response.statusCode == 200) {
      showSnackBar(context, "Admin details updated successfully");
    } else {
      showSnackBar(context, "Admin details update failed");
    }
  }


  @override
  void initState() {
    super.initState();
    // _fetchAdminDetails();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserTypeProvider>(context, listen: false);
    String id = userProvider.user.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? _fetchedImage == null
                      ? const Text('No image selected.')
                      : Image.memory(_fetchedImage!)
                  : Image.file(_image!),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _uploadAdminDetails(context, id);
                  },
                  child: const Text('Update Details')),
            ],
          ),
        ),
      ),
    );
  }
}
