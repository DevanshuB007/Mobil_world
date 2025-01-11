import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class raferearn extends StatefulWidget {
  const raferearn({super.key});

  @override
  State<raferearn> createState() => _raferearnState();
}

class _raferearnState extends State<raferearn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF17A589),
        ),
        centerTitle: true,
        title: const Text('Rafer & earn'),
        titleTextStyle: GoogleFonts.lora(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.35,
                    width: double.infinity,
                    child: Lottie.asset('assets/demo.json'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Refer & Earn ₹500.0',
                    style: GoogleFonts.lora(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You get ₹500.0 & your friend \ngets ₹0.0 as referral reward!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your Referral Code',
                style: GoogleFonts.lora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [6, 3], // Customizes the dotted design
                color: Colors.grey[500]!,
                radius: const Radius.circular(12),
                child: Container(
                  height: 40, // Added height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[50], // Fill color
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            '881FDD',
                            style: GoogleFonts.lora(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(const ClipboardData(
                                text: '881FDD',
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Referral Code Copied!'),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                // vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.teal[50],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Tap to Copy',
                                style: GoogleFonts.lora(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              // Share functionality (use share_plus package)
                            },
                            icon: const Icon(
                              Icons.share,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
