import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditCardTile extends StatelessWidget {
  final AuditItemModel item;

  const AuditCardTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F5EC),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFDFC99A)),
                ),
                child: Text(
                  item.ikuCode,
                  style: const TextStyle(
                    color: Color(0xFF8C6D1F),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${item.fakultas} • ${item.prodi}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildStatusBadge(item.status),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F5EC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  color: Color(0xFFB8860B),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.documentName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF22201C),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.ikuTitle} • Diunggah oleh ${item.uploader} (${item.uploadDate})',
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
              const SizedBox(width: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF8C6D1F),
                  side: const BorderSide(color: Color(0xFFDFC99A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                ),
                icon: const Icon(Icons.edit_note_rounded, size: 18),
                label: const Text(
                  'Verifikasi',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AuditVerifyDialog(item: item),
                  );
                },
              ),
            ],
          ),
          if (item.notes.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: item.status == AuditStatus.revisi
                    ? const Color(0xFFFFF1F0)
                    : const Color(0xFFF9F5EC),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: item.status == AuditStatus.revisi
                      ? const Color(0xFFFFA39E)
                      : const Color(0xFFEADBBE),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    item.status == AuditStatus.revisi
                        ? Icons.info_outline_rounded
                        : Icons.check_circle_outline_rounded,
                    size: 14,
                    color: item.status == AuditStatus.revisi
                        ? const Color(0xFFCF1322)
                        : const Color(0xFF8C6D1F),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Catatan: ${item.notes}',
                      style: TextStyle(
                        color: item.status == AuditStatus.revisi
                            ? const Color(0xFFCF1322)
                            : const Color(0xFF666666),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge(AuditStatus status) {
    String text;
    Color textColor;
    Color bgColor;
    Color borderColor;

    switch (status) {
      case AuditStatus.disetujui:
        text = 'Disetujui';
        textColor = const Color(0xFF389E0D);
        bgColor = const Color(0xFFF6FFED);
        borderColor = const Color(0xFFB7EB8F);
        break;
      case AuditStatus.menunggu:
        text = 'Menunggu Verifikasi';
        textColor = const Color(0xFFD48806);
        bgColor = const Color(0xFFFFFBE6);
        borderColor = const Color(0xFFFFE58F);
        break;
      case AuditStatus.revisi:
        text = 'Perlu Revisi';
        textColor = const Color(0xFFCF1322);
        bgColor = const Color(0xFFFFF1F0);
        borderColor = const Color(0xFFFFA39E);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
