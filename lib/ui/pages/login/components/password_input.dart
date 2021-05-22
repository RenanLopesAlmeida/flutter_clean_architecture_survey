import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context, listen: false);

    return StreamBuilder<String>(
        stream: presenter.passwordErrorStream,
        builder: (_, snapshot) {
          return TextFormField(
            obscureText: true,
            onChanged: presenter.validatePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          );
        });
  }
}
