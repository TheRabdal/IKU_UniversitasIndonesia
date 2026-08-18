class UserProfileModel {
  final String name;
  final String email;
  final String role;
  final String nip;
  final String unit;
  final String phone;
  final String skNumber;
  final String lastLogin;
  final int verifiedAuditCount;
  final int monitoredIkuCount;

  const UserProfileModel({
    required this.name,
    required this.email,
    required this.role,
    required this.nip,
    required this.unit,
    required this.phone,
    required this.skNumber,
    required this.lastLogin,
    required this.verifiedAuditCount,
    required this.monitoredIkuCount,
  });

  UserProfileModel copyWith({
    String? name,
    String? email,
    String? role,
    String? nip,
    String? unit,
    String? phone,
    String? skNumber,
    String? lastLogin,
    int? verifiedAuditCount,
    int? monitoredIkuCount,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      nip: nip ?? this.nip,
      unit: unit ?? this.unit,
      phone: phone ?? this.phone,
      skNumber: skNumber ?? this.skNumber,
      lastLogin: lastLogin ?? this.lastLogin,
      verifiedAuditCount: verifiedAuditCount ?? this.verifiedAuditCount,
      monitoredIkuCount: monitoredIkuCount ?? this.monitoredIkuCount,
    );
  }
}
