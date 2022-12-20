import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserController extends ChangeNotifier {
  bool isLoading = false;
  List<Results> users = [];

  UserController() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();
    users = await RemoteServices.fetchUsers();
    isLoading = false;
    notifyListeners();
  }
}
