import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditUploadDialog extends StatefulWidget {
  const AuditUploadDialog({super.key});

  @override
  State<AuditUploadDialog> createState() => _AuditUploadDialogState();
}

class _AuditUploadDialogState extends State<AuditUploadDialog> {
  final _formKey = GlobalKey<FormState>();
  String _selectedFakultas = 'Fakultas Teknik';
  String _selectedIku = 'IKU 1';
  final TextEditingController _prodiController =
      TextEditingController(text: 'Teknik Elektro');
  final TextEditingController _docNameController =
      TextEditingController(text: 'Bukti_Dukung_Capaian_2026.pdf');
  final TextEditingController _uploaderController =
      TextEditingController(text: 'Operator Fakultas');

  final List<String> _fakultasList = const [
    'Fakultas Teknik',
    'Fakultas Ilmu Komputer',
    'Fakultas Ekonomi dan Bisnis',
    'Fakultas Kedokteran',
    'Fakultas Hukum',
    'Fakultas Ilmu Administrasi',
    'Fakultas Ilmu Sosial & Politik',
    'Fakultas Psikologi',
    'Fakultas Matematika & IPA',
  ];

  final Map<String, String> _ikuTitles = const {
    'IKU 1': 'Lulusan Mendapat Pekerjaan Layak',
    'IKU 2': 'Mahasiswa Berkegiatan di Luar Kampus',
    'IKU 3': 'Dosen Berkegiatan di Luar Kampus',
    'IKU 4': 'Praktisi Mengajar di Kampus',
    'IKU 5': 'Karya Dosen Terindeks Internasional',
    'IKU 6': 'Kerjasama dengan Mitra Kelas Dunia',
    'IKU 7': 'Kelas Kolaboratif dan Partisipatif',
    'IKU 8': 'Prodi Terakreditasi Internasional',
  };

  @override
  void dispose() {
    _prodiController.dispose();
    _docNameController.dispose();
    _uploaderController.dispose();
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
              Icons.cloud_upload_outlined,
              color: Color(0xFFB8860B),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Unggah Bukti Dukung IKU',
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fakultas / Unit Kerja',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFDFC99A)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedFakultas,
                      items: _fakultasList
                          .map((f) =>
                              DropdownMenuItem(value: f, child: Text(f)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedFakultas = val);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Program Studi',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _prodiController,
                  decoration: InputDecoration(
                    hintText: 'Contoh: Teknik Elektro',
                    isDense: true,
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
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Indikator IKU',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFDFC99A)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedIku,
                      items: _ikuTitles.entries
                          .map((entry) => DropdownMenuItem(
                                value: entry.key,
                                child: Text('${entry.key} - ${entry.value}'),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedIku = val);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Nama Dokumen Bukti (PDF)',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _docNameController,
                  decoration: InputDecoration(
                    hintText: 'Nama file dokumen bukti',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.attach_file_rounded,
                      color: Color(0xFF8C6D1F),
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFDFC99A)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFDFC99A)),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Nama Petugas / Pengunggah',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _uploaderController,
                  decoration: InputDecoration(
                    hintText: 'Nama lengkap pengunggah',
                    isDense: true,
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
                  ),
                ),
              ],
            ),
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
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB8860B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          ),
          icon: const Icon(Icons.cloud_upload_rounded, size: 18),
          label: const Text('Kirim Berkas'),
          onPressed: () {
            final String id =
                'AUD-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
            final newItem = AuditItemModel(
              id: id,
              fakultas: _selectedFakultas,
              prodi: _prodiController.text.trim(),
              ikuCode: _selectedIku,
              ikuTitle: _ikuTitles[_selectedIku] ?? '',
              documentName: _docNameController.text.trim(),
              uploadDate: 'Hari ini',
              uploader: _uploaderController.text.trim(),
              status: AuditStatus.menunggu,
            );

            context.read<AuditProvider>().addAuditItem(newItem);
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(0xFF22201C),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFFDFC99A),
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text('Berkas bukti dukung IKU berhasil diunggah!'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
