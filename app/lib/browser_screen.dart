import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {
  final String title;
  final String url;
  BrowserScreen({required this.title, required this.url});
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  late final WebViewController controller;
  bool isLoading = true;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (p) => setState(() => progress = p / 100),
          onPageFinished: (url) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071E17),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B3D2E),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 14, fontWeight: FontWeight.bold)),
            Text('VortiJatra Secure Browser 🔒', style: TextStyle(color: Colors.white60, fontSize: 11)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.refresh, color: Colors.white), onPressed: () => controller.reload()),
          IconButton(icon: Icon(Icons.share, color: Color(0xFFD4AF37)), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: LinearProgressIndicator(value: isLoading ? progress : 0, backgroundColor: Colors.transparent, valueColor: AlwaysStoppedAnimation(Color(0xFFD4AF37))),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Container(
              color: Color(0xFF071E17),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle),
                      child: Text('VJ', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 16),
                    Text('লোড হচ্ছে...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(widget.url, style: TextStyle(color: Colors.white54, fontSize: 12)),
                    SizedBox(height: 16),
                    CircularProgressIndicator(color: Color(0xFFD4AF37)),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD4AF37),
        child: Icon(Icons.download, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}
