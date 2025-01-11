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
                    height: 60,
                  ),
                  SizedBox(width: 20),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 40, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  if (_shopImage != null)
                    Image.file(
                      File(_shopImage!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  else
                    const SizedBox(height: 20),
                  // Icon button to trigger image picker modal
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
                        _statusChip(
                            'Membership status', 'Active', Colors.green),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Sold Products Data'),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add sim card data'),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Banner Ads'),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add'),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Icon(
                Icons.assessment_sharp,
                color: Color(0xFF17A589),
              ),
              title: Text('Add'),
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
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget actionButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Membership()));
      },
      child: Text(text),
    );
  }

  Widget actionButton1(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Update()));
      },
      child: Text(text),
    );
  }
}
