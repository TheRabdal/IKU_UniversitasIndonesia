import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SimulasiScoreCard extends StatelessWidget {
  const SimulasiScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SimulasiProvider>(
      builder: (context, provider, _) {
        final delta = provider.deltaScore;
        final bool isPositive = delta >= 0;

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Skor Proyeksi IKU Universitas',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          provider.projectedTotalScore.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Color(0xFFB8860B),
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '/ 100 Poin',
                          style: const TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: isPositive
                                ? const Color(0xFFF6FFED)
                                : const Color(0xFFFFF1F0),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: isPositive
                                  ? const Color(0xFFB7EB8F)
                                  : const Color(0xFFFFA39E),
                            ),
                          ),
                          child: Text(
                            '${isPositive ? '+' : ''}${delta.toStringAsFixed(2)} Poin',
                            style: TextStyle(
                              color: isPositive
                                  ? const Color(0xFF389E0D)
                                  : const Color(0xFFCF1322),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Baseline: ${provider.baselineTotalScore.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 1,
                color: const Color(0xFFF0ECE1),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Estimasi Insentif PTN-BH (BOPTN)',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rp ${provider.estimatedIncentiveInBillion.toStringAsFixed(1)} Miliar',
                      style: const TextStyle(
                        color: Color(0xFF22201C),
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Berdasarkan bobot formula kementerian',
                      style: TextStyle(
                        color: Color(0xFF8C6D1F),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF8C6D1F),
                  side: const BorderSide(color: Color(0xFFDFC99A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.restart_alt_rounded, size: 18),
                label: const Text('Reset Simulasi'),
                onPressed: provider.resetAll,
              ),
            ],
          ),
        );
      },
    );
  }
}
