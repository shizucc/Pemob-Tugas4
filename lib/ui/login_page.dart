import 'package:flutter/material.dart';
import 'package:p3/ui/registrasi_page.dart';
import 'package:p3/ui/widgets/name_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email harus diisi";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value!.length < 6) {
          return "Password kurang dari 6 karakter";
        }
        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState!.validate();
        },
        child: Text("Login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [myName()],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(children: [
              _emailTextField(),
              _passwordTextField(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: _buttonLogin(),
              ),
              Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const RegistrationPage())));
                    },
                    child: Text("Registrasi")),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
