import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/cubit/word_learned/word_learned_cubit.dart';
import 'package:sooyaa_app/core/screens/Lessons/words_learned_screen.dart';
import '../../core/screens/Splash Screen/splash_screen.dart';
import '../../core/cubit/selection/selection_cubit.dart';
import '../../core/customs/Routes/routes.dart';
import '../../core/theme/light_theme.dart';
import 'core/Services/api_services.dart';

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
            BlocProvider(create: (_) => WordLearnedCubit()),
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
      home: const WordsLearnedScreen(),
      routes: routes,
    );
  }
}
