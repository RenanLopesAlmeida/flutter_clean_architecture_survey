import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginHeader(),
          Headline1(label: 'LOGIN'),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              child: Column(
                children: [
                  StreamBuilder<String>(
                      stream: presenter.emailErrorStream,
                      builder: (_, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: presenter.validateEmail,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: snapshot.data?.isEmpty == true
                                ? null
                                : snapshot.data,
                            icon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                    child: StreamBuilder<String>(
                        stream: presenter.passwordErrorStream,
                        builder: (_, snapshot) {
                          return TextFormField(
                            obscureText: true,
                            onChanged: presenter.validatePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText: snapshot.data?.isEmpty == true
                                  ? null
                                  : snapshot.data,
                              icon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          );
                        }),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text('Login'.toUpperCase()),
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text('Create Account'))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
