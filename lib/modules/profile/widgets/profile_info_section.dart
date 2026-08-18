import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, _) {
        final profile = provider.userProfile;

        return Container(
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
                color: Color(0x06000000),
                blurRadius: 12,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Kepegawaian & Penugasan IKU',
                style: TextStyle(
                  color: Color(0xFF22201C),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Data resmi yang terintegrasi dengan SIMPEG & SSO Universitas Indonesia',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 18),
              const Divider(color: Color(0xFFF0ECE1), height: 1),
              const SizedBox(height: 14),
              _buildInfoRow(
                label: 'Nomor Induk Pegawai (NIP)',
                value: profile.nip,
                icon: Icons.badge_outlined,
              ),
              const Divider(color: Color(0xFFF7F4EC), height: 16),
              _buildInfoRow(
                label: 'Unit Kerja / Direktorat',
                value: profile.unit,
                icon: Icons.business_outlined,
              ),
              const Divider(color: Color(0xFFF7F4EC), height: 16),
              _buildInfoRow(
                label: 'Nomor SK Penugasan Evaluator',
                value: profile.skNumber,
                icon: Icons.gavel_outlined,
              ),
              const Divider(color: Color(0xFFF7F4EC), height: 16),
              _buildInfoRow(
                label: 'Nomor Kontak / WhatsApp',
                value: profile.phone,
                icon: Icons.phone_outlined,
              ),
              const Divider(color: Color(0xFFF7F4EC), height: 16),
              _buildInfoRow(
                label: 'Akun Terhubung',
                value: 'SSO UI (Single Sign-On Aktif & Terverifikasi)',
                icon: Icons.lock_outline_rounded,
                isHighlight: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required IconData icon,
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: isHighlight
                ? const Color(0xFF389E0D)
                : const Color(0xFF8C6D1F),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: isHighlight
                    ? const Color(0xFF389E0D)
                    : const Color(0xFF22201C),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
