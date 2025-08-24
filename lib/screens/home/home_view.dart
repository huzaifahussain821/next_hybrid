import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 0;
  List<TextEditingController> _controllers = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;

  DateTime? _lastCommandTime;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controllers = [TextEditingController()];
    _speech = stt.SpeechToText();
  }

  void _handleVoiceCommand(String command) {
    final now = DateTime.now();

    // prevent duplicate execution within 1 second
    if (_lastCommandTime != null &&
        now.difference(_lastCommandTime!).inMilliseconds < 1000) {
      return;
    }
    _lastCommandTime = now;

    if (command.contains("next")) {
      _goToNextPage();
    } else if (command.contains("back")) {
      _goToPreviousPage();
    } else if (command.contains("stop")) {
      _stopListening();
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done') {
          setState(() => _isListening = false);
        }
      },
      onError: (error) => debugPrint("Speech error: $error"),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          String recognized = result.recognizedWords.toLowerCase();

          if (result.finalResult) {
            if (recognized.contains("next") ||
                recognized.contains("back") ||
                recognized.contains("stop")) {
              _handleVoiceCommand(recognized);
            } else {
              // Append speech-to-text into text field
              _controllers[_currentPage].text =
                  "${_controllers[_currentPage].text} ${result.recognizedWords}";
              _controllers[_currentPage].selection = TextSelection.fromPosition(
                TextPosition(offset: _controllers[_currentPage].text.length),
              );
            }
          }
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _goToNextPage() {
    if (_currentPage < _controllers.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() {
        _controllers.add(TextEditingController());
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      // If current page is empty, remove it first
      if (_controllers[_currentPage].text.isEmpty) {
        setState(() {
          _controllers.removeAt(_currentPage);
          _currentPage--; // go back one page
        });
      } else {
        setState(() {
          _currentPage--; // just move back
        });
      }

      // Animate to the updated _currentPage
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _addPage() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar(
        "",
        actionWidget: Row(
          children: [
            _topContainer("Save"),
            const SizedBox(width: 8),
            _topContainer("Share"),
            const SizedBox(width: 8),
            _topContainer("Language"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconContainer(Icons.add_circle_outline_outlined, _addPage),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CustomText("A${_currentPage + 1}"),
                ),
                _iconContainer(
                  _isListening ? Icons.mic : Icons.mic_none,
                  _isListening ? _stopListening : _startListening,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: Get.height * 0.55,
              decoration: BoxDecoration(
                color: const Color(0xFFFAE6CF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: _controllers[index],
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write or speak something...",
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            if (_currentPage > 0)
              SignInButton(text: "Back", onPressed: _goToPreviousPage),
            const SizedBox(height: 8),
            SignInButton(text: "Next", onPressed: _goToNextPage),
          ],
        ),
      ),
    );
  }

  Widget _topContainer(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomText(text, fontSize: 0.8, color: Colors.black),
    );
  }

  Widget _iconContainer(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: Colors.black, size: 24),
      ),
    );
  }
}

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   late PageController _pageController;
//   int _currentPage = 0;
//   List<TextEditingController> _controllers = [];
//   late stt.SpeechToText _speech;
//   bool _isListening = false;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _controllers = [TextEditingController()];
//     _speech = stt.SpeechToText();
//   }

//   void _startListening() async {
//     bool available = await _speech.initialize(
//       onStatus: (status) {
//         if (status == 'done') {
//           setState(() => _isListening = false);
//         }
//       },
//       onError: (error) => debugPrint("Speech error: $error"),
//     );
//     if (available) {
//       setState(() => _isListening = true);
//       _speech.listen(
//         onResult: (result) {
//           String recognized = result.recognizedWords.toLowerCase();

//           if (recognized == "next") {
//             _goToNextPage();
//           } else if (recognized == "back") {
//             _goToPreviousPage();
//           } else {
//             if (result.finalResult) {
//               // 👈 Only use the final result
//               _controllers[_currentPage].text =
//                   "${_controllers[_currentPage].text} ${result.recognizedWords}";
//               _controllers[_currentPage].selection = TextSelection.fromPosition(
//                 TextPosition(offset: _controllers[_currentPage].text.length),
//               );
//             }
//           }
//         },
//       );

//       // _speech.listen(
//       //   onResult: (result) {
//       //     String recognized = result.recognizedWords.toLowerCase();
//       //     if (recognized == "next") {
//       //       _goToNextPage();
//       //     } else if (recognized == "back") {
//       //       _goToPreviousPage();
//       //     } else {
//       //       _controllers[_currentPage].text =
//       //           "${_controllers[_currentPage].text} ${result.recognizedWords}";
//       //       _controllers[_currentPage].selection = TextSelection.fromPosition(
//       //         TextPosition(offset: _controllers[_currentPage].text.length),
//       //       );
//       //     }
//       //   },
//       // );
//     }
//   }

//   void _stopListening() {
//     _speech.stop();
//     setState(() => _isListening = false);
//   }

//   void _goToNextPage() {
//     if (_currentPage < _controllers.length - 1) {
//       // Go to existing next page
//       _pageController.animateToPage(
//         _currentPage + 1,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       // Add a new page and jump to it
//       setState(() {
//         _controllers.add(TextEditingController());
//       });
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _pageController.animateToPage(
//           _currentPage + 1,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _goToPreviousPage() {
//     if (_currentPage > 0) {
//       // If current page is empty, remove it
//       if (_controllers[_currentPage].text.isEmpty) {
//         setState(() {
//           _controllers.removeAt(_currentPage);
//         });
//       }

//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _pageController.animateToPage(
//           _currentPage - 1,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   void _addPage() {
//     setState(() {
//       _controllers.add(TextEditingController());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppThemes.primaryColor,
//       appBar: AppBarWidget.backAppBar(
//         "",
//         actionWidget: Row(
//           children: [
//             _topContainer("Save"),
//             const SizedBox(width: 8),
//             _topContainer("Share"),
//             const SizedBox(width: 8),
//             _topContainer("Language"),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Add new page button
//                 _iconContainer(Icons.add_circle_outline_outlined, _addPage),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: CustomText("A${_currentPage + 1}"),
//                 ),
//                 // Voice button
//                 _iconContainer(
//                   _isListening ? Icons.mic : Icons.mic_none,
//                   _isListening ? _stopListening : _startListening,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // PageView with text fields
//             Container(
//               height: Get.height * 0.55,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFAE6CF),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.black, width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemCount: _controllers.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: TextField(
//                       controller: _controllers[index],
//                       maxLines: null,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Write or speak something...",
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Spacer(),

//             // Navigation buttons
//             if (_currentPage > 0)
//               SignInButton(text: "Back", onPressed: _goToPreviousPage),
//             const SizedBox(height: 8),
//             SignInButton(text: "Next", onPressed: _goToNextPage),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _topContainer(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.orange),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: CustomText(text, fontSize: 0.8, color: Colors.black),
//     );
//   }

//   Widget _iconContainer(IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Icon(icon, color: Colors.black, size: 24),
//       ),
//     );
//   }
// }
