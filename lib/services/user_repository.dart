import 'package:user_list/models/user.dart';
import 'package:user_list/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _userProvider = UserProvider();
  Future<dynamic> gerAllUsers() => _userProvider.getUser();
}
