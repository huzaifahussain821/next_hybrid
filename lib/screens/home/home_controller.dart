import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}





// import 'package:purpose_payment/utilities/app_exports.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class HomeController extends GetxController {
//   static HomeController get to {
//     try {
//       return Get.find<HomeController>();
//     } catch (e) {
//       return Get.put(HomeController());
//     }
//   }
//   // var selectedTab = 0.obs;

//   // void changeTab(int index) {
//   //   selectedTab.value = index;
//   // }

//   late PageController pageController;
//   final currentPage = 0.obs;
//   final controllers = <TextEditingController>[TextEditingController()].obs;
//   late stt.SpeechToText speech;
//   final isListening = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     pageController = PageController();
//     speech = stt.SpeechToText();
//   }

//   Future<void> startListening() async {
//     bool available = await speech.initialize(
//       onStatus: (status) {
//         if (status == 'done') {
//           isListening.value = false;
//         }
//       },
//       onError: (error) => debugPrint("Speech error: $error"),
//     );

//     if (available) {
//       isListening.value = true;
//       speech.listen(
//         onResult: (result) {
//           String recognized = result.recognizedWords.toLowerCase();
//           if (recognized == "next") {
//             goToNextPage();
//           } else if (recognized == "back") {
//             goToPreviousPage();
//           } else {
//             final controller = controllers[currentPage.value];
//             controller.text = "${controller.text} ${result.recognizedWords}";
//             controller.selection = TextSelection.fromPosition(
//               TextPosition(offset: controller.text.length),
//             );
//           }
//         },
//       );
//     }
//   }

//   void stopListening() {
//     speech.stop();
//     isListening.value = false;
//   }

//   void addPage() {
//     controllers.add(TextEditingController());
//   }

//   void goToNextPage() {
//     if (currentPage.value < controllers.length - 1) {
//       pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void goToPreviousPage() {
//     if (currentPage.value > 0) {
//       pageController.previousPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void onPageChanged(int index) {
//     currentPage.value = index;
//   }
// }
