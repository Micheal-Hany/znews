import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znews/constants.dart';
import 'package:znews/features/Interests%20page/cubit/interrest_cubit.dart';
import 'package:znews/features/home%20page/data/Models/news_model/article.dart';
import 'package:znews/features/home%20page/prsentation/Manger/cubit/news_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:znews/features/home%20screen.dart';
import 'package:znews/features/saved%20Page/cubit/cubit/news_cubit.dart';
import 'core/utils/service locator.dart';
import 'features/home page/data/repos/home-repo-implemention.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/home page/prsentation/Manger/tap bar cubit/cubit/tap_bar_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(ArticleAdapter());
  await Hive.openBox(kboxName);
  await Hive.openBox<String>(ktapBarBox);
  await Hive.openBox<String>(kinterestListBox);

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // TapBarCubit
        BlocProvider(
          create: (context) => NewsCubit(
            (getIt.get<HomeRepoImpl>())..fatchCategoryNews(category: ''),
          ),
        ),
        BlocProvider(
          create: (context) => SavedNewsCubit(),
        ),
        BlocProvider(
          create: (context) => TapBarCubit(),
        ),
        BlocProvider(
          create: (context) => InterrestCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'zNews',
        theme: ThemeData.dark(
            // useMaterial3: true,
            ),
        home: const HomeScreen(),
      ),
    );
  }
}
