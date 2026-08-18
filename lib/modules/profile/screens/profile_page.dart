import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAF8F5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ProfileHeaderCard(),
            SizedBox(height: 24),
            ProfileStatsSummary(),
            SizedBox(height: 24),
            ProfileInfoSection(),
          ],
        ),
      ),
    );
  }
}
