import 'package:tekartik_app_utils/csv/csv_utils.dart' as csv;
import 'package:test/test.dart';

void main() {
  group('csv_utils', () {
    test('escape', () {
      expect(csv.escapeString(null), null);
      expect(csv.escapeString(''), '');
      expect(csv.escapeString(','), '","');
      expect(csv.escapeString('\r'), '"\r"');
      expect(csv.escapeString('\n'), '"\n"');
      expect(csv.escapeString('"'), '""""');
      expect(csv.escapeString('b,"c'), '"b,""c"');
    });
  });
}
