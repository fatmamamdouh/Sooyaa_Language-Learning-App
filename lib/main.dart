import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/cubit/login/login_cubit.dart';
import '../../core/Services/get_apis.dart';
import '../../core/cubit/Languages/language_cubit.dart';
import '../../core/cubit/register/register_cubit.dart';
import '../../core/screens/Splash%20Screen/splash_screen.dart';
import '../../core/cubit/selection/selection_cubit.dart';
import '../../core/customs/Routes/routes.dart';
import '../../core/theme/light_theme.dart';
import '../../core/cubit/word_learned/word_learned_cubit.dart';
import '../../core/Services/api_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SelectionCubit()),
            BlocProvider(
                create: (_) => LanguageCubit(GetApis())..getLanguages()),
            BlocProvider(create: (_) => WordLearnedCubit()),
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (_) => LoginCubit()),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context: context),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
