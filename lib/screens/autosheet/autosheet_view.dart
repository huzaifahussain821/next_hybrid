import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/api_services/home_service.dart';
import 'package:purpose_payment/dialog/share_dialogbox.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AutosheetView extends StatefulWidget {
  final String? view;

  const AutosheetView({super.key, this.view});

  @override
  State<AutosheetView> createState() => _AutosheetViewState();
}

class _AutosheetViewState extends State<AutosheetView> {
  String? fileId;
  TextEditingController titleController = TextEditingController();

  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _quantityControllers = [];
  List<FocusNode> _nameFocusNodes = [];
  List<FocusNode> _quantityFocusNodes = [];

  late stt.SpeechToText _speech;
  bool _isListening = false;

  int _currentRow = 0;
  bool _onNameField = true;

  DateTime? _lastCommandTime;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _addRow(); // start with one row

    if (widget.view == "edit") {
      final file = Get.arguments;
      fileId = file.id.toString();
      titleController.text = file.title ?? "";

      _nameControllers = file.items
          .map<TextEditingController>(
              (item) => TextEditingController(text: item))
          .toList();

      _quantityControllers = List.generate(
          _nameControllers.length, (_) => TextEditingController());

      _nameFocusNodes =
          List.generate(_nameControllers.length, (_) => FocusNode());
      _quantityFocusNodes =
          List.generate(_nameControllers.length, (_) => FocusNode());
    }
  }

  void _addRow() {
    setState(() {
      _nameControllers.add(TextEditingController());
      _quantityControllers.add(TextEditingController());
      _nameFocusNodes.add(FocusNode());
      _quantityFocusNodes.add(FocusNode());
    });
  }

  Future<void> createAutoList(
      String title, List<Map<String, String>> items) async {
    try {
      final data = {
        "title": title,
        "items": jsonEncode(items),
      };

      final response = await HomeService.createAutoListApi(data);

      if (response != null) {
        Get.snackbar("Success", "Auto List Created Successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
        for (var c in _nameControllers) {
          c.clear();
        }
        for (var c in _quantityControllers) {
          c.clear();
        }
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _handleVoiceCommand(String command) {
    final now = DateTime.now();
    if (_lastCommandTime != null &&
        now.difference(_lastCommandTime!).inMilliseconds < 1000) return;
    _lastCommandTime = now;

    if (command.contains("next")) {
      _goToNextField();
    } else if (command.contains("back")) {
      _goToPreviousField();
    } else if (command.contains("stop")) {
      _stopListening();
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done') setState(() => _isListening = false);
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
              if (_onNameField) {
                _nameControllers[_currentRow].text +=
                    " ${result.recognizedWords}";
              } else {
                _quantityControllers[_currentRow].text +=
                    " ${result.recognizedWords}";
              }
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

  void _goToNextField() {
    setState(() {
      if (_onNameField) {
        _onNameField = false;
        FocusScope.of(context).requestFocus(_quantityFocusNodes[_currentRow]);
      } else {
        _onNameField = true;
        if (_currentRow < _nameControllers.length - 1) {
          _currentRow++;
        } else {
          _addRow();
          _currentRow++;
        }
        FocusScope.of(context).requestFocus(_nameFocusNodes[_currentRow]);
      }
    });
  }

  void _goToPreviousField() {
    setState(() {
      if (!_onNameField) {
        _onNameField = true;
        FocusScope.of(context).requestFocus(_nameFocusNodes[_currentRow]);
      } else if (_currentRow > 0) {
        _onNameField = false;
        _currentRow--;
        FocusScope.of(context).requestFocus(_quantityFocusNodes[_currentRow]);
      }
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
                  TextEditingController dialogTitleController =
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
                        TextField(
                          controller: dialogTitleController,
                          decoration: const InputDecoration(
                              hintText: "Title", prefixIcon: Icon(Icons.title)),
                        ),
                        const SizedBox(height: 20),
                        SignInButton(
                          text: widget.view == "edit" ? "Update" : "Create",
                          onPressed: () async {
                            String title = dialogTitleController.text.trim();
                            if (title.isNotEmpty) {
                              List<Map<String, String>> items = [];
                              for (int i = 0;
                                  i < _nameControllers.length;
                                  i++) {
                                String name = _nameControllers[i].text.trim();
                                String qty =
                                    _quantityControllers[i].text.trim();
                                if (name.isNotEmpty || qty.isNotEmpty) {
                                  items.add({"name": name, "quantity": qty});
                                }
                              }

                              if (items.isNotEmpty) {
                                if (widget.view == "edit" && fileId != null) {
                                  final data = {
                                    "title": title,
                                    "items": jsonEncode(items),
                                  };
                                  await HomeService.editAutoListApi(
                                      fileId!, data, AppPreferences.authToken);
                                  Get.snackbar("Success",
                                      "Auto List Updated Successfully",
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white);
                                } else {
                                  await createAutoList(title, items);
                                }
                                Navigator.pop(context);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _iconContainer(_isListening ? Icons.mic : Icons.mic_none,
                    _isListening ? _stopListening : _startListening),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFAE6CF),
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Table header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.orange.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: const [
                          Expanded(flex: 1, child: CustomText("No.")),
                          Expanded(flex: 4, child: CustomText("Name")),
                          Expanded(flex: 3, child: CustomText("Quantity")),
                        ],
                      ),
                    ),
                  ),
                  // Rows
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _nameControllers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black),
                        // ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(child: CustomText("${index + 1}")),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller: _nameControllers[index],
                                focusNode: _nameFocusNodes[index],
                                style: const TextStyle(
                                    fontFamily: "zekton", fontSize: 14),
                                decoration: const InputDecoration(
                                    hintText: "Name",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: "zekton", fontSize: 14),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8)),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller: _quantityControllers[index],
                                focusNode: _quantityFocusNodes[index],
                                style: const TextStyle(
                                    fontFamily: "zekton", fontSize: 14),
                                decoration: const InputDecoration(
                                    hintText: "Quantity",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: "zekton", fontSize: 14),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_currentRow > 0 || !_onNameField)
              SignInButton(text: "Back", onPressed: _goToPreviousField),
            const SizedBox(height: 8),
            SignInButton(text: "Next", onPressed: _goToNextField),
          ],
        ),
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
          color: const Color(0xFFFAE6CF),
        ),
        child: Icon(icon, color: Colors.black, size: 24),
      ),
    );
  }

  Widget _topContainer(String text, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(6),
        ),
        child: CustomText(text, fontSize: 0.8, color: Colors.black),
      ),
    );
  }
}
