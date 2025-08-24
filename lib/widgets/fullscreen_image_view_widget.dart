// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
// class FullScreenImageViewer extends StatefulWidget {
//   final String imageUrl;
//   final String imageName;
//
//   const FullScreenImageViewer({
//     super.key,
//     required this.imageUrl,
//     required this.imageName,
//   });
//
//   @override
//   FullScreenImageViewerState createState() => FullScreenImageViewerState();
// }
//
// class FullScreenImageViewerState extends State<FullScreenImageViewer> {
//   bool _isAppBarVisible = true;
//   PhotoViewController? _photoViewController;
//   double downloadProgress = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _photoViewController = PhotoViewController();
//   }
//
//   Future<bool> _checkAndRequestPermission() async {
//     if (Platform.isAndroid) {
//       final status = await Permission.manageExternalStorage.request();
//       if (status.isGranted) {
//         return true;
//       } else {
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('This app requires storage permission to save files.'),
//           ),
//         );
//         return false;
//       }
//     }
//     return true; // iOS does not require this specific permission
//   }
//
//   Future<void> _downloadImage() async {
//     if (await _checkAndRequestPermission()) {
//       try {
//         final downloadsDir = Platform.isAndroid ? '/storage/emulated/0/Download' : (await getDownloadsDirectory())?.path;
//         if (downloadsDir == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Failed to get storage directory.')),
//           );
//           return;
//         }
//         final file = File(downloadsDir);
//
//         final savePath = '${file.path}/${widget.imageName}';
//         final dio = Dio();
//
//         await dio.download(
//           widget.imageUrl,
//           savePath,
//           onReceiveProgress: (received, total) {
//             setState(() {
//               downloadProgress = (received / total) * 100;
//             });
//           },
//         );
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Image saved to $savePath')),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to download image.')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Image Viewer
//             Center(
//               child: PhotoView(
//                 controller: _photoViewController,
//                 imageProvider: CachedNetworkImageProvider(widget.imageUrl),
//                 minScale: PhotoViewComputedScale.contained,
//                 initialScale: PhotoViewComputedScale.contained,
//                 maxScale: PhotoViewComputedScale.covered,
//                 backgroundDecoration: const BoxDecoration(
//                   color: Colors.black,
//                 ),
//                 enableRotation: false,
//                 enablePanAlways: false,
//                 wantKeepAlive: false,
//                 onTapUp: (context, details, controllerValue) {
//                   setState(() {
//                     _isAppBarVisible = !_isAppBarVisible;
//                   });
//                 },
//               ),
//             ),
//             // AppBar Overlay
//             if (_isAppBarVisible)
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       // Back Button
//                       IconButton(
//                         icon: Platform.isIOS
//                             ? const Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                                 size: 25,
//                               )
//                             : const Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                                 size: 25,
//                               ),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       SizedBox(width: 10.w),
//                       // File Name
//                       // CustomTextWidget(
//                       //   text: _baseFileName ?? "",
//                       //   textColor: AppThemes.white,
//                       //   textSize: 1.sp,
//                       // ),
//                       const Spacer(),
//                       // Download Button
//                       IconButton(
//                         icon: const Icon(
//                           Icons.download,
//                           color: Colors.white,
//                           size: 25,
//                         ),
//                         onPressed: _downloadImage,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }