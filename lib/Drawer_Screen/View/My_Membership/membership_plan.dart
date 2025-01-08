import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MembershipPlan extends StatefulWidget {
  const MembershipPlan({super.key});

  @override
  State<MembershipPlan> createState() => _MembershipPlanState();
}

class _MembershipPlanState extends State<MembershipPlan> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF17A589),
        ),
        centerTitle: true,
        title: Text('Membership Plan'),
        titleTextStyle: GoogleFonts.lora(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Get 100% welcome bonus of\nmembership in your wallet",
                      style: GoogleFonts.lora(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.green.shade900,
                    size: 32.0,
                  ),
                ],
              ),
            ),
            _buildMembershipCard(
              title: "GOLD",
              duration: "Membership for 365 days",
              oldPrice: "₹5999",
              newPrice: "₹3600",
              color: Colors.purple.shade100,
              titleColor: Colors.purple,
              screenWidth: screenWidth,
            ),
            _buildMembershipCard(
              title: "BRONZE",
              duration: "Membership for 30 days",
              oldPrice: "₹499",
              newPrice: "₹399",
              color: Colors.orange.shade100,
              titleColor: Colors.orange,
              screenWidth: screenWidth,
            ),
            _buildMembershipCard(
              title: "SILVER",
              duration: "Membership for 90 days",
              oldPrice: "₹1499",
              newPrice: "₹999",
              color: Colors.blue.shade100,
              titleColor: Colors.blue,
              screenWidth: screenWidth,
            ),
            _buildMembershipCard(
              title: "PLATINUM",
              duration: "Membership for 1100 days",
              oldPrice: "₹17999",
              newPrice: "₹7499",
              color: Colors.green.shade100,
              titleColor: Colors.green,
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Colors.red.shade400,
                    // Colors.blue.shade400,
                    Color(0xFF2248cd),
                    Color(0xFF283b89),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MembershipPlan()));
                },
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.lora(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard({
    required String title,
    required String duration,
    required String oldPrice,
    required String newPrice,
    required Color color,
    required Color titleColor,
    required double screenWidth,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            duration,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Text(
                oldPrice,
                style: TextStyle(
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                newPrice,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
