import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_copilot/main.dart';

void main() {
  testWidgets('App loads CopilotScreen with header and hero headline',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StepUpTutorCopilotApp());
    await tester.pumpAndSettle();

    expect(find.text('STEP UP'), findsOneWidget);
    expect(find.text('COPILOT'), findsOneWidget);
    expect(find.text('Empower Every Tutoring Moment with AI Guidance'), findsOneWidget);
  });
}
