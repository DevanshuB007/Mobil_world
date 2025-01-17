import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/Customer_Data/customer_data_acce.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/How%20to%20use/pdfview_scr.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/Magic_Box/magic_box.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/My_Membership/membership.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/My_wallet/wallet.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/Rafer%20&%20Earn/rafer&earn.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/profile/Profile.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/update%20KYC/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  XFile? _shopImage;

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(),
          child: Container(
            height: screenWidth * 0.4,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    size: 30,
                    color: Color(0xFF17A589),
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: Color(0xFF17A589),
                  ),
                  title: Text(
                    "Camera",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            Container(
              // color: Colors.red,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/Gayatri_Main.png',
                    // Replace with your logo asset
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.3,
                  ),
                  SizedBox(
                    width: screenWidth * 0.09,
                  ),
                  if (_shopImage != null)
                    Image.file(
                      File(_shopImage!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  else
                    const SizedBox(height: 20),
                  VerticalDivider(
                    indent: 30,
                    endIndent: 30,
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_photo_alternate_rounded,
                      color: Colors.grey,
                      size: 50,
                    ),
                    onPressed: _showImagePickerOptions,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Logo',
                        style: GoogleFonts.lora(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "(Brand Name)",
                        style: GoogleFonts.lora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Gayatri Mobile World',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _statusChip('Membership status', 'Active',
                            Colors.green.shade700),
                        const SizedBox(
                          width: 8,
                          height: 10,
                        ),
                        _statusChip('KYC', 'Pending!', Colors.red),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    actionButton('Renew', Colors.transparent),
                    const SizedBox(height: 8),
                    actionButton1('Update', Colors.transparent),
                  ],
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PDFViewerScreen()));
              },
              leading: Icon(
                Icons.help_outline,
                color: Color(0xFF17A589),
              ),
              title: Text('How to Use?'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFViewerScreen()));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF17A589),
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xFF17A589),
              ),
              title: Text('Home?'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              leading: Icon(
                Icons.person,
                color: Color(0xFF17A589),
              ),
              title: Text('Profile?'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MagicBox()));
              },
              leading: Icon(
                Icons.cases_outlined,
                color: Color(0xFF17A589),
              ),
              title: Text('Magic Box'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MagicBox()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.wallet,
                color: Color(0xFF17A589),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Wallet()));
              },
              title: Text('Wallet'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Wallet()));
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: Color(0xFF17A589),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Membership()));
              },
              leading: Icon(
                Icons.card_membership,
                color: Color(0xFF17A589),
              ),
              title: Text('My Membership'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Membership()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),

            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Color(0xFF17A589),
              ),
              title: Text('Finance Dashboard'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerDataAcce()));
              },
              leading: Icon(
                Icons.dataset_rounded,
                color: Color(0xFF17A589),
              ),
              title: Text('Customer Data Access'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => raferearn()));
              },
              leading: Icon(
                Icons.auto_fix_high,
                color: Color(0xFF17A589),
              ),
              title: Text('Rafer and Earn'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),

            // ..._menuItems(),
            const Divider(height: 40),
            Text(
              'Sold Products',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Sold Products Data'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Download Sold Products Report'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Download inventory Report'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            const SizedBox(height: 16),
            Text(
              'Sim Card Register',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add sim card data'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('View sim card data'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Download Report'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            const SizedBox(height: 16),
            Text(
              'Add Management',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Banner Ads'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Featured Product Ads'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            const SizedBox(height: 16),
            Text(
              'Unlock Phone Data',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('View'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Download Report'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),

            const SizedBox(height: 16),
            Text(
              'Repair Phone Data',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('View'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Download Report'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            Divider(),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Contact Us'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Privacy Policy'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Terms & Conditions'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Log Out'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Delete Account'),
              titleTextStyle: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF17A589),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'App Version:1.0.20:107',
              textAlign: TextAlign.center,
            )

            // ..._soldProductItems(),
          ],
        ),
      ),
    );
  }

  Widget _statusChip(String label, String status, Color color) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget actionButton(String text, Color color) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Color(0xFF17A589),
        ), // Border color and width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 18,
        ), // Button padding
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Membership()),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF17A589), // Text color
        ),
      ),
    );
  }

  Widget actionButton1(String text, Color color) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: Color(0xFF17A589),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 18,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Update()));
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF17A589), // Text color
        ),
      ),
    );
  }
}
