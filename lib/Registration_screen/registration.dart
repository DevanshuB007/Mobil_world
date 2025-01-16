import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Login_screen/customer_login.dart';
import 'package:gaytri_mobile/merchant_login/merchant_login.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenheight * 5,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: screenheight * 0.20),
              child: Image.asset(
                'assets/images/Gayatri_Main.png',
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/character.png',
                    height: screenheight * 0.2,
                    width: screenWidth * 5,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Log in Button
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Make button background transparent
                          shadowColor:
                              Colors.transparent, // Remove button shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize:
                              const Size(160, 50), // Set fixed button size
                        ),
                        child: Text(
                          "Log in",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Register Button
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
                          minimumSize:
                              const Size(160, 50), // Set fixed button size
                        ),
                        child: Text(
                          "Register",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
