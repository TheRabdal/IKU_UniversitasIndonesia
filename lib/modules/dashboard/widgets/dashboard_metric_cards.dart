import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardMetricCards extends StatelessWidget {
  const DashboardMetricCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = constraints.maxWidth > 1100
            ? 4
            : (constraints.maxWidth > 600 ? 2 : 1);

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: constraints.maxWidth > 1100 ? 2.3 : 2.6,
          children: [
            _buildMetricCard(
              title: 'Skor Mutu IKU UI',
              value: '86.4 / 100',
              subtitle: 'Status: Sangat Memuaskan (+3.2%)',
              icon: Icons.emoji_events_outlined,
              iconColor: const Color(0xFFB8860B),
              bgColor: const Color(0xFFF9F5EC),
            ),
            _buildMetricCard(
              title: 'Indikator Memenuhi Target',
              value: '7 dari 8 IKU',
              subtitle: '87.5% Realisasi Tercapai',
              icon: Icons.check_circle_outline_rounded,
              iconColor: const Color(0xFF389E0D),
              bgColor: const Color(0xFFF6FFED),
            ),
            _buildMetricCard(
              title: 'Fakultas Memenuhi Target',
              value: '11 / 14 Fakultas',
              subtitle: 'Rata-rata Skor >= 80.0%',
              icon: Icons.account_balance_outlined,
              iconColor: const Color(0xFF1890FF),
              bgColor: const Color(0xFFE6F7FF),
            ),
            _buildMetricCard(
              title: 'Dokumen Terverifikasi',
              value: '148 Berkas',
              subtitle: 'Tingkat Validitas 92.5%',
              icon: Icons.fact_check_outlined,
              iconColor: const Color(0xFF722ED1),
              bgColor: const Color(0xFFF9F0FF),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetricCard({
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
                    fontSize: 20,
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
