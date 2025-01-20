import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_monitoring_app/src/shared/presentation/widgets/custom_navigation_bar.dart';
import 'package:vehicle_monitoring_app/src/shared/presentation/widgets/error_container.dart';

import '../../../profile/screens/user_profile_screen.dart';
import '../bloc/fetch_all_vehicles_bloc/fetch_all_vehicles_bloc.dart';
import '../widgets/home_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route route(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<FetchAllVehiclesBloc>().add(FetchAllVehicles());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  final _screens = [
    HomeContainer(),
    UserProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _screens,
        ),
        bottomNavigationBar: CustomNavigationBar(
          height: 70,
          icons: [
            Icons.dashboard,
            Icons.person,
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
              _tabController.animateTo(index);
            });
          },
        ),
      ),
    );
  }
}
