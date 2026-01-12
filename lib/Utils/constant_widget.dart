import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

///******************************************* Show progress indicator *******************************************///

showProgressIndicator() {
  return EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: 'Loading',
      dismissOnTap: false);
}

///******************************************* Dismiss progress indicator *******************************************///

dismissProgressIndicator() {
  return EasyLoading.dismiss();
}

///******************************************* Snackbar for showing error message *******************************************///

errorSnackBarApi({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      messageText: customText(
        message!,
        color: Colors.white,
        fontSize: 12,
        height: 1.0,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: true,
      margin: EdgeInsets.all(5.0.sp),
      backgroundColor: Colors.red.withOpacity(0.80),
      icon: const Icon(Icons.gpp_bad_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    ),
  );
}

///******************************************* Snackbar for showing error message *******************************************///

// informationSnackBar({String? title, String? message}) {
//   Get.log("[$title] $message", isError: true);
//   return Get.showSnackbar(
//     GetSnackBar(
//       messageText: customText(
//         message!,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 12,
//           height: 1.0,
//           fontWeight: FontWeight.w700,
//         ),
//         textAlign: TextAlign.left,
//       ),
//       snackPosition: SnackPosition.BOTTOM,
//       shouldIconPulse: true,
//       margin: const EdgeInsets.all(20),
//       backgroundColor: Colors.cyan.withOpacity(0.80),
//       icon: const Icon(Icons.info_outline_rounded,
//           size: 30.0, color: Colors.white),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//       borderRadius: 8,
//       duration: const Duration(seconds: 3),
//     ),
//   );
// }
/* informationSnackBar({String? title, String? message,required BuildContext context}) {
  Get.log("[$title] $message", isError: true);
  return toastification.show(
	  context: context,
	  type: ToastificationType.info,
	  style: ToastificationStyle.flatColored,
	  title: customText(title ?? 'Information'),
	  description: customText(message!),
	  alignment: Alignment.topRight,
	  autoCloseDuration: const Duration(seconds: 4),
	  borderRadius: BorderRadius.circular(12.0),
	  boxShadow: highModeShadow,
    // icon: Image.asset(Assets.assetsInformation,scale: 25,)
	);
}
 */
///******************************************* Snackbar for showing success message *******************************************///

/* successSnackBar({String? title, String? message, Duration? duration}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: customText(
        title ?? 'Success',
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: customText(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.80),
      icon:
          const Icon(Icons.task_alt_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: duration ?? const Duration(seconds: 3),
    ),
  );
}

 */

informationSnackBar(
    {String? title, String? message, required BuildContext context}) {
  Get.log("[$title] $message", isError: true);
  return toastification.show(
    context: context,
    type: ToastificationType.info,
    style: ToastificationStyle.flatColored,
    title: customText(title ?? 'Info'),
    description: customText(message!),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: highModeShadow,
    // icon: Image.asset(Assets.assetsInformation,scale: 25,)
  );
}

successSnackBar(
    {String? title, String? message, required BuildContext context}) {
  Get.log("[$title] $message", isError: true);
  return toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    title: customText(title ?? 'Success!'),
    description: customText(message!),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: highModeShadow,
    // icon: Image.asset(Assets.assetsInformation,scale: 25,)
  );
}

errorSnackBar({String? title, String? message, required BuildContext context}) {
  Get.log("[$title] $message", isError: true);
  return toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    title: customText(title ?? 'Oops!'),
    description: customText(message!),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: highModeShadow,
    // icon: Image.asset(Assets.assetsInformation,scale: 25,)
  );
}

warningSnackBar(
    {String? title, String? message, required BuildContext context}) {
  Get.log("[$title] $message", isError: true);
  return toastification.show(
    context: context,
    type: ToastificationType.warning,
    style: ToastificationStyle.flatColored,
    title: customText(title ?? 'Alert!'),
    description: customText(message!),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: highModeShadow,
    // icon: Image.asset(Assets.assetsInformation,scale: 25,)
  );
}
