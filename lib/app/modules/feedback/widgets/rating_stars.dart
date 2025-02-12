import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../feedback_controller.dart';

class RatingStars extends StatelessWidget {
  final FeedbackController controller = Get.find<FeedbackController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(Icons.star,
                color: index < controller.rating.value
                    ? Colors.yellow
                    : Colors.white,
              ),
              onPressed: () => controller.setRating(index + 1),
            );
          }),
        ));
  }
}
