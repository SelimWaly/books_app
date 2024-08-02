import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Test eBooks Library', () async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=everything'));
    expect(response.statusCode, equals(200));
  });
}
