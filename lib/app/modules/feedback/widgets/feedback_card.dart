import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: 178,
                left: 175,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Samira",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 23.5,
              height: 1.0,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Founder of DARKEYE",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.9583,
              letterSpacing: 0.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "\"Great innovation and user-centric approach! Improving customer support and refining UI/UX can enhance overall user experience.\"",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              fontSize: 12,
              height: 1.25, 
              letterSpacing: 0.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
