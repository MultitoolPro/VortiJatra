import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GOLD LOGO
              Container(
                width: 120, height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B)]),
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Color(0xFFD4AF37).withOpacity(0.5), blurRadius: 30, spreadRadius: 5)],
                ),
                child: Center(child: Text('VJ', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black))),
              ),
              SizedBox(height: 20),
              Text('VortiJatra', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1)),
              SizedBox(height: 4),
              Text('ভর্তিযাত্রা', style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 8),
              Text('বাংলাদেশের সব ভর্তি তথ্য • এক অ্যাপে', style: TextStyle(color: Colors.white54, fontSize: 13)),
              SizedBox(height: 30),
              CircularProgressIndicator(color: Color(0xFFD4AF37)),
              SizedBox(height: 20),
              Text('DU  •  NU  •  Medical  •  BUET  •  CU  •  RU', style: TextStyle(color: Color(0xFFD4AF37).withOpacity(0.7), fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
