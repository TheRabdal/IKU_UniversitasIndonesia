import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarProvider>(
      builder: (context, appBar, _) {
        return Text(
          appBar.title,
          style: const TextStyle(
            color: Color(0xFF22201C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        );
      },
    );
  }
}
