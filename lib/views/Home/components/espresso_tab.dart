import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/Home/components/coffeecard.dart';
import 'package:flutter_application_1/views/constants.dart';

class EspressoTab extends StatelessWidget {
  const EspressoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CoffeeCard(
                name: 'Espresso',
                path: 'assets/espresso/1.jpeg',
                mix: 'chocolate',
                price: '4.12',
                rating: '4.7',
              ),
              CoffeeCard(
                name: 'Espresso',
                path: 'assets/espresso/2.jpg',
                mix: 'low fat milk',
                price: '5.5',
                rating: '4.5',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text('Special Offer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(width: 2),
              Icon(
                Icons.card_giftcard,
                color: Colors.red,
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/espresso/4.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: colorLightBrown,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Discount Sales',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Get three Ice Flovoured \n cappuccino for \$12',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
