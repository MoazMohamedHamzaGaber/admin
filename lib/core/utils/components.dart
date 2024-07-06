// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../feature/Dashboard/presentation/manage/cubit/cubit.dart';
// import 'package:flutter/services.dart';
 import 'package:shimmer/shimmer.dart';
//
AppBar appBar({
  context,
  String? text,
  IconData? iconData,
  bool centerTitle = false,
  required Function function,
}) =>
    AppBar(
      centerTitle: centerTitle,
      leading: IconButton(
        onPressed: () {
          function();
        },
        icon: Icon(
          Icons.arrow_back,
          color:
          DashboardCubit.get(context).isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      title: Shimmer.fromColors(
        period: const Duration(seconds: 15),
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.red,
          ),
        ),
      ],
    );
//
Widget buildTextField({
  required context,
  required TextEditingController controller,
  required String title,
  required TextInputType keyboardType,
  Function? onChanged,
  String? validate,
  int? maxLength,
  int? minLines,
  int? maxLines,
  double height = 100,
  List<TextInputFormatter>? inputFormatters,
  Widget? prefix,
  IconData? prefixIcon,
}) =>
    SizedBox(
      height: height,
      child: TextFormField(
        cursorColor: Colors.transparent,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: (e){
          onChanged!(e);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return validate;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          hintText: title,
          prefix: prefix,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(prefixIcon)
        ),
      ),
    );

Widget buildMaterialButton({
  required String text,
  required Function function,
  double height = 50,
  double width = 50,
  double fontSize = 19,
  required IconData iconData,
  required Color color,
}) =>
    Container(
      //width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
//
Future<void> buildShowDialog({
  context,
  required String image,
  required String name,
  required Function function,
  bool isCancel=false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 60,
              width: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name),
            const SizedBox(
              height: 10,
            ),
           isCancel? Padding(
             padding: const EdgeInsets.symmetric(
               horizontal: 16
             ),
             child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel',
                      style: TextStyle(
                        color: Colors.red
                      ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        function();
                        Navigator.pop(context);
                      },
                      child: const Text('OK',
                        style: TextStyle(
                            color: Colors.red
                        ),
                      ),
                    ),
                  ),
                ],
              ),
           ) :TextButton(
             onPressed: () {
               function();
             },
             child: const Text('OK',
               style: TextStyle(
                 color: Colors.red,
               ),
             ),
           ),

          ],
        ),
      ),
    );
//
Future awesomeDialog(context,String text,DialogType dialogType)async {
  return await AwesomeDialog(
    context: context,
    padding: const EdgeInsets.all(12),
    title: 'هام',
    dialogType: dialogType,
    body:  Text(text),
  ).show();
}
//
// Future buildShowLoading(context) async {
//   return await showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: Text('Please Wait'),
//           content: SizedBox(
//             height: 50,
//             child: Center(child: CircularProgressIndicator()),
//           ),
//         );
//       });
// }
//
// // void showToast({
// //   required String text,
// // }) =>
// //     Fluttertoast.showToast(
// //         msg: text,
// //         toastLength: Toast.LENGTH_SHORT,
// //         textColor: Colors.white,
// //         fontSize: 16.0);