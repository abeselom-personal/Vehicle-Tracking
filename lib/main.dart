import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'src/core/routes/routes.dart';
import 'src/core/service_locator/service_locator.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/utils/helper.dart';
import 'src/features/auth/presentation/screens/auth_screen.dart';
import 'src/features/dashboard/presentation/bloc/fetch_all_vehicles_bloc/fetch_all_vehicles_bloc.dart';
import 'src/features/dashboard/presentation/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchAllVehiclesBloc>(
            create: (context) => sl<FetchAllVehiclesBloc>()),
      ],
      child: MaterialApp(
        title: 'Vehicle Tracker',
        debugShowCheckedModeBanner: false,
        navigatorKey: Helper.navigatorKey,
        scaffoldMessengerKey: Helper.scaffoldMessengerKey,
        theme: appTheme,
        darkTheme: darkAppTheme,
        onGenerateRoute: Routes.onGenerateRouted,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (FirebaseAuth.instance.currentUser != null) {
              return const HomeScreen();
            } else {
              return const AuthScreen();
            }
          },
        ),
      ),
    );
  }
}
