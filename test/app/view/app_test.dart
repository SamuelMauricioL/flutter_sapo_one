import 'package:flutter_sapo_one/app/app.dart';
import 'package:flutter_sapo_one/verification/views/verification_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(VerificationView), findsOneWidget);
    });
  });
}
