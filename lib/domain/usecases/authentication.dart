import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  AuthenticationParams({@required this.email, @required this.password});

  @override
  List get props => [email, password];
}
