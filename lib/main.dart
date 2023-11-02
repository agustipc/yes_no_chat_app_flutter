import 'package:flutter/material.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';
import 'package:yes_no_app/widgets/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      theme: AppTheme().theme(),
      home: const ChatScreen(),
    );
  }
}
