import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  final ThemeData mytheme;
  const AddTask({super.key, required this.mytheme});

  @override
  _AddTask createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  final _TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajout de tâche",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: TextField(
                controller: _TextController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(223, 32, 142, 34),
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Entrez votre tâche',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(223, 238, 238, 238),
                  ),
                  hintText: 'Exemple : Apprendre le flutter',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(98, 203, 203, 203),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _TextController.text);
              },
              child: Text(
                'Ajouter',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
