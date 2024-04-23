import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_use_basic/flutter_use.dart';
import 'flutter_hooks_testing.dart';

void main() {
  group('useLatest', () {
    testWidgets('should return a ref with the latest value on initial render',
        (tester) async {
      final result = await buildHook(
        (count) => useLatest(count),
        initialProps: 123,
      );

      expect(result.current, 123);

      await result.rebuild(456);
      expect(result.current, 456);

      await result.rebuild(789);
      expect(result.current, 789);
    });
  });
}
