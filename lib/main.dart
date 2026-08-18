import 'package:indikatorkinerjautama_ui/packages/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SidebarProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => AppBarProvider()),
      ],
      child: MaterialApp(
        title: 'IKU UI - Indikator Kinerja Utama',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
