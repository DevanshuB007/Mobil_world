import 'package:flutter/material.dart';
import 'package:gaytri_mobile/merchant_login/city.dart';
import 'package:gaytri_mobile/merchant_login/state.dart';
import 'package:google_fonts/google_fonts.dart';

class MagicBox extends StatefulWidget {
  const MagicBox({super.key});

  @override
  State<MagicBox> createState() => _MagicBoxState();
}

class _MagicBoxState extends State<MagicBox> {
  final List<Map<String, String>> phones = [
    {
      "name": "vivo v29e",
      "brand": "Vivo",
      "price": "₹21,000",
      "image": "assets/images/vivo.jpeg",
    },
    {
      "name": "Realme c35 with very",
      "brand": "Realme",
      "price": "₹4,500",
      "image": "assets/images/Realme.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/iqoo.jpeg",
    },
    {
      "name": "Redmi 9A / 3Gb RAM /",
      "brand": "MI",
      "price": "₹3,599",
      "image": "assets/images/Redmi.jpeg",
    },
    {
      "name": "oppo a15s",
      "brand": "oppo",
      "price": "₹4,000.0",
      "image": "assets/images/oppo.jpeg",
    },
    {
      "name": "12 note 5g/8/256",
      "brand": "Mi",
      "price": "₹15,000.0",
      "image": "assets/images/note5g.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/iqoo.jpeg",
    },
    {
      "name": "Redmi 9A / 3Gb RAM /",
      "brand": "MI",
      "price": "₹3,599",
      "image": "assets/images/vivo.jpeg",
    },
    {
      "name": "vivo v29e",
      "brand": "Vivo",
      "price": "₹21,000",
      "image": "assets/images/vivo.jpeg",
    },
    {
      "name": "Realme c35 with very",
      "brand": "Realme",
      "price": "₹4,500",
      "image": "assets/images/Realme.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/iqoo.jpeg",
    },
    {
      "name": "Redmi 9A / 3Gb RAM /",
      "brand": "MI",
      "price": "₹3,599",
      "image": "assets/images/Redmi.jpeg",
    },
    {
      "name": "oppo a15s",
      "brand": "oppo",
      "price": "₹4,000.0",
      "image": "assets/images/oppo.jpeg",
    },
    {
      "name": "12 note 5g/8/256",
      "brand": "Mi",
      "price": "₹15,000.0",
      "image": "assets/images/note5g.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/iqoo.jpeg",
    },
    {
      "name": "Redmi 9A / 3Gb RAM /",
      "brand": "MI",
      "price": "₹3,599",
      "image": "assets/images/vivo.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.green),
        ),
        centerTitle: true,
        titleTextStyle: GoogleFonts.lora(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        title: Text(
          'Phones available for purchase',
        ),
      ),
      body: Column(
        children: [
          // Filters at the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StateSearchApp(
                        onStateSelected: (state) {
                          // Handle state selection
                        },
                      );
                    }));
                  },
                  child: Container(
                    height: 50,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFFf0f9f8),
                      border: Border.all(color: Color(0xFF17A589)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Select State",
                      style: GoogleFonts.lora(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CitySearchScreen(
                        onCitySelected: (String) {},
                      );
                    }));
                  },
                  child: Container(
                    height: 50,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFFf0f9f8),
                      border: Border.all(color: Color(0xFF17A589)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Select City",
                      style: GoogleFonts.lora(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Grid of phones
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 0.67,
              ),
              itemCount: phones.length,
              itemBuilder: (context, index) {
                final phone = phones[index];
                return PhoneCard(
                  name: phone['name']!,
                  brand: phone['brand']!,
                  price: phone['price']!,
                  imagePath: phone['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for each phone card
class PhoneCard extends StatelessWidget {
  final String name;
  final String brand;
  final String price;
  final String imagePath;

  const PhoneCard({
    required this.name,
    required this.brand,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phone image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                // height: 50,
              ),
            ),
          ),
          // Phone details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              brand,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: GoogleFonts.lora(
                color: Color(0xFF17A589),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
