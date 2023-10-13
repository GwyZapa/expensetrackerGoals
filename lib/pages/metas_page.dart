import 'package:expense_tracker/models/meta.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MetasPage extends StatefulWidget {
  const MetasPage({Key? key}) : super(key: key);

  @override
  State<MetasPage> createState() => _MetasPageState();
}

class _MetasPageState extends State<MetasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suas Metas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGraph(),
          _buildTotal(),
          _buildListGoals(),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildGraph() {
    return Container(
      height: 200,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            startAngle: 180,
            endAngle: 0,
            showLabels: false,
            minimum: 0,
            maximum: 100,
            canScaleToFit: true,
            showTicks: false,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 70,
                  gradient: const SweepGradient(
                      colors: <Color>[Color(0xFFFF7676), Color(0xFFF54EA2)],
                      stops: <double>[0.25, 0.75]),
                  startWidth: 10,
                  endWidth: 10),
            ],
            pointers: <GaugePointer>[],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: const Text('70%',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 45,
                  axisValue: 10,
                  positionFactor: 0)
            ])
      ]),
    );
  }

  Widget _buildTotal() {
    return Center(
      child: Container(
        width: 470,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Cor da borda
            width: 2.0, // Largura da borda
          ),
          borderRadius: BorderRadius.circular(12.0), // Borda arredondada
        ),
        padding: EdgeInsets.all(16.0), // Espaçamento interno
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Alinhamento dos elementos
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Total:'),
                  Text('\$10.000', style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Meta Mensal:', style: TextStyle(fontSize: 16.0)),
                  Text('\$30.000', style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListGoals() {
    // Substitua pelos dados reais das metas, por exemplo, uma lista de objetos de metas
    List<Meta> metas = [
      Meta("Meta 1", 10.000, 2500.0),
      Meta("Meta 2", 10.000, 5000.0),
      Meta("Meta 3", 10.000, 3750.0),
      Meta("Meta 4", 10.000, 5000.0),
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: metas.length,
        itemBuilder: (context, index) {
          Meta meta = metas[index];
          return Container(
            margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0), // Margens para o espaçamento entre os itens
            padding: EdgeInsets.all(8.0), // Espaçamento interno
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Cor da borda cinza
                width: 1.0, // Largura da borda
              ),
              borderRadius: BorderRadius.circular(12.0), // Borda arredondada
            ),
            child: ListTile(
              leading: Icon(Icons.star), // Ícone da meta
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(meta.nome), // Nome da meta
                      Text('R\$10.0000'),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red), // Barra vermelha
                  ),
                  Text(
                    '\$${meta.saldo.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          // Adicione a ação que deseja executar ao pressionar o botão
        },
        icon: Icon(Icons.add, color: Colors.grey), // Ícone de adição (plus)
        label: Text(
          'Nova Meta',
          style: TextStyle(
            color: Colors.grey, // Cor do texto cinza
          ),
        ),
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(Size(100, 40)), // Tamanho menor
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white), // Fundo branco
          overlayColor: MaterialStateProperty.all<Color>(
              Colors.transparent), // Cor de sobreposição transparente
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.grey, width: 1.0)), // Borda cinza
        ),
      ),
    );
  }
}
