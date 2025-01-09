import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerDataAcce extends StatefulWidget {
  const CustomerDataAcce({super.key});

  @override
  State<CustomerDataAcce> createState() => _CustomerDataAcceState();
}

class _CustomerDataAcceState extends State<CustomerDataAcce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF17A589),
        ),
        centerTitle: true,
        title: const Text(
          'Customer Data Access',
        ),
        titleTextStyle: GoogleFonts.dmSans(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 40,
        color: Color(0xFF17A589),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Name",
                style: GoogleFonts.lora(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "Mobile",
              style: GoogleFonts.lora(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Action",
              style: GoogleFonts.lora(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
