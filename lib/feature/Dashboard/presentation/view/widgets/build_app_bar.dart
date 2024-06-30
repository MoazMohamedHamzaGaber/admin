import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../manage/cubit/cubit.dart';
import '../../../manage/cubit/states.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BuildAppBar({super.key, required this.image,required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit,DashboardStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=DashboardCubit.get(context);
        return AppBar(
          title: Row(
            children: [
              Image.asset(
              image,
                height: 40,
              ),
              const SizedBox(
                width: 5,
              ),
              Shimmer.fromColors(
                period: const Duration(seconds: 15),
                baseColor: Colors.purple,
                highlightColor: Colors.red,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                DashboardCubit.get(context).changeThemeMode();
              },
              icon: cubit.isDarkTheme?const Icon(Icons.light_mode):const Icon(Icons.dark_mode),
              color: cubit.isDarkTheme?Colors.white:Colors.black,
            )
          ],
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
