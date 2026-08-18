import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, setting, _) {
        return Container(
          width: double.infinity,
          color: const Color(0xFFFAF8F5),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFEADBBE),
                      width: 1.5,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x08000000),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F5EC),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFDFC99A),
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.settings_outlined,
                          color: Color(0xFFB8860B),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Pengaturan Sistem',
                              style: TextStyle(
                                color: Color(0xFF22201C),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Konfigurasi periode akademik, notifikasi, keamanan, dan preferensi IKU UI',
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SettingSectionCard(
                  title: 'Periode & Pengukuran IKU',
                  subtitle: 'Konfigurasi tahun akademik aktif dan sinkronisasi data',
                  icon: Icons.calendar_today_rounded,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tahun Akademik Aktif',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Periode pengukuran data indikator yang sedang berjalan',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F5EC),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFDFC99A),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: setting.academicYear,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xFF8C6D1F),
                                  size: 20,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFF8C6D1F),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: '2025/2026 - Gasal',
                                    child: Text('2025/2026 - Gasal'),
                                  ),
                                  DropdownMenuItem(
                                    value: '2024/2025 - Genap',
                                    child: Text('2024/2025 - Genap'),
                                  ),
                                  DropdownMenuItem(
                                    value: '2024/2025 - Gasal',
                                    child: Text('2024/2025 - Gasal'),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) setting.setAcademicYear(val);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Color(0xFFF4F0E6), height: 16),
                    SettingSwitchTile(
                      title: 'Sinkronisasi Otomatis SIAK & SIMPEG',
                      description: 'Mengambil pembaruan data akademik dan kepegawaian secara berkala',
                      value: setting.autoSync,
                      onChanged: setting.toggleAutoSync,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SettingSectionCard(
                  title: 'Notifikasi & Pemberitahuan',
                  subtitle: 'Atur pemberitahuan email dan sistem terkait capaian IKU',
                  icon: Icons.notifications_none_rounded,
                  children: [
                    SettingSwitchTile(
                      title: 'Notifikasi Email Evaluasi IKU',
                      description: 'Kirim laporan ringkas mingguan ke email terdaftar',
                      value: setting.emailNotification,
                      onChanged: setting.toggleEmailNotification,
                    ),
                    const Divider(color: Color(0xFFF4F0E6), height: 16),
                    SettingSwitchTile(
                      title: 'Pengingat Batas Waktu Audit',
                      description: 'Dapatkan pengingat H-7 dan H-1 sebelum penutupan audit',
                      value: setting.deadlineReminder,
                      onChanged: setting.toggleDeadlineReminder,
                    ),
                    const Divider(color: Color(0xFFF4F0E6), height: 16),
                    SettingSwitchTile(
                      title: 'Peringatan Capaian Rendah',
                      description: 'Kirim notifikasi mendesak jika indikator berada di bawah 70% target',
                      value: setting.lowPerformanceAlert,
                      onChanged: setting.toggleLowPerformanceAlert,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SettingSectionCard(
                  title: 'Keamanan & Autentikasi',
                  subtitle: 'Kelola keamanan akun dan metode login terpadu',
                  icon: Icons.security_rounded,
                  children: [
                    SettingSwitchTile(
                      title: 'Autentikasi SSO UI (Single Sign-On)',
                      description: 'Gunakan akun resmi Universitas Indonesia untuk verifikasi masuk',
                      value: setting.twoFactorAuth,
                      onChanged: setting.toggleTwoFactorAuth,
                    ),
                    const Divider(color: Color(0xFFF4F0E6), height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Kata Sandi Akun',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Terakhir diperbarui 30 hari yang lalu',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8C6D1F),
                              side: const BorderSide(color: Color(0xFFDFC99A)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: const Text(
                                    'Ganti Kata Sandi',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF22201C),
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Kata Sandi Lama',
                                          border: OutlineInputBorder(),
                                          isDense: true,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Kata Sandi Baru',
                                          border: OutlineInputBorder(),
                                          isDense: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFB8860B),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Simpan'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Ganti Password'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SettingSectionCard(
                  title: 'Preferensi Bahasa',
                  subtitle: 'Pilih bahasa antarmuka aplikasi',
                  icon: Icons.language_rounded,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Bahasa Tampilan',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Bahasa yang digunakan pada seluruh menu dan laporan',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F5EC),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFDFC99A),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: setting.language,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xFF8C6D1F),
                                  size: 20,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFF8C6D1F),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Bahasa Indonesia',
                                    child: Text('Bahasa Indonesia'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'English (US)',
                                    child: Text('English (US)'),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) setting.setLanguage(val);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
