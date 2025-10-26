import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wave_loading_indicator/wave_progress.dart';

void main() => runApp(const MyApp());

class ExpenseData {
  final String category;
  final double amount;

  ExpenseData(this.category, this.amount);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String navTitle = 'Overview';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text(
              navTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),

          //Cancel Button
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: TextButton(
                onPressed: () {
                  // print('Button Clicked!');
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 17),
              child: Text(
                'Accounts',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32,
                  letterSpacing: 1,
                ),
              ),
            ),

            //Cash container
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 15),
                  width: 195,
                  height: 145,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20), // space from edges
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // align left
                      mainAxisAlignment: MainAxisAlignment.end,
                      // align top
                      children: const [
                        Text(
                          'Cash',
                          style: TextStyle(
                            fontSize: 22,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 32), // space between text and amount
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: 28,
                            ),
                            Text(
                              '35.17',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //2nd container (Credit Debt)
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 14),
                  width: 195,
                  height: 145,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20), // space from edges
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // align left
                      mainAxisAlignment: MainAxisAlignment.end,
                      // align top
                      children: const [
                        Text(
                          'Credit Debt',
                          style: TextStyle(
                            fontSize: 22,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 32), // space between text and amount
                        Row(
                          children: [
                            Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Icon(
                              Icons.attach_money,
                              color: Colors.white,
                              size: 28,
                            ),
                            Text(
                              '4320.0',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Spending container
            Container(
              padding: const EdgeInsets.only(top: 10, left: 17),
              child: Row(
                children: const [
                  Text(
                    'Spending',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'July 2018',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            //chart
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 400,
                      height: 180,
                      child: SfCircularChart(
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.right,
                          orientation: LegendItemOrientation.vertical,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        series: <DoughnutSeries<ExpenseData, String>>[
                          DoughnutSeries<ExpenseData, String>(
                            dataSource: [
                              ExpenseData('Home', 35),
                              ExpenseData('Food & Drink', 29),
                              ExpenseData('Hotel & Restaurant', 20),
                              ExpenseData('Traveling', 15),
                            ],
                            xValueMapper: (ExpenseData data, _) =>
                                data.category,
                            yValueMapper: (ExpenseData data, _) => data.amount,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: false,
                            ),
                            innerRadius: '22',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Budgets Container
            Container(
              margin: const EdgeInsets.only(top: 5, left: 17),
              // padding: const EdgeInsets.only(top: 5, left: 22),
              child: Row(
                children: const [
                  Text(
                    'Budgets',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'July',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            //linear Percent indicator
            Padding(
              padding: EdgeInsets.only(top: 5, right: 13, left: 18),
              child: SizedBox(
                height: 70,
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 1,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  child: LinearPercentIndicator(
                    width: 400,
                    animation: true,
                    lineHeight: 25.0,
                    animationDuration: 2000,
                    percent: 0.8,
                    center: Text(
                      "68.0%",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    barRadius: const Radius.circular(20),
                    backgroundColor: Colors.grey,
                    linearGradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purpleAccent],
                    ),
                  ),
                ),
              ),
            ),

            //Cash Flow
            Container(
              padding: const EdgeInsets.only(top: 10, left: 17),
              child: Row(
                children: const [
                  Text(
                    'Cash flow',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            //Wave Progress Container
            Container(
              margin: const EdgeInsets.only(top: 5, right: 18, left: 16),
              padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      WaveProgress(
                        borderSize: 3.0,
                        size: 80,
                        borderColor: Colors.pink,
                        foregroundWaveColor: Colors.blue,
                        backgroundWaveColor: Colors.white,
                        progress: 80,
                      ),
                      const Text(
                        '80%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  // Earned column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Earned',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 23,
                          ),
                          Text(
                            '200.0',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
