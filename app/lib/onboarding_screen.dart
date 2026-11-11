import 'package:flutter/material.dart';
import 'main.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String name = '';
  String district = 'রংপুর';
  List<String> selected = ['DU A Unit'];
  final List<String> unis = ['DU A Unit', 'DU B Unit', 'DU C Unit', 'NU', 'Medical', 'BUET', 'CU', 'RU', 'JU', 'GST'];
  final List<String> districts = ['রংপুর', 'ঢাকা', 'চট্টগ্রাম', 'রাজশাহী', 'খুলনা', 'বরিশাল', 'সিলেট', 'ময়মনসিংহ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text('আসসালামু আলাইকুম 👋', style: TextStyle(color: Colors.white70, fontSize: 16)),
              Text('তোমার যাত্রা শুরু হোক', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 26, fontWeight: FontWeight.bold)),
              Text('VortiJatra তে স্বাগতম', style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 24),
              Text('তোমার নাম', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                onChanged: (v) => name = v,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'যেমন: রাহাত',
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true, fillColor: Color(0xFF144A38),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 20),
              Text('তোমার জেলা', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(color: Color(0xFF144A38), borderRadius: BorderRadius.circular(16)),
                child: DropdownButton<String>(
                  value: district, dropdownColor: Color(0xFF144A38), isExpanded: true, underline: SizedBox(),
                  style: TextStyle(color: Colors.white),
                  items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                  onChanged: (v) => setState(() => district = v!),
                ),
              ),
              SizedBox(height: 20),
              Text('তোমার টার্গেট পরীক্ষা সিলেক্ট করো (একাধিক পারবে)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 8, runSpacing: 8,
                children: unis.map((u) {
                  bool isSel = selected.contains(u);
                  return GestureDetector(
                    onTap: () => setState(() {
                      if (isSel) selected.remove(u); else selected.add(u);
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSel ? Color(0xFFD4AF37) : Color(0xFF144A38),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: isSel ? Color(0xFFD4AF37) : Colors.white24),
                      ),
                      child: Text(u, style: TextStyle(color: isSel ? Colors.black : Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity, height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  child: Text('শুরু করি 🚀  •  ${selected.length} টি পরীক্ষা সিলেক্টেড', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              SizedBox(height: 12),
              Center(child: Text('তোমার তথ্য 100% প্রাইভেট থাকবে', style: TextStyle(color: Colors.white54, fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}
