import 'package:admin/core/utils/shared_preference.dart';
import 'package:admin/core/utils/theme_data.dart';
import 'package:admin/feature/Dashboard/manage/cubit/cubit.dart';
import 'package:admin/feature/Dashboard/manage/cubit/states.dart';
import 'package:admin/feature/Dashboard/presentation/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final isDarkTheme = await SharedPreference.getData(key: 'Theme') ?? false;

  runApp(MyApp(isDarkTheme: isDarkTheme,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDarkTheme});

  final bool isDarkTheme;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>DashboardCubit(isDarkTheme),),
      ],
      child: BlocBuilder<DashboardCubit,DashboardStates>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shopsmart Admin',
            theme: Styles.themeData(isDarkTheme: DashboardCubit.get(context).isDarkTheme, context: context),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
