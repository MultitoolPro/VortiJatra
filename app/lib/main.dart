import 'package:flutter/material.dart';

void main() {
  runApp(VortiJatraApp());
}

class VortiJatraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VortiJatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0B3D2E),
        scaffoldBackgroundColor: Color(0xFF0B3D2E),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> exams = [
    {'name': 'DU A Unit', 'title': 'DU A Unit ভর্তি বিজ্ঞপ্তি প্রকাশিত', 'date': '২ মিনিট আগে'},
    {'name': 'NU', 'title': 'NU ভর্তি বিজ্ঞপ্তি প্রকাশিত', 'date': '১০ মিনিট আগে'},
    {'name': 'Medical', 'title': 'Medical Result প্রকাশিত', 'date': '৩০ মিনিট আগে'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B3D2E),
        title: Text('VortiJatra - ভর্তিযাত্রা', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF144A38),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFFD4AF37)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam['name']!, style: TextStyle(color: Colors.white, fontSize: 14)),
                SizedBox(height: 6),
                Text(exam['title']!, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(exam['date']!, style: TextStyle(color: Colors.white70)),
                SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37)),
                      child: Text('এখনই দেখুন', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('PDF ডাউনলোড', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
