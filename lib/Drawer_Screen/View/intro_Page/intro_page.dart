import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Login_screen/customer_login.dart';
import 'package:gaytri_mobile/Registration_screen/registration.dart';
import 'package:gaytri_mobile/merchant_login/merchant_login.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // void _showCustomerDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Dialog(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(5),
    //         ),
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.8,
    //           height: 110,
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   IconButton(
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                       icon: Icon(Icons.close_rounded)),
    //                   Expanded(
    //                     child: Text(
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       "Register/Login as Customer",
    //                       style: GoogleFonts.playfair(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => CustomerLogin()));
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: Color(0xFF253b86),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       padding: const EdgeInsets.symmetric(
    //                           vertical: 10, horizontal: 20),
    //                     ),
    //                     child: const Text(
    //                       "Buy Phone",
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 20,
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => CustomerLogin()));
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: Color(0xFF01ae90),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       padding: const EdgeInsets.symmetric(
    //                           vertical: 10, horizontal: 20),
    //                     ),
    //                     child: const Text(
    //                       "Sell Phone",
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       // Color(0xFFffffff), // Ending color (lighter blue)
        // Color(0xFF2C3B8D), // Ending color (lighter blue)
        // Color(0xFF6A82FB), // Starting color (blue)
        //     ],
        //     begin: Alignment.topCenter, // Gradient starts from the top
        //     end: Alignment.bottomCenter, // Gradient ends at the bottom
        //   ),
        // ),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Name
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Center(
                  child: Image.asset(
                    'assets/images/Gayatri_Main.png',
                    height: 150,
                    width: double.infinity,
                  ),
                  // Text(
                  //   "Gaytri Mobile World",
                  //   style: GoogleFonts.dmSans(
                  //       fontSize: 30,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w500),
                  // ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Image.asset(
                'assets/images/intro.png', // Replace with your image path
                height: screenHeight * 0.35,
                width: screenWidth * 0.8,
                fit: BoxFit.contain,
              ),

              SizedBox(height: screenHeight * 0.05),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "Find the best \nSale/Buy Phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Colors.red.shade400,
                            // Colors.blue.shade400,
                            Color(0xFF2C3B8D),
                            Color(0xFF6A82FB),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        }, // _showCustomerDialog
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Make button background transparent
                          shadowColor:
                              Colors.transparent, // Remove button shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: Text(
                          "Register / Login as Customer",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Gradient Button for Merchant
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2C3B8D),
                            Color(0xFF6A82FB),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MerchantLogin(state: '', city: ''),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: Text(
                          "Register / Login as Merchant",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              TextButton(
                onPressed: () {},
                child: Text(
                  "I'm searching for Phone",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                    decoration: TextDecoration.underline,
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
