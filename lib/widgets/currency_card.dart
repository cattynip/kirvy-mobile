import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currency, currencyUnit, amount;
  final Color bgColor, textColor;
  final IconData iconData;
  final int index;

  const CurrencyCard({
    required this.bgColor,
    required this.textColor,
    required this.currency,
    required this.currencyUnit,
    required this.amount,
    required this.iconData,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        0,
        index * -25,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 29,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        currencyUnit,
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(-24, 20),
                child: Transform.scale(
                  scale: 2.8,
                  child: Icon(
                    iconData,
                    size: 60,
                    color: textColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
