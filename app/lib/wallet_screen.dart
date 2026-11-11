import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  final List<Map<String, String>> docs = [
    {'name': 'DU A Unit Admit Card', 'type': 'ADMIT CARD', 'date': 'ডাউনলোড করা • 2.1 MB', 'icon': '🎫'},
    {'name': 'HSC Marksheet', 'type': 'MARKSHEET', 'date': 'সেভ করা • 1.4 MB', 'icon': '📜'},
    {'name': 'Passport Size Photo', 'type': 'PHOTO', 'date': 'সেভ করা • 300 KB', 'icon': '🖼️'},
    {'name': 'Signature', 'type': 'SIGNATURE', 'date': 'সেভ করা • 120 KB', 'icon': '✍️'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('ডকুমেন্ট ওয়ালেট', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
        actions: [Icon(Icons.verified, color: Color(0xFFD4AF37))],
      ),
      body: Column(
        children: [
          // PREMIUM GOLD CARD
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B), Color(0xFF0B3D2E)]),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: Offset(0, 10))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('VORTIJATRA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  Icon(Icons.fingerprint, color: Colors.white, size: 28),
                ]),
                SizedBox(height: 16),
                Text('4 টি ডকুমেন্ট সুরক্ষিত আছে', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('অফলাইনেও দেখা যাবে • হারাবে না • 100% Private', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 16),
                Row(children: [
                  _chip('🔒 Encrypted'),
                  SizedBox(width: 8),
                  _chip('☁️ Auto Backup'),
                ]),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, i) {
                final d = docs[i];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF144A38).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.4)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56, height: 56,
                        decoration: BoxDecoration(color: Color(0xFFD4AF37).withOpacity(0.15), borderRadius: BorderRadius.circular(16)),
                        child: Center(child: Text(d['icon']!, style: TextStyle(fontSize: 28))),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(d['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 2),
                            Text(d['type']!, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(d['date']!, style: TextStyle(color: Colors.white60, fontSize: 12)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(color: Color(0xFFD4AF37), borderRadius: BorderRadius.circular(20)),
                        child: Text('খুলুন', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD4AF37),
        child: Icon(Icons.add, color: Colors.black, size: 28),
        onPressed: () {},
      ),
    );
  }

  Widget _chip(String t) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.25), borderRadius: BorderRadius.circular(20)),
      child: Text(t, style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}
