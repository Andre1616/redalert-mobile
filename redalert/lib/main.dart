import 'package:flutter/material.dart';
import 'package:redalert/login.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Alert',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    
    );
  }
}

class MyHomePage extends StatefulWidget {
   
  String email;
  String usuario;
  MyHomePage(this.email, this.usuario, this.title);
  
  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  PageController page = PageController();
  late WebViewController controller;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Filtros',
      style: optionStyle,
    ),
    Text(
      'Index 2: Processos',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        controller.loadUrl(
            "https://desenvolvimento.trf5.jus.br/extensions/RedAlert/RedAlert.html");
            widget.title = 'Dias sem Movimentação';
      } else if (_selectedIndex == 1) {
        controller.loadUrl(
            "https://desenvolvimento.trf5.jus.br/extensions/RedAlert/filtros.html");
            widget.title = 'Filtros';
      } else if (_selectedIndex == 2) {
        controller.loadUrl(
            "https://desenvolvimento.trf5.jus.br/extensions/RedAlert/processos.html");
            widget.title = 'Tabela de Processos';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text((widget.email)),
              accountName: Text((widget.usuario)),
              currentAccountPicture: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 70.0,
              ),
            ),

          
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () {
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()));
                //Navegar para outra página
              },
            ),

          ],
        ),
      ),
      
      body: 
      WebView(
        
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            "https://desenvolvimento.trf5.jus.br/extensions/RedAlert/RedAlert.html",
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: 'Filtros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_sharp),
            label: 'Processos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
