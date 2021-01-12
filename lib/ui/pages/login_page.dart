import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: Image(
                image: AssetImage('lib/ui/assets/logo.png'),
              ),
            ),
            Text('Login'.toUpperCase()),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Login'.toUpperCase()),
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text('Create Account'))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
