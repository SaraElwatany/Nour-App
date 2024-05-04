import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nour_app/screens/hope_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HopeBox())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  
                ],
                 begin: Alignment.bottomLeft,
               end: Alignment.topRight,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Nour_logo.png'),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Nour -نور',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
                // const SizedBox(height: 20,),
                
              ],
            )));
  }
}