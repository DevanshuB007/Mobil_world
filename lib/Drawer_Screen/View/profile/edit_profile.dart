import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaytri_mobile/merchant_login/area.dart';
import 'package:gaytri_mobile/merchant_login/city.dart';
import 'package:gaytri_mobile/merchant_login/state.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String state;
  final String city;
  const EditProfile({super.key, required this.state, required this.city});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  XFile? _shopImage;
  String selectedState = "Select state";

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _shopImage = File(pickedFile.path) as XFile?;
      });
    }
    Navigator.pop(context);
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo_library, size: 30),
                    color: Color(0xFF17A589),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                  Text(
                    'Gallery',
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt, size: 30),
                    color: Color(0xFF17A589),
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  Text(
                    'Camera',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF01b791),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Merchant name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Phone",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Merchant email address",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'LOCATION DETAILS',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFebfaf7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color(0xFF17A589), width: 1 // Border width
                    ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StateSearchApp(
                          onStateSelected: (state) {
                            setState(() {
                              selectedState = state;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    widget.state != null && widget.state.isNotEmpty
                        ? widget.state
                        : "Select state",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitySearchScreen(
                      onCitySelected: (String city) {},
                    ),
                  ),
                );

                // Update the selected city if a result is returned
                // if (result != null) {
                //   setState(() {
                //     selectedCity = result;
                //   });
                // }
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Select City",
                  filled: true,
                  fillColor: Color(0xFFebfaf7),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AreaSearchScreen()));
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Select Area",
                  filled: true,
                  fillColor: Color(0xFFebfaf7),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'SHOP DETAILS',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Shop name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Shop description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Shop address",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF17A589),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
