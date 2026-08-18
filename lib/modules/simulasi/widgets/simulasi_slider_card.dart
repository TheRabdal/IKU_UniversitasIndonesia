import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SimulasiSliderCard extends StatelessWidget {
  final int index;
  final SimulasiItemModel item;
  final ValueChanged<double> onChanged;

  const SimulasiSliderCard({
    super.key,
    required this.index,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double delta = item.projectedRealization - item.baselineRealization;
    final bool isUp = delta > 0.05;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFEADBBE),
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x04000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F5EC),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFDFC99A)),
                    ),
                    child: Text(
                      item.code,
                      style: const TextStyle(
                        color: Color(0xFF8C6D1F),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Color(0xFF22201C),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Bobot: ${item.weight}%',
                    style: const TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isUp
                          ? const Color(0xFFF6FFED)
                          : const Color(0xFFFAF8F5),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isUp
                            ? const Color(0xFFB7EB8F)
                            : const Color(0xFFDFC99A),
                      ),
                    ),
                    child: Text(
                      '${item.projectedRealization.toStringAsFixed(1)}% (Target ${item.target}%)',
                      style: TextStyle(
                        color: isUp
                            ? const Color(0xFF389E0D)
                            : const Color(0xFF8C6D1F),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Baseline: ${item.baselineRealization}%',
                style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 11,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: const Color(0xFFB8860B),
                    inactiveTrackColor: const Color(0xFFF2ECE1),
                    thumbColor: const Color(0xFFB8860B),
                    overlayColor: const Color(0x29B8860B),
                    trackHeight: 5,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                  ),
                  child: Slider(
                    value: item.projectedRealization,
                    min: 0.0,
                    max: 100.0,
                    divisions: 200,
                    label: '${item.projectedRealization.toStringAsFixed(1)}%',
                    onChanged: onChanged,
                  ),
                ),
              ),
              Text(
                '100%',
                style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
