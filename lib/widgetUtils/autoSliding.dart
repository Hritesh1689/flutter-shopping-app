import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class AutoSlidingBanner extends StatefulWidget {
  List<String> imageList;

  AutoSlidingBanner({super.key, required this.imageList});

  @override
  _AutoSlidingBannerState createState() => _AutoSlidingBannerState();
}

class _AutoSlidingBannerState extends State<AutoSlidingBanner> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Set up the auto-slide timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        controller: _pageController,
        children: List.generate(widget.imageList.length, (index) => BannerCards(imagePath: widget.imageList[index]).p(8))),
    );
  }
}

class BannerCards extends StatelessWidget {
  final String imagePath;

  const BannerCards({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // Placeholder image shown while the network image loads
            Center(child: Icon(Icons.download_for_offline, size: 48, color: Colors.grey.withOpacity(0.4))),
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child;
                } else {
                  final percentage = (progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)) * 100;
                  return Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.green,
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                          Text(
                            '${percentage.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ).p(8),
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.dnd_forwardslash, size: 36, color: Colors.grey.withOpacity(0.7)));
              },
            ),
          ],
        ),
      ),
    );
  }
}