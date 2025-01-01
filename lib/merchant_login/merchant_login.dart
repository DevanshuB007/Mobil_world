import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaytri_mobile/merchant_login/area.dart';
import 'package:gaytri_mobile/merchant_login/city.dart';
import 'package:gaytri_mobile/merchant_login/state.dart';
import 'package:image_picker/image_picker.dart';

class MerchantLogin extends StatefulWidget {
  final String state;
  final String city;
  const MerchantLogin({super.key, required this.state, required this.city});

  @override
  State<MerchantLogin> createState() => _MerchantLoginState();
}

class _MerchantLoginState extends State<MerchantLogin> {
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
    Navigator.pop(context); // Close the bottom sheet
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
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Merchant Sign Up',
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PERSONAL DETAILS',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
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
                  color: Color(0xFFebfaf7), // Background color
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Color(0xFF17A589), // Border color
                      width: 1 // Border width
                      ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12), // Padding inside the container
                child: GestureDetector(
                    onTap: () {
                      // Navigate to the StateSearchApp screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StateSearchApp(
                            onStateSelected: (state) {
                              // Update selected state when a state is selected from StateSearchApp
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
                          : "Select state", // Check if state is null or empty
                      style: TextStyle(
                        color: Colors.black54, // Text color
                        fontSize: 16, // Font size
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onTap: () async {
                  // Navigate to CitySearchScreen and await the result
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CitySearchScreen(
                        onCitySelected:
                            (String city) {}, // Unused in this context
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
              TextField(
                decoration: InputDecoration(
                    hintText: "Gst number",
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
                'SHOP IMAGE',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: _showImagePickerOptions,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF17A589)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: _shopImage == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,
                                      size: 40, color: Color(0xFF17A589)),
                                  Text('Upload Shop Image (16:9)',
                                      style:
                                          TextStyle(color: Color(0xFF17A589))),
                                ],
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                File(_shopImage!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Do you have any referral code?',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'APPLY',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.close),
                        hintText: "Enter referral code",
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please enter Distributor code?',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.close),
                        hintText: "Enter referral code",
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF17A589),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
