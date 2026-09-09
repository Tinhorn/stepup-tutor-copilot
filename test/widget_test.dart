import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_copilot/main.dart';

void main() {
  testWidgets('CopilotScreen renders Phase 2 interactive copilot workspace',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const StepUpTutorCopilotApp());
    await tester.pumpAndSettle();

    // Verify header and hero
    expect(find.text('STEP UP'), findsOneWidget);
    expect(find.text('COPILOT'), findsOneWidget);
    expect(find.text('Empower Every Tutoring Moment with AI Guidance'),
        findsOneWidget);

    // Verify personas
    expect(find.text('Maya'), findsOneWidget);
    expect(find.text('Marcus'), findsOneWidget);
    expect(find.text('Elena'), findsOneWidget);
    expect(find.text('Custom Student'), findsOneWidget);

    // Verify session moments
    expect(find.text('Session Kickoff'), findsOneWidget);
    expect(find.text('Concept Block'), findsOneWidget);
    expect(find.text('Frustrated / Low Confidence'), findsOneWidget);
    expect(find.text('Wrap-Up & Growth'), findsOneWidget);

    // Verify guidance output
    expect(find.text('TUTOR COACHING TIP'), findsOneWidget);
    expect(find.text('TAILORED ACTIVITY'), findsOneWidget);
    expect(find.text('EXACT TUTOR SCRIPT'), findsOneWidget);
    expect(find.text('Copy'), findsOneWidget);
  });
}
