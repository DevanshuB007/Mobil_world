import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/How%20to%20use/pdfview_scr.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/Magic_Box/magic_box.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/profile/Profile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            // color: Colors.red,
            height: 100,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  // Replace with your logo asset
                  height: 60,
                ),
                Text(
                  '|',
                  style: TextStyle(fontSize: 40, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.add_photo_alternate_rounded,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                Text('Upload Logo')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, gaytti mobile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _statusChip('Membership status', 'Active', Colors.green),
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
                  actionButton('Update', Colors.transparent),
                ],
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: Color(0xFF17A589),
            ),
            title: Text('How to Use?'),
            trailing: IconButton(
              onPressed: () async {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PDFViewerScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MagicBox()));
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
            title: Text('Wallet?'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios),
              color: Color(0xFF17A589),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.card_membership,
              color: Color(0xFF17A589),
            ),
            title: Text('My Membership'),
            trailing: IconButton(
                onPressed: () {},
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
      onPressed: () {},
      child: Text(text),
    );
  }

  // List<Widget> _menuItems() {
  //   final menu = [
  //     {'icon': Icons.help_outline, 'label': 'How to use?'},
  //     {'icon': Icons.home_outlined, 'label': 'Home'},
  //     {'icon': Icons.person_outline, 'label': 'Profile'},
  //     {'icon': Icons.cases_outlined, 'label': 'Magic Box'},
  //     {'icon': Icons.account_balance_wallet_outlined, 'label': 'Wallet'},
  //     {'icon': Icons.card_membership, 'label': 'My Membership'},
  //     {'icon': Icons.dashboard_outlined, 'label': 'Finance Dashboard'},
  //     {'icon': Icons.data_usage_outlined, 'label': 'Customer Data Access'},
  //     {'icon': Icons.card_giftcard, 'label': 'Refer and Earn'},
  //   ];
  //   return menu
  //       .map((item) => ListTile(
  //             leading: Icon(item['icon'] as IconData, color: Colors.green),
  //             title: Text(item['label'] as String),
  //             trailing: Icon(Icons.arrow_forward_ios, size: 16),
  //             onTap: () {},
  //           ))
  //       .toList();
  // }

  // List<Widget> _soldProductItems() {
  //   final soldProducts = [
  //     {'icon': Icons.sell_outlined, 'label': 'Sold Products Data'},
  //     {
  //       'icon': Icons.download_outlined,
  //       'label': 'Download Sold Products Report'
  //     },
  //     {'icon': Icons.inventory_outlined, 'label': 'Download Inventory Report'},
  //   ];
  //   return soldProducts
  //       .map((item) => ListTile(
  //             leading: Icon(item['icon'] as IconData, color: Colors.teal),
  //             title: Text(item['label'] as String),
  //             trailing: Icon(Icons.arrow_forward_ios, size: 16),
  //             onTap: () {},
  //           ))
  //       .toList();
  // }
}
