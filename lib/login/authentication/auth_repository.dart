class AuthRepository {
  Future<void> signin() async {
    print('attempting signin');
    await Future.delayed(Duration(seconds: 3));
    print('signin');
    throw Exception('failed signin');
  }
}
