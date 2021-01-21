import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          widget.presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => SimpleDialog(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text('Loading...', textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }
          });

          widget.presenter.mainErrorStream.listen((error) {
            if (error != null) {
              return Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red[900],
                content: Text(error, textAlign: TextAlign.center),
              ));
            }
          });

          return SingleChildScrollView(
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
                            stream: widget.presenter.emailErrorStream,
                            builder: (_, snapshot) {
                              return TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: widget.presenter.validateEmail,
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
                              stream: widget.presenter.passwordErrorStream,
                              builder: (_, snapshot) {
                                return TextFormField(
                                  obscureText: true,
                                  onChanged: widget.presenter.validatePassword,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    errorText: snapshot.data?.isEmpty == true
                                        ? null
                                        : snapshot.data,
                                    icon: Icon(
                                      Icons.lock,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        StreamBuilder<bool>(
                            stream: widget.presenter.isFormValidStream,
                            builder: (context, snapshot) {
                              return RaisedButton(
                                onPressed: snapshot.data == true
                                    ? widget.presenter.auth
                                    : null,
                                child: Text('Login'.toUpperCase()),
                              );
                            }),
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
          );
        },
      ),
    );
  }
}
