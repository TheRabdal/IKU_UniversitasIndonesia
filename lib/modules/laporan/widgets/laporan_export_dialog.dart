import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class LaporanExportDialog extends StatefulWidget {
  const LaporanExportDialog({super.key});

  @override
  State<LaporanExportDialog> createState() => _LaporanExportDialogState();
}

class _LaporanExportDialogState extends State<LaporanExportDialog> {
  String _selectedFormat = 'PDF Laporan Lengkap';
  bool _includeEvidence = true;

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
              Icons.file_download_outlined,
              color: Color(0xFFB8860B),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Ekspor Laporan IKU',
            style: TextStyle(
              color: Color(0xFF22201C),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 440,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Format Berkas',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            _buildFormatOption(
              title: 'Dokumen PDF (.pdf)',
              subtitle: 'Laporan eksekutif lengkap siap cetak & tanda tangan',
              format: 'PDF Laporan Lengkap',
              icon: Icons.picture_as_pdf_outlined,
            ),
            const SizedBox(height: 8),
            _buildFormatOption(
              title: 'Lembar Kerja Excel (.xlsx)',
              subtitle: 'Data mentah per fakultas untuk analisis lanjutan',
              format: 'Excel Rekapitulasi',
              icon: Icons.table_chart_outlined,
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFF0ECE1), height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: _includeEvidence,
                  activeColor: const Color(0xFFB8860B),
                  onChanged: (val) {
                    setState(() {
                      _includeEvidence = val ?? true;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Sertakan lampiran tautan bukti dukung audit',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB8860B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          ),
          icon: const Icon(Icons.download_rounded, size: 18),
          label: const Text('Unduh Berkas'),
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF22201C),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                content: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFFDFC99A),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text('Berhasil mengekspor $_selectedFormat'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFormatOption({
    required String title,
    required String subtitle,
    required String format,
    required IconData icon,
  }) {
    final bool isSelected = _selectedFormat == format;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedFormat = format;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF9F5EC) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFB8860B)
                : const Color(0xFFE5E5E5),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFFB8860B)
                  : const Color(0xFF888888),
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFF22201C)
                          : const Color(0xFF444444),
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFFB8860B),
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
