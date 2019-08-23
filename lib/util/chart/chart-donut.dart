import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutChart(this.seriesList, {this.animate});

/// Cria um [PieChart] com dados de amostra e sem transição.
  factory DonutChart.withSampleData() {
    return new DonutChart(
      _createSampleData(),
// Desativar animações para testes de imagem.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    var pieChart = new charts.PieChart(seriesList,
        animate: animate,
// Configure a largura das fatias de pizza para 60px. O espaço restante em
// o gráfico será deixado como um buraco no centro.
//
// [ArcLabelDecorator] posicionará automaticamente o rótulo dentro do
// arc se o rótulo se encaixar. Se a etiqueta não couber, irá desenhar
// fora do arco com uma linha líder. As etiquetas podem sempre exibir
// dentro ou fora usando [LabelPosition].
//
// O estilo de texto para dentro / fora pode ser controlado independentemente por
// definindo [insideLabelStyleSpec] e [outsideLabelStyleSpec].
//
// Exemplo configurando diferentes estilos para dentro / fora:
// novos gráficos.ArcLabelDecorator (
// insideLabelStyleSpec: new charts.TextStyleSpec (...),
// outsideLabelStyleSpec: new charts.TextStyleSpec (...)),
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
    return pieChart;
  }

/// Crie uma série com dados codificados de amostra.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
// Define um acessador de rótulo para controlar o texto do rótulo do arco.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}


/// Exemplo de tipo de dados lineares.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}