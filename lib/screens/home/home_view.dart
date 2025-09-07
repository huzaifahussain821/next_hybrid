import 'dart:convert';

import 'package:purpose_payment/api_services/home_service.dart';
import 'package:purpose_payment/dialog/share_dialogbox.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeView extends StatefulWidget {
  final String? view;

  const HomeView({super.key, this.view});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
///////////////////////////// Update Auto List API Call ////////////////////////////
  String? fileId; // for edit mode
  TextEditingController titleController = TextEditingController();

//////////////////////////////////
  bool isLoading = false;

  Future<void> createAutoList(String title, List<String> items) async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = {
        "title": title,
        "items": jsonEncode(items),
      };

      final response = await HomeService.createAutoListApi(data);

      if (response != null) {
        Get.snackbar("Success", "Auto List Created Successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
        for (var c in _controllers) {
          c.clear();
        }
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  ////////////////////// Variables //////////////////////
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

    // 👇 Check if it's edit mode
    if (widget.view == "edit") {
      final file = Get.arguments;
      fileId = file.id.toString();
      titleController.text = file.title ?? "";

      // Pre-fill title & items
      titleController.text = file.title ?? "";
      _controllers = file.items
          .map<TextEditingController>(
              (item) => TextEditingController(text: item))
          .toList();

      if (_controllers.isEmpty) {
        _controllers = [TextEditingController()];
      }
    }
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
            _topContainer("Save", () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController titleController =
                      TextEditingController();

                  return AlertDialog(
                    backgroundColor: AppThemes.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: CustomText("Enter Title"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Custom TextField
                        CustomTextField(
                          controller: titleController,
                          hintText: 'Title',
                          prefixIcon: Icons.title,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),

                        // Save button
                        SignInButton(
                          text: widget.view == "edit" ? "Update" : "Create",
                          onPressed: () async {
                            String title = titleController.text.trim();

                            if (title.isNotEmpty) {
                              List<String> items = _controllers
                                  .map((c) => c.text.trim())
                                  .where((text) => text.isNotEmpty)
                                  .toList();

                              if (items.isNotEmpty) {
                                if (widget.view == "edit" && fileId != null) {
                                  // 🔥 Call Edit API
                                  final data = {
                                    "title": title,
                                    "items": jsonEncode(items),
                                  };
                                  final response =
                                      await HomeService.editAutoListApi(fileId!,
                                          data, AppPreferences.authToken);

                                  if (response != null) {
                                    Get.snackbar(
                                      "Success",
                                      "Auto List Updated Successfully",
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );

                                    titleController.clear();
                                    for (var c in _controllers) {
                                      c.clear();
                                    }
                                    setState(() {
                                      _controllers = [
                                        TextEditingController()
                                      ]; // reset with one field
                                    });
                                  }
                                } else {
                                  // Existing create
                                  await createAutoList(title, items);
                                }

                                Future.delayed(
                                    const Duration(milliseconds: 600), () {
                                  Navigator.pop(context);
                                });
                              } else {
                                Get.snackbar(
                                    "Warning", "Please add at least one item",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
            const SizedBox(width: 8),
            _topContainer("Share", () {
              showDialog(
                context: context,
                builder: (context) => const ShareDialog(),
              );
            }),
            const SizedBox(width: 8),
            _topContainer("Language", () {}),
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
            Expanded(
              child: Container(
                // height: Get.height * 0.55,
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
            ),
            10.verticalSpace,
            if (_currentPage > 0)
              SignInButton(text: "Back", onPressed: _goToPreviousPage),
            const SizedBox(height: 8),
            SignInButton(text: "Next", onPressed: _goToNextPage),
            10.verticalSpace
          ],
        ),
      ),
    );
  }

  Widget _topContainer(String text, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(6),
        ),
        child: CustomText(text, fontSize: 0.8, color: Colors.black),
      ),
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
