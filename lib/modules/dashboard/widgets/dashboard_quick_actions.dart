import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

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
          childAspectRatio: constraints.maxWidth > 1100 ? 2.4 : 2.6,
          children: [
            _buildActionCard(
              context: context,
              title: '8 Indikator IKU',
              subtitle: 'Pantau target & realisasi indikator',
              icon: Icons.auto_graph_rounded,
              index: 1,
              appBarTitle: '8 Indikator Kinerja Utama (IKU)',
            ),
            _buildActionCard(
              context: context,
              title: 'Audit & Bukti Dukung',
              subtitle: 'Verifikasi dokumen dan SK fakultas',
              icon: Icons.fact_check_rounded,
              index: 2,
              appBarTitle: 'Audit Indikator Kinerja Utama',
            ),
            _buildActionCard(
              context: context,
              title: 'Laporan & Rekapitulasi',
              subtitle: 'Peringkat fakultas dan ekspor berkas',
              icon: Icons.assessment_outlined,
              index: 3,
              appBarTitle: 'Laporan & Rekapitulasi Capaian IKU',
            ),
            _buildActionCard(
              context: context,
              title: 'Simulasi What-If',
              subtitle: 'Proyeksi kenaikan skor & insentif',
              icon: Icons.insights_rounded,
              index: 4,
              appBarTitle: 'Simulasi Proyeksi Capaian IKU',
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required int index,
    required String appBarTitle,
  }) {
    return InkWell(
      onTap: () {
        context.read<SidebarProvider>().setSelectedIndex(index);
        context.read<AppBarProvider>().setTitle(appBarTitle);
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
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
              decoration: const BoxDecoration(
                color: Color(0xFFF9F5EC),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFFB8860B), size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF22201C),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF8C6D1F),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
