enum AuditStatus { disetujui, menunggu, revisi }

class AuditItemModel {
  final String id;
  final String fakultas;
  final String prodi;
  final String ikuCode;
  final String ikuTitle;
  final String documentName;
  final String uploadDate;
  final String uploader;
  final AuditStatus status;
  final String notes;

  const AuditItemModel({
    required this.id,
    required this.fakultas,
    required this.prodi,
    required this.ikuCode,
    required this.ikuTitle,
    required this.documentName,
    required this.uploadDate,
    required this.uploader,
    required this.status,
    this.notes = '',
  });

  AuditItemModel copyWith({
    AuditStatus? status,
    String? notes,
  }) {
    return AuditItemModel(
      id: id,
      fakultas: fakultas,
      prodi: prodi,
      ikuCode: ikuCode,
      ikuTitle: ikuTitle,
      documentName: documentName,
      uploadDate: uploadDate,
      uploader: uploader,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}
