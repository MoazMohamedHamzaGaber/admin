import 'package:admin/core/utils/shared_preference.dart';
import 'package:admin/feature/Dashboard/presentation/manage/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardStates> {
  DashboardCubit(bool initialTheme) : super(InitialDashboardStates()) {
    isDarkTheme = initialTheme;
  }

  static DashboardCubit get(context) => BlocProvider.of(context);

  bool isDarkTheme = false;

  void changeThemeMode() async {
    isDarkTheme = !isDarkTheme;
    await SharedPreference.saveData(key: 'Theme', value: isDarkTheme);
    emit(ChangeThemeModeStates());
  }
}
