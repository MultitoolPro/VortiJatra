import 'package:flutter/material.dart';

class SeatPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('সিট প্ল্যান', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // EXAM CARD - PREMIUM
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B)]),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('DU A UNIT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                    Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Text('কালকে পরীক্ষা', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  ]),
                  SizedBox(height: 12),
                  Text('সিট নং: A-1042', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 6),
                  Text('কার্জন হল • রুম ২০১ • ২য় তলা', style: TextStyle(fontSize: 16, color: Colors.black87)),
                  SizedBox(height: 12),
                  Row(children: [
                    Icon(Icons.access_time, size: 16), SizedBox(width: 4), Text('সকাল ১১:০০ টা  •  রিপোর্টিং ১০:০০ টা'),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 3 BUTTONS
            Row(children: [
              Expanded(child: _action('🗺️', 'ম্যাপ দেখুন')),
              SizedBox(width: 10),
              Expanded(child: _action('📸', 'হল ছবি')),
              SizedBox(width: 10),
              Expanded(child: _action('📤', 'শেয়ার')),
            ]),
            SizedBox(height: 16),
            // INSTRUCTION
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xFF144A38), borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('পরীক্ষার দিন যা লাগবে', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  Text('✅ অ্যাডমিট কার্ড (অরিজিনাল + ফটোকপি)\n✅ HSC রেজিস্ট্রেশন কার্ড\n✅ কলম - কালো বলপেন\n✅ ১ ঘণ্টা আগে পৌঁছাও', style: TextStyle(color: Colors.white, height: 1.6)),
                ],
              ),
            ),
            SizedBox(height: 16),
            // OTHER EXAMS
            Text('তোমার অন্য পরীক্ষা', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            _other('NU ভর্তি পরীক্ষা', 'সিট: B-221 • Govt. College, Rajshahi'),
            _other('Medical ভর্তি পরীক্ষা', 'সিট: M-55 • Dhaka Medical College'),
          ],
        ),
      ),
    );
  }

  Widget _action(String emoji, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Color(0xFF144A38), borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.3))),
      child: Column(children: [Text(emoji, style: TextStyle(fontSize: 22)), SizedBox(height: 4), Text(label, style: TextStyle(color: Colors.white, fontSize: 12))]),
    );
  }

  Widget _other(String title, String sub) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Color(0xFF144A38), borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Icon(Icons.location_on, color: Color(0xFFD4AF37)),
        SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(sub, style: TextStyle(color: Colors.white60, fontSize: 12))])),
        Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
      ]),
    );
  }
}
