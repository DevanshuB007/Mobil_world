import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/dashbord.dart';
import 'package:gaytri_mobile/merchant_login/area.dart';
import 'package:gaytri_mobile/merchant_login/city.dart';
import 'package:gaytri_mobile/merchant_login/state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MerchantLogin extends StatefulWidget {
  final String state;
  final String city;
  const MerchantLogin({super.key, required this.state, required this.city});

  @override
  State<MerchantLogin> createState() => _MerchantLoginState();
}

class _MerchantLoginState extends State<MerchantLogin> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        // backgroundColor: Colors.white,

        backgroundColor: Color(0xFFffffff),
        elevation: 0,
        title: Text(
          'Merchant Sign Up',
        ),
        titleTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 17,
          color: Colors.black,
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
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),

                // style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Merchant name",
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                controller: password,
                obscureText: !_isPasswordVisible,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.lora(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  suffixIcon: password.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )
                      : null,
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
              if (password.text.length > 0 && password.text.length < 8)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Password must be at least 8 characters.",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                'LOCATION DETAILS',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),
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
                    style: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Shop name",
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                    hintStyle: GoogleFonts.lora(
                        fontWeight: FontWeight.w400, fontSize: 16),
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
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),
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
                                  Text(
                                    'Upload Shop Image (16:9)',
                                    style: GoogleFonts.lora(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF17A589),
                                        fontSize: 16),
                                  ),
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
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'APPLY',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF17A589)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        setState(() {}); // Rebuild to show/hide the close icon
                      },
                      decoration: InputDecoration(
                        suffixIcon: _controller.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  _controller.clear(); // Clear the text field
                                  setState(
                                      () {}); // Rebuild to hide the close icon
                                },
                              )
                            : null, // Hide the icon when the text field is empty
                        hintText: "Enter referral code",
                        hintStyle: GoogleFonts.lora(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
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
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller1,
                      onChanged: (value) {
                        setState(() {}); // Rebuild to show/hide the close icon
                      },
                      decoration: InputDecoration(
                        suffixIcon: _controller1.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  _controller1.clear(); // Clear the text field
                                  setState(
                                      () {}); // Rebuild to hide the close icon
                                },
                              )
                            : null, // Hide the icon when the text field is empty
                        hintText: "Enter referral code",
                        hintStyle: GoogleFonts.lora(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashbord()));
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.lora(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
