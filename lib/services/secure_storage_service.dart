import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureProfileService {
  final _storage = FlutterSecureStorage();

  Future<void> saveProfile(Map<String, dynamic> profile) async {
    await _storage.write(key: 'vorti_profile', value: jsonEncode(profile));
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final data = await _storage.read(key: 'vorti_profile');
    if (data == null) return null;
    return jsonDecode(data);
  }

  Future<void> deleteProfile() async {
    await _storage.delete(key: 'vorti_profile');
  }
}
