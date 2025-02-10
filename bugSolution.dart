```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody is List) {
        return jsonBody;
      } else {
        throw Exception('Invalid JSON response: Expected a list, got ${jsonBody.runtimeType}');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    throw Exception('Invalid JSON format: $e');
  } on http.ClientException catch (e) {
    throw Exception('Network error: $e');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}

void main() async {
  try {
    final data = await fetchData();
    print(data);
  } catch (e) {
    print('Error: $e');
  }
}
```