import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/auth_provider.dart';

class LoginWithRestApi extends StatefulWidget {
  const LoginWithRestApi({super.key});

  @override
  State<LoginWithRestApi> createState() => _LoginWithRestApiState();
}

class _LoginWithRestApiState extends State<LoginWithRestApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(builder: (context, value, child) {
              return TextFormField(
                obscureText: value.isObsecureText,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        value.showPass();
                      },
                      icon: value.isObsecureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    value.login(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    child: value.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Center(
                            child: Text("Login"),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
