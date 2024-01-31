import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String des;
  final num persent;
  final String iconUrl;

  const CustomCard({
    super.key,
    required this.title,
    required this.des,
    required this.persent,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(iconUrl),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    des,
                    style:
                        const TextStyle(fontSize: 12.0, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            '$persent%',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
