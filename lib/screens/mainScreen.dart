import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pushReplacementNamed('/products');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(100.0),
              child: Image(
                   image: AssetImage('assets/shopping_icon_black.jpg'),
              ),
            ),
            const SizedBox(height: 20.0),
            LoadingAnimationWidget.twistingDots(
              leftDotColor: Colors.black,
              rightDotColor: Colors.black,
              size: 100,
            )
          ],
      ),
    );
  }
}
