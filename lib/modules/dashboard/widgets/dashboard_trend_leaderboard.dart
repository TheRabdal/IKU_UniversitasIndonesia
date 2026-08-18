import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardTrendLeaderboard extends StatelessWidget {
  const DashboardTrendLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(22),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Tren Skor Tahunan UI',
                    style: TextStyle(
                      color: Color(0xFF22201C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '2022 - 2025',
                    style: TextStyle(
                      color: Color(0xFF8C6D1F),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF0ECE1), height: 1),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildYearBar(year: '2022', score: 76.8, height: 90),
                  _buildYearBar(year: '2023', score: 80.2, height: 105),
                  _buildYearBar(year: '2024', score: 83.5, height: 120),
                  _buildYearBar(
                    year: '2025',
                    score: 86.4,
                    height: 140,
                    isCurrent: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(22),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top 3 Fakultas Capaian Tertinggi',
                    style: TextStyle(
                      color: Color(0xFF22201C),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<SidebarProvider>().setSelectedIndex(3);
                      context
                          .read<AppBarProvider>()
                          .setTitle('Laporan & Rekapitulasi Capaian IKU');
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Color(0xFF8C6D1F),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildTopFacultyItem(
                rank: 1,
                name: 'Fakultas Ilmu Komputer (FASILKOM)',
                score: '92.4%',
                badgeColor: const Color(0xFFD4AF37),
              ),
              const SizedBox(height: 10),
              _buildTopFacultyItem(
                rank: 2,
                name: 'Fakultas Teknik (FT)',
                score: '89.8%',
                badgeColor: const Color(0xFFC0C0C0),
              ),
              const SizedBox(height: 10),
              _buildTopFacultyItem(
                rank: 3,
                name: 'Fakultas Ekonomi dan Bisnis (FEB)',
                score: '87.5%',
                badgeColor: const Color(0xFFCD7F32),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYearBar({
    required String year,
    required double score,
    required double height,
    bool isCurrent = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$score',
          style: TextStyle(
            color: isCurrent ? const Color(0xFFB8860B) : const Color(0xFF777777),
            fontSize: 12,
            fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 38,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isCurrent
                  ? const [Color(0xFFD4AF37), Color(0xFFB8860B)]
                  : const [Color(0xFFEADBBE), Color(0xFFDFC99A)],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          year,
          style: TextStyle(
            color: isCurrent ? const Color(0xFF22201C) : const Color(0xFF888888),
            fontSize: 12,
            fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTopFacultyItem({
    required int rank,
    required String name,
    required String score,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF8F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF0EAE0)),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF22201C),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            score,
            style: const TextStyle(
              color: Color(0xFFB8860B),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
