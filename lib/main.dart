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
        ChangeNotifierProvider(create: (_) => AuditProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'IKU UI - Indikator Kinerja Utama',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.dashboard,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
