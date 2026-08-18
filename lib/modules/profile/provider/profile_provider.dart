import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfileProvider extends ChangeNotifier {
  UserProfileModel _userProfile = const UserProfileModel(
    name: 'Dr. Ir. Budi Santoso, M.Kom.',
    email: 'admin.iku@ui.ac.id',
    role: 'Super Administrator & Verifikator Mutu IKU',
    nip: '198503152010121001',
    unit: 'Direktorat Perencanaan, Transformasi & Penjaminan Mutu UI',
    phone: '+62 812-3456-7890',
    skNumber: 'SK-REKTOR/UI/IKU/2025-084',
    lastLogin: '18 Februari 2026, 22:45 WIB',
    verifiedAuditCount: 148,
    monitoredIkuCount: 8,
  );

  bool _isEditing = false;

  UserProfileModel get userProfile => _userProfile;
  bool get isEditing => _isEditing;

  void toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String unit,
    required String nip,
  }) {
    _userProfile = _userProfile.copyWith(
      name: name,
      email: email,
      phone: phone,
      unit: unit,
      nip: nip,
    );
    _isEditing = false;
    notifyListeners();
  }
}
