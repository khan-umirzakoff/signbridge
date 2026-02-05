import 'package:flutter_test/flutter_test.dart';
import 'package:sign_bridge/main.dart';
import 'package:sign_bridge/screens/auth/login_screen.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that LoginScreen is displayed.
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
