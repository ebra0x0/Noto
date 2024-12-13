import 'package:flutter/material.dart';

class ScrollService {
  // Singleton instance
  static final ScrollService _instance = ScrollService._internal();

  factory ScrollService() {
    return _instance;
  }

  ScrollService._internal();

  // ScrollController that can be used globally
  final ScrollController listViewController = ScrollController();

  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (listViewController.hasClients) {
        listViewController.animateTo(
          listViewController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void dispose() {
    listViewController.dispose();
  }
}
