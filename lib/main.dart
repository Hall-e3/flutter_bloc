import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/blocs/bloc_exports.dart';
import 'presentation/app_theme/theme.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp(
    appRoutes: AppRoutes(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoutes}) : super(key: key);
  final AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => AppBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.toggleOnAndOff
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabsScreen(),
            onGenerateRoute: appRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
