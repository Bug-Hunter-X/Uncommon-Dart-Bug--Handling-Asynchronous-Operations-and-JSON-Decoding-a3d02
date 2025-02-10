```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming the response body is always a JSON array
      final data = jsonDecode(response.body) as List<dynamic>; 
      // Process the data
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Very basic error handling, needs improvement
    print('Error: $e');
  }
}
```