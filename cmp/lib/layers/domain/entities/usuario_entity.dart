import 'dart:ffi';

class UserEntity {
  String userName;
  DateTime lastConfession;
  // ParishEntity mainParish;
  Bool systemAdministrator;
  Bool userGuess;
  Bool parishAdministrator;
  UserEntity({
    required this.userName,
    required this.lastConfession,
    // required this.mainParish,
    required this.systemAdministrator,
    required this.userGuess,
    required this.parishAdministrator,
  });
}
