import 'dart:math';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_estado/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';


class ImcSetstatePage extends StatefulWidget {
  const ImcSetstatePage({super.key});

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {

  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  var imc = 0.0;
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  Future<void> _calcularImc( { required double peso, required double altura}) async {

    setState(() {
      imc = 0;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC SetState'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),  
                SizedBox(height: 20,),
                TextFormField(
                  controller: pesoEC,
                  validator: (String? value){
                    if (value == null ||  value.isEmpty){
                      return 'Peso obrigatório';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso'),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    
                    )
                  ],
          
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura'),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    )
                  ],
                  validator: (String? value){
                    if (value == null ||  value.isEmpty){
                      return 'Altura obrigatória';
                    }
                    return null;
                  },
          
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  
                  var formValid = formkey.currentState?.validate() ?? false; 

                  if (formValid) {
                    var formatter =  NumberFormat.simpleCurrency(
                    locale: 'pt_BR', decimalDigits: 2
                  );
                  double peso = formatter.parse(pesoEC.text) as double;
                  double altura = formatter.parse(alturaEC.text) as double;

                  _calcularImc(peso: peso, altura: altura);
                  }

                  
          
                }, child: Text('Calcular IMC'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
