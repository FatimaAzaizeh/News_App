import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/core/services_locator.dart';
import 'package:news_app/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:news_app/features/show_news/presentation/pages/hame_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit();
        })
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light()
                .copyWith(secondary: Palette.deeepBlue),
            fontFamily: 'Poppins'),
        home: const HomePage(),
      ),
    );
  }
}
