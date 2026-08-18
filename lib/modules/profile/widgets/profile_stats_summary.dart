import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfileStatsSummary extends StatelessWidget {
  const ProfileStatsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, _) {
        final profile = provider.userProfile;

        return LayoutBuilder(
          builder: (context, constraints) {
            final int crossAxisCount = constraints.maxWidth > 900 ? 3 : 1;

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: constraints.maxWidth > 900 ? 3.0 : 3.5,
              children: [
                _buildStatTile(
                  title: 'Berkas Telah Diaudit',
                  value: '${profile.verifiedAuditCount} Berkas',
                  subtitle: 'Tingkat akurasi 100%',
                  icon: Icons.fact_check_outlined,
                  iconColor: const Color(0xFFB8860B),
                  bgColor: const Color(0xFFF9F5EC),
                ),
                _buildStatTile(
                  title: 'Indikator Dipantau',
                  value: '${profile.monitoredIkuCount} Indikator',
                  subtitle: 'IKU 1 s/d IKU 8 Nasional',
                  icon: Icons.auto_graph_rounded,
                  iconColor: const Color(0xFF389E0D),
                  bgColor: const Color(0xFFF6FFED),
                ),
                _buildStatTile(
                  title: 'Aktivitas Terakhir',
                  value: 'Hari Ini',
                  subtitle: profile.lastLogin,
                  icon: Icons.access_time_rounded,
                  iconColor: const Color(0xFF1890FF),
                  bgColor: const Color(0xFFE6F7FF),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatTile({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFEADBBE),
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF22201C),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
