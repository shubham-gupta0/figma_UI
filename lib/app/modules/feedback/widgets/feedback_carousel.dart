import 'dart:async';
import 'package:flutter/material.dart';

class FeedbackCarousel extends StatefulWidget {
  final List<Widget> cards;
  const FeedbackCarousel({super.key, required this.cards});

  @override
  _FeedbackCarouselState createState() => _FeedbackCarouselState();
}

class _FeedbackCarouselState extends State<FeedbackCarousel> {
  late PageController _pageController;
  late int currentPage;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    currentPage = widget.cards.length * 100;
    _pageController = PageController(
      viewportFraction: 0.80,
      initialPage: currentPage,
    );
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      currentPage++;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final int currentIndex = index % widget.cards.length;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 273,
              height: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.white),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.35),
                    Colors.transparent,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26FFFFFF),
                    offset: Offset(8, -8),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.cards[currentIndex],
              ),
            ),
          );
        },
      ),
    );
  }
}