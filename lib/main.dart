import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/domain/core/di/injectable.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
          BlocProvider(create: (ctx) => getIt<SearchBloc>()),
          BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
          BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
          BlocProvider(create: (ctx) => getIt<HomeBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent),
              primarySwatch: Colors.blue,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              textTheme: const TextTheme(
                displayLarge: TextStyle(color: Colors.white),
                titleLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
              ),
              scaffoldBackgroundColor: backgroundColor),
          home: ScreenMainPage(),
        ));
  }
}
