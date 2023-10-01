import 'package:flutter/material.dart';
import 'package:webtoonapp/widgets/button.dart';
import 'package:webtoonapp/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Cattynip",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Text(
                  "Total Balanace",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "\$5 194 382",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      textColor: Colors.black,
                      bgColor: Color(0xFFF1B33B),
                    ),
                    Button(
                      text: "Request",
                      textColor: Colors.white,
                      bgColor: Color(0xFF1F2123),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CurrencyCard(
                  bgColor: Color(0xFF1F2123),
                  textColor: Colors.white,
                  currency: "Euro",
                  currencyUnit: "EUR",
                  amount: "6 428",
                  iconData: Icons.euro_sharp,
                  index: 0,
                ),
                const CurrencyCard(
                  bgColor: Colors.amber,
                  textColor: Colors.black,
                  currency: "Bitcoin",
                  currencyUnit: "BTC",
                  amount: "226 428",
                  iconData: Icons.currency_bitcoin_sharp,
                  index: 1,
                ),
                const CurrencyCard(
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  currency: "Dallor",
                  currencyUnit: "\$",
                  amount: "199 226 428",
                  iconData: Icons.attach_money_sharp,
                  index: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
