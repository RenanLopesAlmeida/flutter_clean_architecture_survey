import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context, listen: false);

    return StreamBuilder<String>(
      stream: presenter.emailErrorStream,
      builder: (_, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validateEmail,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
            icon: Icon(
              Icons.email,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        );
      },
    );
  }
}
