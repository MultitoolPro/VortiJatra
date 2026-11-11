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

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B3D2E),
        title: Text(widget.title, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 16)),
        actions: [
          IconButton(icon: Icon(Icons.refresh, color: Colors.white), onPressed: () => controller.reload()),
          IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading) Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37))),
        ],
      ),
    );
  }
}
