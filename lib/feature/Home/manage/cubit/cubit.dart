import 'package:admin/core/utils/shared_preference.dart';
import 'package:admin/feature/Home/manage/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit(bool initialTheme) : super(InitialThemeStates()) {
    isDarkTheme = initialTheme;
  }

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDarkTheme = false;

  void changeThemeMode() async {
    isDarkTheme = !isDarkTheme;
    await SharedPreference.saveData(key: 'Theme', value: isDarkTheme);
    emit(ChangeThemeModeStates());
  }
}
