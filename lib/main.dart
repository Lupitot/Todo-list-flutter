import 'package:flutter/material.dart';
import './pages/add_task.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final mytheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 25, 55, 191),
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 27,
          color: Color.fromARGB(255, 200, 200, 200),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(223, 32, 142, 34)),
        ),
      ),
    );
    return MaterialApp(
      title: 'Ma Todo List',
      theme: mytheme,
      home: MainScreen(mytheme: mytheme),
    );
  }
}

class MainScreen extends StatefulWidget {
  final ThemeData mytheme;
  const MainScreen({super.key, required this.mytheme});
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<String> Liste = [];
  int _point = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo List",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color.fromARGB(223, 32, 142, 34),
              fontSize: 40,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(30)),
            Text(
              'Vous avez $_point points',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(30)),
            Flexible(
              child: Container(
                width: 350,
                child: ListView.builder(
                  itemCount: Liste.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: Color.fromARGB(190, 32, 142, 34),
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              Liste.removeAt(index);
                            });
                          },
                        ),
                        leading: IconButton(
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              _point++;
                              Liste.removeAt(index);
                            });
                          },
                        ),
                        title: Text(Liste[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation1, animation2, child) {
                      return ScaleTransition(
                        scale: Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(
                          CurvedAnimation(
                            parent: animation1,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation1, animation2) =>
                        AddTask(mytheme: Theme.of(context)),
                  ),
                ).then((Res) {
                  if (Res != null && Res.isNotEmpty) {
                    setState(() {
                      Liste.add(Res);
                    });
                  }
                });
              },
              child: Text(
                'Ajouter une tâche',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.all(30)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () => showDialog<String>(
          
          context: context,
          builder: (buildcontext) => AlertDialog(
            title: const Text('A propos',
              style: TextStyle(
                color: Color.fromARGB(223, 32, 142, 34),
                fontSize: 30,
              ),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children : [
                Text('Plus vous faites de tâches, plus vous gagnez de points ! \n\nAu bout de 100point vous avez gagné le droit de vous payer un verre ! \n\nEvidemment soyez reglo, ne trichez pas (ㆆ_ㆆ) \n\nVous pouvez supprimer une tâche en cliquant sur la poubelle, ou la valider en cliquant sur la coche. \n\nBonne chance !',
                  style: TextStyle(
                    color: Color.fromARGB(255, 251, 251, 251),
                    fontSize: 16,
                  ),
                ),
              ]
            
            
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok',
                  style: TextStyle(
                    color: Color.fromARGB(223, 32, 142, 34),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        
        child: const Icon(
          Icons.info,
          color: Color.fromARGB(223, 32, 142, 34),
          size: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
