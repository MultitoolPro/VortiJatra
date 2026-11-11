import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    await _plugin.initialize(settings);
  }

  // Premium Notification - Individual Mention
  static Future<void> showPremium({
    required String university,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'vortijatra_premium',
      'VortiJatra Premium',
      channelDescription: 'DU A Unit, NU, Medical - Sob Public Exam Notification',
      importance: Importance.max,
      priority: Priority.high,
      color: Color(0xFF0B3D2E),
      playSound: true,
      enableVibration: true,
      styleInformation: BigTextStyleInformation(''),
    );

    const details = NotificationDetails(android: androidDetails);

    // Example: DU A Unit ভর্তি বিজ্ঞপ্তি প্রকাশিত
    // Example: NU ভর্তি বিজ্ঞপ্তি প্রকাশিত
    // Example: Medical Result প্রকাশিত
    await _plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      '$university - $title',
      body,
      details,
    );
  }

  // Result er 2 din age
  static Future<void> showResultReminder(String university) async {
    await showPremium(
      university: university,
      title: 'রেজাল্ট ২ দিনের মধ্যে',
      body: '$university রেজাল্ট ২ দিনের মধ্যে প্রকাশিত হবে। প্রস্তুত থাকো!',
    );
  }

  // Result publish howa matroi
  static Future<void> showResultPublished(String university) async {
    await showPremium(
      university: university,
      title: 'রেজাল্ট প্রকাশিত!',
      body: '$university রেজাল্ট প্রকাশিত! এখনই দেখে নাও।',
    );
  }

  // Vorti Biggopti
  static Future<void> showBiggopti(String university) async {
    await showPremium(
      university: university,
      title: 'ভর্তি বিজ্ঞপ্তি প্রকাশিত',
      body: '$university ভর্তি বিজ্ঞপ্তি প্রকাশিত। এখনই দেখুন।',
    );
  }

  // Admit Card
  static Future<void> showAdmit(String university) async {
    await showPremium(
      university: university,
      title: 'অ্যাডমিট কার্ড ছেড়েছে',
      body: '$university অ্যাডমিট কার্ড ছেড়েছে। এখনই ডাউনলোড করো।',
    );
  }
}
