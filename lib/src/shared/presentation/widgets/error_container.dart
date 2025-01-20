import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_button.dart';

class ErrorContainer extends StatelessWidget {
  final String? errorMessageCode;
  final String? errorMessageText;
  final String? buttonText;
  final bool? showRetryButton;
  final bool? showErrorImage;
  final Color? errorMessageColor;
  final double? errorMessageFontSize;
  final Function? onTapRetry;
  final Color? retryButtonBackgroundColor;
  final Color? retryButtonTextColor;

  const ErrorContainer({
    super.key,
    this.errorMessageCode,
    this.errorMessageText,
    this.errorMessageColor,
    this.errorMessageFontSize,
    this.onTapRetry,
    this.showErrorImage,
    this.retryButtonBackgroundColor,
    this.retryButtonTextColor,
    this.showRetryButton,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              errorMessageText.toString().contains('No Internet')
                  ? 'assets/noInternet.svg'
                  : 'assets/somethingWentWrong.svg',
              height: size.height * 0.5,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              errorMessageText ?? 'Something went wrong, Please try again!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: errorMessageColor
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          (showRetryButton ?? true)
              ? CustomButton(
            text: buttonText ?? 'Retry',
            onPressed: () => onTapRetry!(),
          )
              : const SizedBox()
        ],
      ),
    );
  }
}
