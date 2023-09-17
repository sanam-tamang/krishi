import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:level1_hiring_app/features/setting/datasource/theme_mode_local_data_source.dart';
import 'common/app_routes.dart';
import 'common/app_themes.dart';
import 'features/post/blocs/get_post_bloc/get_post_bloc.dart';
import 'features/post/repositories/post_repository.dart';
import 'features/setting/blocs/brightness_changer_bloc/brightness_changer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getTheme();
    super.initState();
  }

  Future<void> getTheme() async {
    await ThemeModeLocalDataSource.instance.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => PostRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => GetPostBloc(
                      repository:
                          RepositoryProvider.of<PostRepository>(context))
                    ..add(GetPosts())),
              BlocProvider(
                  create: (context) =>
                      BrightnessChangerBloc()..add(LoadBrightness()))
            ],
            child: ScreenUtilInit(builder: (_, child) {
              return BlocBuilder<BrightnessChangerBloc, BrightnessChangerState>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Krishi',
                    theme: AppTheme.lightTheme(),
                    darkTheme: AppTheme.darkTheme(),
                    themeMode: state.brightness,
                    initialRoute: AppRouteName.root,
                    onGenerateRoute: AppRoute.onGenerateRoute,
                  );
                },
              );
            })));
  }
}
