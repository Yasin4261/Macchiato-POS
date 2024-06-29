import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // Şifre gizliliği durumu

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 16),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.blue,
                    size: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth / 2,
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your name',
                      hintText: 'John Doe',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText:
                        _obscureText, // Şifreyi gizlemek için kullanılır
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Enter your password',
                      hintText: '123',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "version 1.1",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
