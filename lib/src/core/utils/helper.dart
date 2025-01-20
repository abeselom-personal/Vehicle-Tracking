import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Helper {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static getImagesPath(String image) {
    return 'assets/images/$image';
  }

  static Future<String?> getLastKnownLocationName(
      double latitude, double longitude) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        return data['display_name'];
      } else {
        throw Exception(
            'Failed to fetch location name: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<dynamic> showBottomSheet({
    required Widget child,
    required BuildContext context,
    bool? enableDrag,
  }) async {
    final result = await showModalBottomSheet(
      enableDrag: enableDrag ?? false,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (_) => child,
    );

    return result;
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    String? label,
    VoidCallback? onPressed,
    bool isError = false,
    Color? color,
  }) {
    final snackBar = SnackBar(
      margin: EdgeInsets.symmetric(
          horizontal: 20, vertical: MediaQuery.sizeOf(context).height * 0.05),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor:
          color ?? (isError ? AppColors.errorColor : AppColors.successColor),
      showCloseIcon: label != null && onPressed != null ? true : false,
      action: label != null && onPressed != null
          ? SnackBarAction(
              label: label,
              textColor: Colors.white,
              onPressed: onPressed,
            )
          : null,
      behavior: SnackBarBehavior.floating,
      content: Text(message, style: const TextStyle(color: Colors.white)),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showAlertDialog(
      BuildContext context, String title, String message,
      {String? positiveLabel,
      String? negativeLabel,
      VoidCallback? onPositivePressed,
      VoidCallback? onNegativePressed}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          if (negativeLabel != null)
            TextButton(
              onPressed: onNegativePressed,
              child: Text(negativeLabel),
            ),
          if (positiveLabel != null)
            TextButton(
              onPressed: onPositivePressed,
              child: Text(positiveLabel),
            ),
        ],
      ),
    );
  }
}
