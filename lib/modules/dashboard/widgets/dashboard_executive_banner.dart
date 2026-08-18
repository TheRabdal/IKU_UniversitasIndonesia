import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardExecutiveBanner extends StatelessWidget {
  const DashboardExecutiveBanner({super.key});

  @override
  Widget build(BuildContext context) {
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
              Icons.dashboard_rounded,
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
                  'Dashboard Eksekutif IKU Universitas Indonesia',
                  style: TextStyle(
                    color: Color(0xFF22201C),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Sistem Monitoring Capaian, Evaluasi Mutu & Proyeksi Kinerja PTN-BH UI',
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F5EC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFDFC99A),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.verified_rounded,
                  size: 16,
                  color: Color(0xFF8C6D1F),
                ),
                SizedBox(width: 8),
                Text(
                  'Tahun 2025/2026 - Gasal',
                  style: TextStyle(
                    color: Color(0xFF8C6D1F),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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
