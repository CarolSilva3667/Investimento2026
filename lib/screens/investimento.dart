import 'package:flutter/material.dart';

class Investimento extends StatefulWidget {
  @override
  State<Investimento> createState() => _InvestimentoState();
}

class _InvestimentoState extends State<Investimento> {
  double valorMensal = 0;
  double juros = 0;
  int meses = 0;

  double semJuros = 0;
  double comJuros = 0;

  void calcular() {
    // Sem juros
    semJuros = valorMensal * meses;

    // Com juros compostos
    double total = 0;
    for (int i = 0; i < meses; i++) {
      total = (total + valorMensal) * (1 + juros);
    }
    comJuros = total;

    setState(() {});

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "Sem juros: R\$ ${semJuros.toStringAsFixed(2)}\n"
          "Com juros: R\$ ${comJuros.toStringAsFixed(2)}",
        ),
      ),
    );
  }

  InputDecoration campo(String texto) {
    return InputDecoration(
      labelText: texto,
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simulador de Investimentos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: campo("Valor mensal"),
              keyboardType: TextInputType.number,
              onChanged: (v) => valorMensal = double.parse(v),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: campo("Número de meses"),
              keyboardType: TextInputType.number,
              onChanged: (v) => meses = int.parse(v),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: campo("Taxa de juros (ex: 0.01)"),
              keyboardType: TextInputType.number,
              onChanged: (v) => juros = double.parse(v),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text("Simular"),
            ),
            SizedBox(height: 20),

            // RESULTADOS NA TELA
            Text("Sem juros: R\$ ${semJuros.toStringAsFixed(2)}"),
            Text("Com juros: R\$ ${comJuros.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}