import 'package:flutter/material.dart';
import 'browser_screen.dart';
import 'wallet_screen.dart';
import 'seat_plan_screen.dart';
import 'notification_service.dart';
import 'splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(VortiJatraApp());
}

class VortiJatraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VortiJatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF0B3D2E), scaffoldBackgroundColor: Color(0xFF071E17)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeContent(),
    WalletScreen(),
    SeatPlanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0B3D2E),
        selectedItemColor: Color(0xFFD4AF37),
        unselectedItemColor: Colors.white54,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'ওয়ালেট'),
          BottomNavigationBarItem(icon: Icon(Icons.event_seat), label: 'সিট প্ল্যান'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, String>> exams = [
    {'name': 'DU A UNIT', 'title': 'DU A Unit ভর্তি বিজ্ঞপ্তি প্রকাশিত', 'date': '২ মিনিট আগে', 'url': 'https://admission.eis.du.ac.bd'},
    {'name': 'NU', 'title': 'NU ভর্তি বিজ্ঞপ্তি প্রকাশিত', 'date': '১০ মিনিট আগে', 'url': 'https://www.nu.ac.bd/admissions'},
    {'name': 'MEDICAL', 'title': 'Medical Result প্রকাশিত', 'date': '৩০ মিনিট আগে', 'url': 'https://result.dghs.gov.bd'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        title: Text('VortiJatra ✨', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.notifications, color: Color(0xFFD4AF37)), onPressed: () {
          NotificationService.showBiggopti('DU A Unit');
        })],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Color(0xFF144A38), borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFD4AF37).withOpacity(0.4))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Color(0xFFD4AF37), borderRadius: BorderRadius.circular(20)), child: Text(exam['name']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                Text(exam['date']!, style: TextStyle(color: Colors.white60, fontSize: 12)),
              ]),
              SizedBox(height: 10),
              Text(exam['title']!, style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Row(children: [
                Expanded(child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BrowserScreen(title: exam['title']!, url: exam['url']!)));
                }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37)), child: Text('এখনই দেখুন', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: Text('PDF', style: TextStyle(color: Colors.white))),
              ]),
            ]),
          );
        },
      ),
    );
  }
}
