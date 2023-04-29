import 'package:flutter/material.dart';
import 'package:pharmacy_end/homepage.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userId = TextEditingController();
  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Log In as Pharmacy"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: userId,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    // hintText: texthint,
                    hintStyle: TextStyle(fontSize: 12)
                    // prefixIcon: Icon(Icons.mail, color: Colors.grey.shade300, size: 20,)
                    ),
                    
                ),
              ),
              SizedBox(height: 30,),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: username,
              
                   decoration: const InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    // hintText: texthint,
                    hintStyle: TextStyle(fontSize: 12)
                    // prefixIcon: Icon(Icons.mail, color: Colors.grey.shade300, size: 20,)
                    ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await ZIMKit()
                        .connectUser(id: userId.text, name: username.text);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
