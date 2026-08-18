import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditProvider extends ChangeNotifier {
  String _selectedFilter = 'Semua';

  String get selectedFilter => _selectedFilter;

  final List<String> filterOptions = const [
    'Semua',
    'Menunggu Verifikasi',
    'Disetujui',
    'Perlu Revisi',
  ];

  final List<AuditItemModel> _auditList = [
    const AuditItemModel(
      id: 'AUD-001',
      fakultas: 'Fakultas Teknik',
      prodi: 'Teknik Elektro',
      ikuCode: 'IKU 1',
      ikuTitle: 'Lulusan Mendapat Pekerjaan Layak',
      documentName: 'Laporan_Tracer_Study_FT_2025.pdf',
      uploadDate: '12 Feb 2026',
      uploader: 'Budi Santoso, S.T.',
      status: AuditStatus.menunggu,
    ),
    const AuditItemModel(
      id: 'AUD-002',
      fakultas: 'Fakultas Ilmu Komputer',
      prodi: 'Ilmu Komputer',
      ikuCode: 'IKU 2',
      ikuTitle: 'Mahasiswa Berkegiatan di Luar Kampus',
      documentName: 'SK_Dekan_Magang_MBKM_Gojek_Tokopedia.pdf',
      uploadDate: '10 Feb 2026',
      uploader: 'Rina Wijaya, M.Kom.',
      status: AuditStatus.disetujui,
      notes: 'Dokumen lengkap dan terverifikasi sesuai SKS konversi.',
    ),
    const AuditItemModel(
      id: 'AUD-003',
      fakultas: 'Fakultas Ekonomi dan Bisnis',
      prodi: 'Manajemen',
      ikuCode: 'IKU 6',
      ikuTitle: 'Kerjasama dengan Mitra Kelas Dunia',
      documentName: 'MoU_Dual_Degree_Melbourne_Uni.pdf',
      uploadDate: '08 Feb 2026',
      uploader: 'Ahmad Fauzi, S.E., M.B.A.',
      status: AuditStatus.disetujui,
      notes: 'MoU aktif dan terdaftar di Kemendikbudristek.',
    ),
    const AuditItemModel(
      id: 'AUD-004',
      fakultas: 'Fakultas Kedokteran',
      prodi: 'Pendidikan Dokter',
      ikuCode: 'IKU 5',
      ikuTitle: 'Karya Dosen Terindeks Internasional',
      documentName: 'Publikasi_Scopus_Q1_TheLancet.pdf',
      uploadDate: '05 Feb 2026',
      uploader: 'dr. Siti Rahma, Sp.A.',
      status: AuditStatus.revisi,
      notes: 'Bukti korespondensi reviewer belum dilampirkan.',
    ),
    const AuditItemModel(
      id: 'AUD-005',
      fakultas: 'Fakultas Hukum',
      prodi: 'Ilmu Hukum',
      ikuCode: 'IKU 4',
      ikuTitle: 'Praktisi Mengajar di Kampus',
      documentName: 'SK_Dosen_Praktisi_Hakim_MK.pdf',
      uploadDate: '03 Feb 2026',
      uploader: 'Hendra Gunawan, S.H., M.H.',
      status: AuditStatus.menunggu,
    ),
    const AuditItemModel(
      id: 'AUD-006',
      fakultas: 'Fakultas Ilmu Administrasi',
      prodi: 'Administrasi Niaga',
      ikuCode: 'IKU 7',
      ikuTitle: 'Kelas Kolaboratif dan Partisipatif',
      documentName: 'RPS_Case_Method_Semester_Gasal.pdf',
      uploadDate: '01 Feb 2026',
      uploader: 'Dewi Lestari, S.Sos., M.Si.',
      status: AuditStatus.disetujui,
    ),
    const AuditItemModel(
      id: 'AUD-007',
      fakultas: 'Fakultas Psikologi',
      prodi: 'Psikologi',
      ikuCode: 'IKU 8',
      ikuTitle: 'Prodi Terakreditasi Internasional',
      documentName: 'Sertifikat_Akreditasi_AUN-QA.pdf',
      uploadDate: '28 Jan 2026',
      uploader: 'Dr. Farah Diba, M.Psi.',
      status: AuditStatus.disetujui,
    ),
  ];

  List<AuditItemModel> get auditList => _auditList;

  List<AuditItemModel> get filteredList {
    if (_selectedFilter == 'Menunggu Verifikasi') {
      return _auditList
          .where((item) => item.status == AuditStatus.menunggu)
          .toList();
    }
    if (_selectedFilter == 'Disetujui') {
      return _auditList
          .where((item) => item.status == AuditStatus.disetujui)
          .toList();
    }
    if (_selectedFilter == 'Perlu Revisi') {
      return _auditList
          .where((item) => item.status == AuditStatus.revisi)
          .toList();
    }
    return _auditList;
  }

  int get totalCount => _auditList.length;
  int get pendingCount =>
      _auditList.where((item) => item.status == AuditStatus.menunggu).length;
  int get approvedCount =>
      _auditList.where((item) => item.status == AuditStatus.disetujui).length;
  int get revisionCount =>
      _auditList.where((item) => item.status == AuditStatus.revisi).length;

  void setFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void updateAuditStatus(String id, AuditStatus status, String notes) {
    final index = _auditList.indexWhere((item) => item.id == id);
    if (index != -1) {
      _auditList[index] = _auditList[index].copyWith(
        status: status,
        notes: notes,
      );
      notifyListeners();
    }
  }
}
