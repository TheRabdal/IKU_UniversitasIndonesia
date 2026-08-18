import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class LaporanTable extends StatelessWidget {
  const LaporanTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporanProvider>(
      builder: (context, provider, _) {
        final list = provider.filteredList;

        return Container(
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Peringkat & Rekapitulasi Capaian Fakultas',
                          style: TextStyle(
                            color: Color(0xFF22201C),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Evaluasi rata-rata nilai dan jumlah indikator tercapai',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8860B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      icon: const Icon(Icons.file_download_outlined, size: 18),
                      label: const Text('Ekspor Laporan'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const LaporanExportDialog(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Divider(color: Color(0xFFF0ECE1), height: 1),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Color(0xFFF7F4EC), height: 1),
                itemBuilder: (context, index) {
                  final item = list[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        _buildRankBadge(item.rank),
                        const SizedBox(width: 14),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.fakultas,
                                style: const TextStyle(
                                  color: Color(0xFF22201C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${item.achievedIkuCount} dari ${item.totalIkuCount} IKU Memenuhi Target',
                                style: const TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Rata-Rata',
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    '${item.avgScore}%',
                                    style: const TextStyle(
                                      color: Color(0xFFB8860B),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: item.percentage,
                                  minHeight: 6,
                                  backgroundColor: const Color(0xFFF2ECE1),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    Color(0xFFD4A800),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        _buildStatusTag(item.status),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRankBadge(int rank) {
    Color bgColor;
    Color textColor;

    if (rank == 1) {
      bgColor = const Color(0xFFD4AF37);
      textColor = Colors.white;
    } else if (rank == 2) {
      bgColor = const Color(0xFFC0C0C0);
      textColor = Colors.white;
    } else if (rank == 3) {
      bgColor = const Color(0xFFCD7F32);
      textColor = Colors.white;
    } else {
      bgColor = const Color(0xFFF0EAE0);
      textColor = const Color(0xFF666666);
    }

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$rank',
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTag(String status) {
    Color textColor;
    Color bgColor;
    Color borderColor;

    if (status == 'Sangat Baik') {
      textColor = const Color(0xFF389E0D);
      bgColor = const Color(0xFFF6FFED);
      borderColor = const Color(0xFFB7EB8F);
    } else if (status == 'Baik') {
      textColor = const Color(0xFF096DD9);
      bgColor = const Color(0xFFE6F7FF);
      borderColor = const Color(0xFF91D5FF);
    } else {
      textColor = const Color(0xFFD48806);
      bgColor = const Color(0xFFFFFBE6);
      borderColor = const Color(0xFFFFE58F);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
