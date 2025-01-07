import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/profile/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          "My Profile",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 40,
                // backgroundImage: AssetImage(
                //     'assets/profile_placeholder.png'), // Replace with your image
              ),
              SizedBox(height: 16),
              // Name and Email
              Text(
                "GAYTRI MOBILE",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "gayatri07@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              // Edit Profile Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile(
                                state: '',
                                city: '',
                              )));
                },
                label: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.edit, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF17A589),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Personal Details Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    // height: 200,
                    // width: 00,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600])),
                            Text("gaytri mobile",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mobile",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600])),
                            Text("9316072255",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600])),
                            Text("gayatri07@gmail.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Location Details Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("State",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("Gujarat",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("City",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("Rajkot",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Area",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("150 ft ring road",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Shop Details Section
              Text(
                "Shop Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shop Name",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("gaytri mobile",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("GST Number",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Update",
                              style: TextStyle(color: Color(0xFF9C27B0)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Shop Name",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("gaytri mobile",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Divider(),
                      Column(
                        children: [
                          Text("Shop Name",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                          Text("gaytri mobile",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
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
