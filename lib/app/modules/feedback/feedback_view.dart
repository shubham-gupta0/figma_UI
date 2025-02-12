import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webui/app/modules/feedback/feedback_controller.dart';
import 'widgets/feedback_carousel.dart';
import 'widgets/feedback_card.dart';
import 'widgets/rating_stars.dart';

class FeedbackView extends StatelessWidget {
  static FeedbackController controller = Get.put(FeedbackController());

  final List<Widget> feedbackCards = const [
    FeedbackCard(),
    FeedbackCard(),
    FeedbackCard(),
  ];

  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade600,
              Colors.brown.shade800,
              Colors.brown.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // Handle back action here
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Feedback",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Responses",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                FeedbackCarousel(cards: feedbackCards),
                const SizedBox(height: 20),
                const Text(
                  "Submit your Response",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _buildTextField(
                      controller.nameController,
                      Icons.person,
                      "Enter your name",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _buildTextField(
                      controller.emailController,
                      Icons.email,
                      "Enter your email",
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Share your experience in scaling",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                RatingStars(),
                const SizedBox(height: 10),
                _buildTextField(
                  controller.commentController,
                  Icons.comment,
                  "Add your comments...",
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.amber,
                          side: const BorderSide(color: Colors.transparent),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.submitFeedback,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    IconData icon,
    String hint, {
    int maxLines = 1,
  }) {
    bool isCommentsField = hint.contains("Add your comments");
    bool isEmailField = hint.toLowerCase().contains("email");

    return Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;

          return TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType:
                isEmailField ? TextInputType.emailAddress : TextInputType.text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
            onChanged: (value) {
              if (isEmailField) {
                final RegExp emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                if (!emailPattern.hasMatch(value)) {
                  throw Exception("Invalid email address");
                }
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              prefixIcon: isCommentsField
                  ? null
                  : Icon(
                      icon,
                      color: isFocused ? Colors.amber[300] : Colors.white70,
                    ),
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white54,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.amber, width: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
