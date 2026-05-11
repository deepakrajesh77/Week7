Future<String> fetchData() async {
  try {
    await Future.delayed(const Duration(seconds: 3));

    // Simulate random error
    bool isError = DateTime.now().second % 2 == 0;

    if (isError) {
      throw Exception('Connection Timeout');
    }

    return 'Data fetched successfully';
  } catch (e) {
    return 'Error: $e';
  }
}
void main() async {
  String result = await fetchData();
  print(result);
}
