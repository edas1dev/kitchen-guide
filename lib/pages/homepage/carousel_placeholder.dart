import 'package:flutter/material.dart';

class CarouselPlaceholder extends StatelessWidget {
  const CarouselPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 160,
                height: 20,
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 48,
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
            height: 290,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 25),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(right: 25),
                width: 200,
              ),
            )
        )
      ],
    );
  }
}
