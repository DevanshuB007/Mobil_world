import 'package:flutter/material.dart';
import 'package:gaytri_mobile/merchant_login/state.dart';

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
      "image": "assets/images/vivo.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/vivo.jpeg",
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
      "image": "assets/images/vivo.jpeg",
    },
    {
      "name": "iqoo neo7 5g",
      "brand": "Other",
      "price": "₹22,000",
      "image": "assets/images/vivo.jpeg",
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
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.green),
        ),
        centerTitle: true,
        title: Text(
          'Phones available for purchase',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Filters at the top
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StateSearchApp(
                        onStateSelected: (String) {},
                      );
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  child: Text("Select State",
                      style: TextStyle(color: Colors.green)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  child: Text("Select City",
                      style: TextStyle(color: Colors.green)),
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
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
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
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phone image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: double.infinity,
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
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
