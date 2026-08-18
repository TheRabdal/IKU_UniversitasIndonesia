import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfileEditDialog extends StatefulWidget {
  const ProfileEditDialog({super.key});

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _unitController;
  late TextEditingController _nipController;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileProvider>().userProfile;
    _nameController = TextEditingController(text: profile.name);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _unitController = TextEditingController(text: profile.unit);
    _nipController = TextEditingController(text: profile.nip);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _unitController.dispose();
    _nipController.dispose();
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
              Icons.edit_outlined,
              color: Color(0xFFB8860B),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Edit Informasi Profil',
            style: TextStyle(
              color: Color(0xFF22201C),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 460,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildField(
                label: 'Nama Lengkap & Gelar',
                controller: _nameController,
              ),
              const SizedBox(height: 12),
              _buildField(
                label: 'Nomor Induk Pegawai (NIP)',
                controller: _nipController,
              ),
              const SizedBox(height: 12),
              _buildField(
                label: 'Email Resmi UI',
                controller: _emailController,
              ),
              const SizedBox(height: 12),
              _buildField(
                label: 'Nomor Telepon / WhatsApp',
                controller: _phoneController,
              ),
              const SizedBox(height: 12),
              _buildField(
                label: 'Unit Kerja / Direktorat',
                controller: _unitController,
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
            context.read<ProfileProvider>().updateProfile(
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  phone: _phoneController.text.trim(),
                  unit: _unitController.text.trim(),
                  nip: _nipController.text.trim(),
                );
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
                    Text('Data profil berhasil diperbarui!'),
                  ],
                ),
              ),
            );
          },
          child: const Text('Simpan Perubahan'),
        ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
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
    );
  }
}
