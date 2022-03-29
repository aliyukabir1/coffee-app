import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/detail/detail_view.dart';

class CoffeeCard extends StatelessWidget {
  final String name;
  final String price;
  final String path;
  final String rating;
  final String mix;

  const CoffeeCard({
    Key? key,
    required this.name,
    required this.price,
    required this.path,
    required this.rating,
    required this.mix,
  }) : super(key: key);
//further
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * .40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(179, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(path))),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 146, 59)
                          .withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ]),
                ))
          ],
        ),
        const SizedBox(height: 20),
        Text(name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Text(
          mix,
          style:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ $price',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailView(
                              name: name,
                              price: price,
                              imagepath: path,
                              rating: rating,
                              mix: mix,
                            )));
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 7, 63, 9),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            )
          ],
        )
      ]),
    );
  }
}
