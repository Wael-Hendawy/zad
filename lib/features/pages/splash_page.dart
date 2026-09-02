// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (mounted) unawaited(Navigator.pushReplacementNamed(context, '/login'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B6B5B),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ZAD | زاد',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'رفيقك في طريق الخير',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
      ).animate().fadeIn(duration: const Duration(milliseconds: 300)).slideX(begin: -0.5, end: 0),
    );
  }
}
