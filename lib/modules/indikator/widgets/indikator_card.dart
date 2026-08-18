import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class IndikatorCard extends StatelessWidget {
  final IndikatorModel item;

  const IndikatorCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F5EC),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFFDFC99A),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      item.code,
                      style: const TextStyle(
                        color: Color(0xFF8C6D1F),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Bobot ${item.weight}%',
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F5EC),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDFC99A),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  item.icon,
                  color: const Color(0xFFB8860B),
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF22201C),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.category,
            style: const TextStyle(
              color: Color(0xFF8C6D1F),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF8F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFFF0EAE0),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Realisasi',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.realization}%',
                      style: const TextStyle(
                        color: Color(0xFFB8860B),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Target',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.target}%',
                      style: const TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: item.percentage,
              minHeight: 6,
              backgroundColor: const Color(0xFFF2ECE1),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFD4A800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
