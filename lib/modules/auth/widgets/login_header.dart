import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F5EC),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFDFC99A),
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12B8860B),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.school_rounded,
              color: Color(0xFFB8860B),
              size: 36,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Indikator Kinerja Utama',
          style: TextStyle(
            color: Color(0xFF22201C),
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Universitas Indonesia',
          style: TextStyle(
            color: Color(0xFF8C6D1F),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
