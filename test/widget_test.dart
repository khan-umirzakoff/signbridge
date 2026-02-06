import 'package:flutter_test/flutter_test.dart';
import 'package:sign_bridge/main.dart';
import 'package:sign_bridge/screens/onboarding_screen.dart';

void main() {
  testWidgets('App loads onboarding screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SignBridgeApp());

    // Verify that OnboardingScreen is present.
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
