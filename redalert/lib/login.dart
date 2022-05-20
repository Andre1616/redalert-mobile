import 'package:flutter/material.dart';
import 'package:redalert/main.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ Key? key }) : super(key: key);
  


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    String usuario = '';
    String email = '';
  @override
  Widget build(BuildContext context) {
    
    return Material(
      
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Alert',
            style: const TextStyle(
                color: Colors.red,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 80),      
            TextField(
                onChanged: (text){
                  usuario = text;
                },
                decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(),
                ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (text){
                email = text;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (email != '' && 
              usuario != ''){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage(email, usuario, 'Dias sem Movimentação'))
                  );
              }
              }, child: Text('Enviar')),
          ],
        ),
      ),
      ),
    );
  }
}