import 'package:flutter/material.dart';
import 'package:gerencia_estado/bloc_pattern/bloc_pattern_page.dart';
import 'package:gerencia_estado/change_notifier/change_notifier_page.dart';
import 'package:gerencia_estado/setState/imc_setstate_page.dart';
import 'package:gerencia_estado/value_notifier/value_notifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  void _goToPage(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, ImcSetstatePage()),
              child: Text('SetState'),
            )
            ,
            ElevatedButton(
              onPressed: () {
                _goToPage(context, ValueNotifierPage());
              },
              child: Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(context, ImcChangeNotifierPage());
              },
              child: Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(context, ImcBlocPatternPage());
              },
              child: Text('Bloc Pattern (Streams)'),
            )
            
          ],
        ),
      ),
    );
  }
}
