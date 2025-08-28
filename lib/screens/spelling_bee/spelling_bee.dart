import 'package:flutter/material.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';

class SpellingBee extends StatelessWidget {
  final List<String> competitions = const [
    "Competition 1",
    "Competition 2",
    "Competition 3",
    "Competition 4",
    "Competition 5",
    "Competition 6",
  ];

  const SpellingBee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar("Spelling Bee"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFAE6CF), // outer container color
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                children: competitions
                    .map(
                      (title) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAE6CF), // card color
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 2),
                          leading: Container(
                            width: 40,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAD8C0),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(1, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.list,
                              color: Colors.black,
                              size: 26,
                            ),
                          ),
                          title: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
