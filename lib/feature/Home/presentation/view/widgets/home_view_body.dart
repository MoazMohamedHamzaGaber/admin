import 'package:admin/core/utils/shared_preference.dart';
import 'package:admin/feature/Home/manage/cubit/cubit.dart';
import 'package:admin/feature/Home/manage/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ThemeCubit,ThemeStates>(
      builder: (BuildContext context, state) {
        var cubit=ThemeCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello every body',
              style: TextStyle(
                  fontSize: 30
              ),
            ),
            SwitchListTile(
              title:cubit.isDarkTheme? const Text('Dark Mode'):const Text('Light Mode'),
              value:cubit.isDarkTheme? true :false,
              onChanged: (value){
                  cubit.changeThemeMode();
              },
            ),
          ],
        );
      },
    );
  }
}
