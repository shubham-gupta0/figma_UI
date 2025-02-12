import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FeedbackController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final commentController = TextEditingController();

  RxInt rating = 0.obs;

  void setRating(int newRating) {
    rating.value = newRating;
  }

  void submitFeedback() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields", backgroundColor: Colors.red);
      return;
    }

    Get.snackbar("Success", "Feedback submitted successfully!", backgroundColor: Colors.green);
  }
}
