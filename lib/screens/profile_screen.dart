import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../services/secure_storage_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _service = SecureProfileService();
  final _nameCtrl = TextEditingController();
  final _fatherCtrl = TextEditingController();
  final _motherCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _sscRollCtrl = TextEditingController();
  final _hscRollCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  bool consentGiven = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _autoFill();
  }

  Future<void> _autoFill() async {
    final saved = await _service.getProfile();
    if (saved != null) {
      setState(() {
        _nameCtrl.text = saved['fullName'] ?? '';
        _fatherCtrl.text = saved['fatherName'] ?? '';
        _motherCtrl.text = saved['motherName'] ?? '';
        _dobCtrl.text = saved['dob'] ?? '';
        _sscRollCtrl.text = saved['sscRoll'] ?? '';
        _hscRollCtrl.text = saved['hscRoll'] ?? '';
        _phoneCtrl.text = saved['phone'] ?? '';
        _addressCtrl.text = saved['address'] ?? '';
        consentGiven = saved['consentGiven'] ?? false;
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('আপনার সেভ করা তথ্য দিয়ে অটো-ফিল করা হয়েছে')),
        );
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  Future<void> _save() async {
    if (!consentGiven) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('সেভ করতে নিচে টিক দিন, না হলে শুধু এইবারের জন্য থাকবে')),
      );
      return;
    }
    final profile = UserProfile(
      fullName: _nameCtrl.text,
      fatherName: _fatherCtrl.text,
      motherName: _motherCtrl.text,
      dob: _dobCtrl.text,
      sscRoll: _sscRollCtrl.text,
      sscBoard: 'Dhaka',
      sscYear: '2023',
      hscRoll: _hscRollCtrl.text,
      hscBoard: 'Dhaka',
      hscYear: '2025',
      phone: _phoneCtrl.text,
      address: _addressCtrl.text,
      consentGiven: true,
      updatedAt: DateTime.now(),
    );
    await _service.saveProfile(profile.toMap());
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('নিরাপদে সেভ হয়েছে! পরের বার অটো-ফিল হবে')),
      );
    }
  }

  Future<void> _delete() async {
    await _service.deleteProfile();
    setState(() {
      _nameCtrl.clear();
      _fatherCtrl.clear();
      _motherCtrl.clear();
      _dobCtrl.clear();
      _sscRollCtrl.clear();
      _hscRollCtrl.clear();
      _phoneCtrl.clear();
      _addressCtrl.clear();
      consentGiven = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      appBar: AppBar(title: const Text('আমার প্রোফাইল - VortiJatra')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Full Name')),
            TextField(controller: _fatherCtrl, decoration: const InputDecoration(labelText: "Father's Name")),
            TextField(controller: _motherCtrl, decoration: const InputDecoration(labelText: "Mother's Name")),
            TextField(controller: _dobCtrl, decoration: const InputDecoration(labelText: 'Date of Birth')),
            TextField(controller: _sscRollCtrl, decoration: const InputDecoration(labelText: 'SSC Roll')),
            TextField(controller: _hscRollCtrl, decoration: const InputDecoration(labelText: 'HSC Roll')),
            TextField(controller: _phoneCtrl, decoration: const InputDecoration(labelText: 'Phone')),
            TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Address')),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: consentGiven,
              title: const Text('আমার তথ্য নিরাপদে সেভ করে রাখুন'),
              subtitle: const Text('পরের বার যাতে আবার লিখতে না হয়। চাইলে যেকোনো সময় মুছে ফেলতে পারবেন।'),
              onChanged: (v) => setState(() => consentGiven = v ?? false),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _save, child: const Text('সেভ করুন')),
            TextButton(onPressed: _delete, child: const Text('সেভ করা তথ্য মুছে ফেলুন', style: TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
