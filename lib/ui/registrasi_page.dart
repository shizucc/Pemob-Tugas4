import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _namaTextField() {
    return TextFormField(
      controller: _namaController,
      decoration: InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama Harus diisi min 4 char";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email diisi";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email diisi";
        }
        return null;
      },
    );
  }

  Widget _passwordConfirmationTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Konfirmasi Password"),
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value != _passwordController.text) {
          return "Konfirmasi password tidak sama";
        }
        return null;
      },
    );
  }

  Widget _buttonRegistrasi() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState!.validate();
        },
        child: Text("Registrasi"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _namaTextField(),
                _emailTextField(),
                _passwordTextField(),
                _passwordConfirmationTextField(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: _buttonRegistrasi())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
