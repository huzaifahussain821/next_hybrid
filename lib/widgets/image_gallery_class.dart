import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../themes/app_theme.dart';

class ImageGalleryClass {
  ImagePicker picker = ImagePicker();
  XFile? getFilePath;
  File? imageFile;

  //Select Image Start
  void imageGalleryBottomSheet({BuildContext? context, bool? showVideo = false, VoidCallback? onCameraTap, VoidCallback? onVideoTap, VoidCallback? onGalleryTap}) {
    showModalBottomSheet(
        backgroundColor: AppThemes.transparentColor,
        context: context!,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(color: AppThemes.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: onCameraTap,
                  child: Container(
                    color: AppThemes.transparentColor,
                    margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.camera_enhance,
                          color: AppThemes.primaryColor,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                          textScaler: TextScaler.linear(1.3),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppThemes.primaryColor.withValues(alpha: 0.3),
                  thickness: 1,
                ),
                GestureDetector(
                  onTap: onGalleryTap,
                  child: Container(
                    color: AppThemes.transparentColor,
                    margin: const EdgeInsets.only(top: 9.0, bottom: 15.0),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.image,
                          color: AppThemes.primaryColor,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                          textScaler: TextScaler.linear(1.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> getCameraImage() async {
    try {
      getFilePath = await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
      if (getFilePath != null) {
        return getFilePath!.path;
      } else {
        return null;
      }
    } on PlatformException catch (_) {
      // AppDialogs.showToast(
      //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }

    return null;
  }

  Future<String?> getGalleryImage() async {
    try {
      getFilePath = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (getFilePath != null) {
        return getFilePath!.path;
      } else {
        return null;
      }
    } on PlatformException catch (_) {
      // AppConstants.showToast(
      //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }
    return null;
  }

  Future<String?> getGalleryVideo() async {
    try {
      getFilePath = await picker.pickVideo(source: ImageSource.gallery, maxDuration: const Duration(seconds: 30));
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (_) {
      // AppDialogs.showToast(
      //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }
    return null;
  }

  Future<String?> getCameraVideo() async {
    try {
      getFilePath = await picker.pickVideo(
        source: ImageSource.camera,
      );
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (_) {
      // AppDialogs.showToast(
      //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }
    return null;
  }

}
