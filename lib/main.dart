import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/copilot_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StepUpTutorCopilotApp());
}

class StepUpTutorCopilotApp extends StatelessWidget {
  const StepUpTutorCopilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Up Tutor Copilot | AI Session Companion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const CopilotScreen(),
    );
  }
}
