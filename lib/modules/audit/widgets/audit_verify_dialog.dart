import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditVerifyDialog extends StatefulWidget {
  final AuditItemModel item;

  const AuditVerifyDialog({
    super.key,
    required this.item,
  });

  @override
  State<AuditVerifyDialog> createState() => _AuditVerifyDialogState();
}

class _AuditVerifyDialogState extends State<AuditVerifyDialog> {
  late TextEditingController _notesController;
  late AuditStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.item.notes);
    _selectedStatus = widget.item.status;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFEADBBE), width: 1.5),
      ),
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFF9F5EC),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.fact_check_rounded,
              color: Color(0xFFB8860B),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Verifikasi Berkas Audit',
            style: TextStyle(
              color: Color(0xFF22201C),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF8F5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF0EAE0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.item.fakultas} • ${widget.item.prodi}',
                      style: const TextStyle(
                        color: Color(0xFF8C6D1F),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.item.documentName,
                      style: const TextStyle(
                        color: Color(0xFF22201C),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Indikator: ${widget.item.ikuCode} - ${widget.item.ikuTitle}',
                      style: const TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Status Verifikasi',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildStatusOption(
                      title: 'Disetujui',
                      status: AuditStatus.disetujui,
                      activeColor: const Color(0xFF389E0D),
                      bgColor: const Color(0xFFF6FFED),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStatusOption(
                      title: 'Menunggu',
                      status: AuditStatus.menunggu,
                      activeColor: const Color(0xFFD48806),
                      bgColor: const Color(0xFFFFFBE6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStatusOption(
                      title: 'Revisi',
                      status: AuditStatus.revisi,
                      activeColor: const Color(0xFFCF1322),
                      bgColor: const Color(0xFFFFF1F0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Catatan Auditor (Opsional)',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Tuliskan catatan verifikasi atau alasan revisi...',
                  hintStyle: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFDFC99A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFDFC99A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFB8860B),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Batal',
            style: TextStyle(color: Color(0xFF888888)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB8860B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          ),
          onPressed: () {
            context.read<AuditProvider>().updateAuditStatus(
                  widget.item.id,
                  _selectedStatus,
                  _notesController.text.trim(),
                );
            Navigator.pop(context);
          },
          child: const Text('Simpan Verifikasi'),
        ),
      ],
    );
  }

  Widget _buildStatusOption({
    required String title,
    required AuditStatus status,
    required Color activeColor,
    required Color bgColor,
  }) {
    final bool isSelected = _selectedStatus == status;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedStatus = status;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? bgColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? activeColor : const Color(0xFFDDDDDD),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? activeColor : const Color(0xFF666666),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
