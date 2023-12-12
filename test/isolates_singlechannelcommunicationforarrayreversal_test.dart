import 'package:isolates_singlechannelcommunicationforarrayreversal/isolates_singlechannelcommunicationforarrayreversal.dart';
import 'package:test/test.dart';

void main() {
  test('reverseArrayInIsolate reverses arrays correctly', () async {
    expect(
        await reverseArrayInIsolate([1, 2, 3, 4, 5]), equals([5, 4, 3, 2, 1]));
    expect(await reverseArrayInIsolate([10, 20, 30]), equals([30, 20, 10]));
  });
}
