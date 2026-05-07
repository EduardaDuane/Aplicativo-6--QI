import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final TextEditingController _controller = TextEditingController();
  double salarioLiquido = 0.0;
  double descontoTotal = 0.0;

  void _calcularINSS(){
    double salarioBruto = double.tryParse(_controller.text.replaceAll(',','.')) ?? 0.0;
    double desconto = 0.0;
    if(salarioBruto <= 1621){
      descontoTotal = salarioBruto / 100 * 0.075;
    } else if (salarioBruto <= 2902.84) {
      descontoTotal = salarioBruto * 0.09 - 24.32;
    } else if (salarioBruto <= 4354.27){
      descontoTotal = salarioBruto * 0.12 - 111.37;
    } else if (salarioBruto <= 8475.75) {
      descontoTotal = salarioBruto * 0.14 - 198.49;
    } else {
      desconto = 953.94;
    }
    setState(() {
      salarioLiquido = salarioBruto - desconto;
      descontoTotal = desconto;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("INSS Correto"),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.account_balance_wallet ,
              size: 80,
              color: const Color.fromARGB(255, 3, 200, 250),  
            ),

            SizedBox(height: 20.0,),

            TextField(
              
              decoration: InputDecoration(
                labelText: 'Informe o salário bruto:',
                border: OutlineInputBorder(),
                prefix: Icon(Icons.wallet)
              ),
            ),
            SizedBox(height: 20.0,),

            ElevatedButton(
            onPressed: (){
              _calcularINSS();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: const Color.fromARGB(251, 255, 255, 255),
              padding: EdgeInsets.symmetric(vertical: 15.0),


               
            ),
            child: Text(
              'Ver'
            ),
            ),
            Text('Desconto Total: ${descontoTotal.toStringAsFixed(2)}')
          ],
        ),
      )
    );
  }
}