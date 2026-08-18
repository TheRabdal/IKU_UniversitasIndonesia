import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAF8F5),
      padding: const EdgeInsets.all(28),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFEADBBE),
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F4EA),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDFC99A),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.fact_check_rounded,
                  color: Color(0xFFB8860B),
                  size: 26,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Audit Indikator Kinerja Utama',
                style: TextStyle(
                  color: Color(0xFF22201C),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Modul Audit & Evaluasi Kinerja',
                style: TextStyle(
                  color: Color(0xFF8C6D1F),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
