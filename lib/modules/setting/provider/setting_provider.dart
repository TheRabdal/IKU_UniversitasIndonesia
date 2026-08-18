import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SettingProvider extends ChangeNotifier {
  String _academicYear = '2025/2026 - Gasal';
  bool _autoSync = true;
  bool _emailNotification = true;
  bool _deadlineReminder = true;
  bool _lowPerformanceAlert = true;
  bool _twoFactorAuth = true;
  String _language = 'Bahasa Indonesia';

  String get academicYear => _academicYear;
  bool get autoSync => _autoSync;
  bool get emailNotification => _emailNotification;
  bool get deadlineReminder => _deadlineReminder;
  bool get lowPerformanceAlert => _lowPerformanceAlert;
  bool get twoFactorAuth => _twoFactorAuth;
  String get language => _language;

  void setAcademicYear(String value) {
    _academicYear = value;
    notifyListeners();
  }

  void toggleAutoSync(bool value) {
    _autoSync = value;
    notifyListeners();
  }

  void toggleEmailNotification(bool value) {
    _emailNotification = value;
    notifyListeners();
  }

  void toggleDeadlineReminder(bool value) {
    _deadlineReminder = value;
    notifyListeners();
  }

  void toggleLowPerformanceAlert(bool value) {
    _lowPerformanceAlert = value;
    notifyListeners();
  }

  void toggleTwoFactorAuth(bool value) {
    _twoFactorAuth = value;
    notifyListeners();
  }

  void setLanguage(String value) {
    _language = value;
    notifyListeners();
  }
}
