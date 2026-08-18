import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfileProvider extends ChangeNotifier {
  UserProfileModel _userProfile = const UserProfileModel(
    name: 'Admin IKU',
    email: 'admin@ui.ac.id',
    role: 'Administrator',
    nip: '198503152010121001',
    unit: 'Direktorat Perencanaan & Transformasi UI',
  );

  UserProfileModel get userProfile => _userProfile;

  void updateProfile(UserProfileModel newProfile) {
    _userProfile = newProfile;
    notifyListeners();
  }
}
