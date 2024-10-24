// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   int touchedIndex = -1;
//   int stockTouchedIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Investment Dashboard')),
//       body: SingleChildScrollView( // Make the body scrollable
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Investment Distribution',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(flex: 2, child: _buildPieChart()),
//                 const SizedBox(width: 20),
//                 Expanded(flex: 1, child: _buildIndicators()),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Stock Distributions',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(flex: 2, child: _buildStockPieChart()),
//                 const SizedBox(width: 20),
//                 Expanded(flex: 1, child: _buildStockIndicators()),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'Additional content goes here',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//
//             ),
//             const SizedBox(height: 40), // Extra space at the bottom
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPieChart() {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: PieChart(
//         PieChartData(
//           pieTouchData: PieTouchData(
//             touchCallback: (FlTouchEvent event, pieTouchResponse) {
//               setState(() {
//                 if (!event.isInterestedForInteractions ||
//                     pieTouchResponse == null ||
//                     pieTouchResponse.touchedSection == null) {
//                   touchedIndex = -1;
//                   return;
//                 }
//                 touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
//               });
//             },
//           ),
//           borderData: FlBorderData(show: false),
//           sectionsSpace: 0,
//           centerSpaceRadius: 30,
//           sections: showingSections(),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStockPieChart() {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: PieChart(
//         PieChartData(
//           pieTouchData: PieTouchData(
//             touchCallback: (FlTouchEvent event, pieTouchResponse) {
//               setState(() {
//                 if (!event.isInterestedForInteractions ||
//                     pieTouchResponse == null ||
//                     pieTouchResponse.touchedSection == null) {
//                   stockTouchedIndex = -1;
//                   return;
//                 }
//                 stockTouchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
//               });
//             },
//           ),
//           borderData: FlBorderData(show: false),
//           sectionsSpace: 0,
//           centerSpaceRadius: 30,
//           sections: showingStockSections(),
//         ),
//       ),
//     );
//   }
//
//   List<PieChartSectionData> showingSections() {
//     return [
//       PieChartSectionData(
//         color: Colors.blue,
//         value: 35,
//         title: '35%',
//         radius: touchedIndex == 0 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 0 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.orange,
//         value: 25,
//         title: '25%',
//         radius: touchedIndex == 1 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 1 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.green,
//         value: 15,
//         title: '15%',
//         radius: touchedIndex == 2 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 2 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.red,
//         value: 15,
//         title: '15%',
//         radius: touchedIndex == 3 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 3 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.purple,
//         value: 10,
//         title: '10%',
//         radius: touchedIndex == 4 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: touchedIndex == 4 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     ];
//   }
//
//   List<PieChartSectionData> showingStockSections() {
//     return [
//       PieChartSectionData(
//         color: Colors.blue,
//         value: 20,
//         title: '20%',
//         radius: stockTouchedIndex == 0 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 0 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.orange,
//         value: 15,
//         title: '15%',
//         radius: stockTouchedIndex == 1 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 1 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.green,
//         value: 25,
//         title: '25%',
//         radius: stockTouchedIndex == 2 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 2 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.red,
//         value: 10,
//         title: '10%',
//         radius: stockTouchedIndex == 3 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 3 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.purple,
//         value: 20,
//         title: '20%',
//         radius: stockTouchedIndex == 4 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 4 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         color: Colors.yellow,
//         value: 10,
//         title: '10%',
//         radius: stockTouchedIndex == 5 ? 60.0 : 50.0,
//         titleStyle: TextStyle(
//           fontSize: stockTouchedIndex == 5 ? 25.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     ];
//   }
//
//   Widget _buildIndicators() {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Indicator(color: Colors.blue, text: 'Stocks', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.orange, text: 'MF', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.green, text: 'Gold', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.red, text: 'Cash', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.purple, text: 'FD', isSquare: true),
//         SizedBox(height: 4),
//       ],
//     );
//   }
//
//   Widget _buildStockIndicators() {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Indicator(color: Colors.blue, text: 'Zomato', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.orange, text: 'Zerodha', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.green, text: 'TCS', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.red, text: 'Wipro', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.purple, text: 'Infosys', isSquare: true),
//         SizedBox(height: 4),
//         Indicator(color: Colors.yellow, text: 'HCL', isSquare: true),
//       ],
//     );
//   }
// }
//
// class Indicator extends StatelessWidget {
//   const Indicator({
//     super.key,
//     required this.color,
//     required this.text,
//     required this.isSquare,
//   });
//
//   final Color color;
//   final String text;
//   final bool isSquare;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 16,
//           width: 16,
//           decoration: BoxDecoration(
//             color: color,
//             shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
//           ),
//         ),
//         const SizedBox(width: 4),
//         Text(text),
//       ],
//     );
//   }
// }







import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex = -1;
  int stockTouchedIndex = -1;

  // Sample stock data
  final List<Map<String, dynamic>> stockData = [
    {'name': 'Zomato', 'price': 264.0, 'change': 1.5},
    {'name': 'Zerodha', 'price': 104.9, 'change': -2.0},
    {'name': 'TCS', 'price': 4065.15, 'change': 25.0},
    {'name': 'Wipro', 'price': 547.15, 'change': -3.5},
    {'name': 'Infosys', 'price': 1868.36, 'change': 10.0},
    {'name': 'HCL', 'price': 1845.0, 'change': 5.0},
  ];
  Widget _buildStockIndicators() {
    return Column(
      children: stockData.map((stock) {
        bool isPositive = stock['change'] > 0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Indicator(
            color: isPositive ? Colors.green : Colors.red,
            text: '${stock['name']} ${isPositive ? '↑' : '↓'}',
            isSquare: true,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investment Dashboard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Investment Distribution',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: _buildPieChart()),
                const SizedBox(width: 20),
                Expanded(flex: 1, child: _buildIndicators()),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Stock Distributions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: _buildStockPieChart()),
                const SizedBox(width: 20),
                Expanded(flex: 1, child: _buildStockIndicators()),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Today\'s Stock Prices',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildStockPrices(), // Display today's stock prices
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Method to build the stock prices list
  Widget _buildStockPrices() {
    return Column(
      children: stockData.map((stock) {
        bool isPositive = stock['change'] > 0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(stock['name'], style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  Text(
                    '\₹${stock['price'].toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${isPositive ? '+' : ''}${stock['change'].toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 16,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPieChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 30,
          sections: showingSections(),
        ),
      ),
    );
  }

  Widget _buildStockPieChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  stockTouchedIndex = -1;
                  return;
                }
                stockTouchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 30,
          sections: showingStockSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 35,
        title: '35%',
        radius: touchedIndex == 0 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 0 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 25,
        title: '25%',
        radius: touchedIndex == 1 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 1 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 15,
        title: '15%',
        radius: touchedIndex == 2 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 2 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 15,
        title: '15%',
        radius: touchedIndex == 3 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 3 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 10,
        title: '10%',
        radius: touchedIndex == 4 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 4 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<PieChartSectionData> showingStockSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 20,
        title: '20%',
        radius: stockTouchedIndex == 0 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: stockTouchedIndex == 0 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 15,
        title: '15%',
        radius: stockTouchedIndex == 1 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: stockTouchedIndex == 1 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 25,
        title: '25%',
        radius: stockTouchedIndex == 2 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: stockTouchedIndex == 2 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 10,
        title: '10%',
        radius: stockTouchedIndex == 3 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: stockTouchedIndex == 3 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 30,
        title: '30%',
        radius: stockTouchedIndex == 4 ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: stockTouchedIndex == 4 ? 25.0 : 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

  Widget _buildIndicators() {
    return Column(
      children: [
        Indicator(color: Colors.blue, text: 'Zomato', isSquare: true),
        const SizedBox(height: 4),
        Indicator(color: Colors.orange, text: 'Zerodha', isSquare: true),
        const SizedBox(height: 4),
        Indicator(color: Colors.green, text: 'TCS', isSquare: true),
        const SizedBox(height: 4),
        Indicator(color: Colors.red, text: 'Wipro', isSquare: true),
        const SizedBox(height: 4),
        Indicator(color: Colors.purple, text: 'Infosys', isSquare: true),
        const SizedBox(height: 4),
        Indicator(color: Colors.yellow, text: 'HCL', isSquare: true),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
  });

  final Color color;
  final String text;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: color,
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}