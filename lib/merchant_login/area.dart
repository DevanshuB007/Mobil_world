import 'package:flutter/material.dart';

void main() => runApp(AreaSelectionApp());

class AreaSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AreaSelectionScreen(),
    );
  }
}

class AreaSelectionScreen extends StatefulWidget {
  @override
  _AreaSelectionScreenState createState() => _AreaSelectionScreenState();
}

class _AreaSelectionScreenState extends State<AreaSelectionScreen> {
  String selectedArea = "Select area"; // Default hint text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF17A589),
        title: Text("Area Selector", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onTap: () async {
                // Navigate to the area search screen and wait for the result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AreaSearchScreen(),
                  ),
                );

                // Update the selected area if a result is returned
                if (result != null) {
                  setState(() {
                    selectedArea = result;
                  });
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFebfaf7),
                hintText: selectedArea, // Show the selected area
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
          ],
        ),
      ),
    );
  }
}

class AreaSearchScreen extends StatefulWidget {
  @override
  _AreaSearchScreenState createState() => _AreaSearchScreenState();
}

class _AreaSearchScreenState extends State<AreaSearchScreen> {
  List<String> areas = [
    "Downtown",
    "Midtown",
    "Uptown",
    "Old City",
    "New City",
    "Tech Park",
    "Industrial Area",
    "Residential Zone",
    "Market Street",
    "Harbor Area",
    "Greenfield",
    "Hilltop",
  ];

  List<String> filteredAreas = [];

  @override
  void initState() {
    super.initState();
    filteredAreas = areas; // Initially display all areas
  }

  void _filterAreas(String query) {
    setState(() {
      filteredAreas = areas
          .where((area) => area.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF17A589),
        title: Text("Search Areas", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _filterAreas,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF17A589)),
                hintText: "Search area",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFF17A589)),
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
              itemCount: filteredAreas.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Return the selected area to the previous screen
                    Navigator.pop(context, filteredAreas[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F6F3), // Light green background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(filteredAreas[index]),
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
