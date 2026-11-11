class UserProfile {
  String fullName;
  String fatherName;
  String motherName;
  String dob;
  String sscRoll;
  String sscBoard;
  String sscYear;
  String hscRoll;
  String hscBoard;
  String hscYear;
  String phone;
  String address;
  String photoUrl;
  bool consentGiven;
  DateTime updatedAt;

  UserProfile({
    required this.fullName,
    required this.fatherName,
    required this.motherName,
    required this.dob,
    required this.sscRoll,
    required this.sscBoard,
    required this.sscYear,
    required this.hscRoll,
    required this.hscBoard,
    required this.hscYear,
    required this.phone,
    required this.address,
    this.photoUrl = '',
    this.consentGiven = false,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'fatherName': fatherName,
      'motherName': motherName,
      'dob': dob,
      'sscRoll': sscRoll,
      'sscBoard': sscBoard,
      'sscYear': sscYear,
      'hscRoll': hscRoll,
      'hscBoard': hscBoard,
      'hscYear': hscYear,
      'phone': phone,
      'address': address,
      'photoUrl': photoUrl,
      'consentGiven': consentGiven,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      fullName: map['fullName'] ?? '',
      fatherName: map['fatherName'] ?? '',
      motherName: map['motherName'] ?? '',
      dob: map['dob'] ?? '',
      sscRoll: map['sscRoll'] ?? '',
      sscBoard: map['sscBoard'] ?? '',
      sscYear: map['sscYear'] ?? '',
      hscRoll: map['hscRoll'] ?? '',
      hscBoard: map['hscBoard'] ?? '',
      hscYear: map['hscYear'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      consentGiven: map['consentGiven'] ?? false,
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
