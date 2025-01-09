import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final Map<String, XFile?> _images = {
    'Aadhaar Front': null,
    'Aadhaar Back': null,
    'PAN Front': null,
    'Shop License': null,
  };

  Future<void> _pickImage(String key, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _images[key] = pickedFile;
      });
    }
    Navigator.pop(context); // Close bottom sheet
  }

  void _showImagePickerOptions(String key) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library, size: 30),
                    color: const Color(0xFF17A589),
                    onPressed: () => _pickImage(key, ImageSource.gallery),
                  ),
                  const Text('Gallery'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, size: 30),
                    color: const Color(0xFF17A589),
                    onPressed: () => _pickImage(key, ImageSource.camera),
                  ),
                  const Text('Camera'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUploadBox(String title) {
    return GestureDetector(
      onTap: () => _showImagePickerOptions(title),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[400]!, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _images[title] == null
                ? const Icon(Icons.add_photo_alternate,
                    size: 40, color: Colors.grey)
                : Image.file(
                    File(_images[title]!.path),
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF17A589)),
        title: const Text('Update KYC'),
        titleTextStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildUploadBox('Aadhaar Front')),
                const SizedBox(width: 16),
                Expanded(child: _buildUploadBox('Aadhaar Back')),
              ],
            ),
            const SizedBox(height: 16),
            _buildUploadBox('PAN Front'),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'GST Number',
                labelStyle:
                    GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFF17A589), width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildUploadBox('Shop License'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildUploadBox('Add Shop inside image')),
                const SizedBox(width: 16),
                Expanded(child: _buildUploadBox('Add Shop outside image')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    // Handle checkbox change
                  },
                ),
                Text(
                  'I Accept the ',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle terms & conditions tap
                  },
                  child: Text(
                    'Terms & Conditions.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF17A589),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Colors.red.shade400,
                    // Colors.blue.shade400,
                    Color(0xFF01ae90),
                    Color(0xFF06816c),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add submission logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('KYC Submitted Successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF17A589),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
