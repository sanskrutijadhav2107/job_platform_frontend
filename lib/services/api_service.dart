class ApiService {
  static Future<void> registerUser(String name) async {
    // TEMP: Fake API call
    await Future.delayed(const Duration(seconds: 1));

    print('Register API called with name: $name');
  }
}
