import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAF8F5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardExecutiveBanner(),
            const SizedBox(height: 24),
            const DashboardMetricCards(),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 950) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 3,
                        child: DashboardIkuOverview(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: DashboardTrendLeaderboard(),
                      ),
                    ],
                  );
                }

                return Column(
                  children: const [
                    DashboardIkuOverview(),
                    SizedBox(height: 20),
                    DashboardTrendLeaderboard(),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            const DashboardQuickActions(),
          ],
        ),
      ),
    );
  }
}
