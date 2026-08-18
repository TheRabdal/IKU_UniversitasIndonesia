import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditStatSummary extends StatelessWidget {
  const AuditStatSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuditProvider>(
      builder: (context, provider, _) {
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
              childAspectRatio: constraints.maxWidth > 1100 ? 2.3 : 2.5,
              children: [
                _buildStatItem(
                  title: 'Total Berkas Masuk',
                  count: provider.totalCount.toString(),
                  icon: Icons.folder_copy_outlined,
                  iconColor: const Color(0xFF8C6D1F),
                  bgColor: const Color(0xFFF9F5EC),
                ),
                _buildStatItem(
                  title: 'Menunggu Verifikasi',
                  count: provider.pendingCount.toString(),
                  icon: Icons.hourglass_top_rounded,
                  iconColor: const Color(0xFFD48806),
                  bgColor: const Color(0xFFFFFBE6),
                ),
                _buildStatItem(
                  title: 'Disetujui / Valid',
                  count: provider.approvedCount.toString(),
                  icon: Icons.check_circle_outline_rounded,
                  iconColor: const Color(0xFF389E0D),
                  bgColor: const Color(0xFFF6FFED),
                ),
                _buildStatItem(
                  title: 'Perlu Revisi',
                  count: provider.revisionCount.toString(),
                  icon: Icons.error_outline_rounded,
                  iconColor: const Color(0xFFCF1322),
                  bgColor: const Color(0xFFFFF1F0),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatItem({
    required String title,
    required String count,
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
                  count,
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
                    color: Color(0xFF777777),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
