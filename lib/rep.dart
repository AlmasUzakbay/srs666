class UserRepository {
  Future<bool> registerUser(Map<String, dynamic> userData) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
