import 'package:flutter/material.dart';
import 'package:gaytri_mobile/merchant_login/merchant_login.dart';

void main() => runApp(StateSearchApp(
        onStateSelected: (String) {},
      ));

class StateSearchApp extends StatefulWidget {
  final Function(String) onStateSelected;
  // Constructor with the required named parameter
  StateSearchApp({required this.onStateSelected});
  @override
  State<StateSearchApp> createState() => _StateSearchAppState();
}

class _StateSearchAppState extends State<StateSearchApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateSearchScreen(),
    );
  }
}

class StateSearchScreen extends StatefulWidget {
  @override
  _StateSearchScreenState createState() => _StateSearchScreenState();
}

class _StateSearchScreenState extends State<StateSearchScreen> {
  List<String> states = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Mainipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarkhand",
    "West Bengal",
  ];

  List<String> filteredStates = [];

  @override
  void initState() {
    super.initState();
    filteredStates = states; // Initialize filtered states
  }

  void _filterStates(String query) {
    setState(() {
      filteredStates = states
          .where((state) => state.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF17A589),
        title: Text("Search",
            style: TextStyle(
              color: Colors.white,
            )),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _filterStates,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xFF17A589), width: 20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFF17A589)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("Selected State: ${filteredStates[index]}");

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MerchantLogin(
                            state: filteredStates[index], city: '',
                          ),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F6F3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(filteredStates[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
