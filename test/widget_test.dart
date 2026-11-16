import 'package:flutter_test/flutter_test.dart';
import 'package:jahitko/app/app.dart';

void main() {
  testWidgets('JahitBatik app dapat ditampilkan', (WidgetTester tester) async {
    await tester.pumpWidget(const JahitBatikApp());

    expect(find.byType(JahitBatikApp), findsOneWidget);
  });
}