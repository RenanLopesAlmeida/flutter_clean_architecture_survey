import 'package:flutter/foundation.dart';

import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}
