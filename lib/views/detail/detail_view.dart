import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/constants.dart';

class DetailView extends StatefulWidget {
  final String name, price, mix, rating, imagepath;

  const DetailView(
      {Key? key,
      required this.name,
      required this.price,
      required this.mix,
      required this.rating,
      required this.imagepath})
      : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int tabvalue = 1;

  onchange(int val) {
    setState(() {
      tabvalue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.imagepath),
              ),
            ),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.mix,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: colorLightBrown.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          widget.rating,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 3),
                      ]),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * .43,
            child: SizedBox(
              height: 500,
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Coffee Size',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TeaSize(
                              title: 'small',
                              value: 1,
                              groupValue: tabvalue,
                              onChange: (value) =>
                                  setState(() => tabvalue = value),
                            ),
                            TeaSize(
                              title: 'Medium',
                              value: 2,
                              groupValue: tabvalue,
                              onChange: (value) =>
                                  setState(() => tabvalue = value),
                            ),
                            TeaSize(
                              title: 'Large',
                              value: 3,
                              groupValue: tabvalue,
                              onChange: (value) =>
                                  setState(() => tabvalue = value),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Coffee Size',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'cappuccino is the richest type of all types and hence uses cream instead of mild as'
                          'the primary ingredient along with double espresso....',
                          style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 70, 66, 66)),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 7, 63, 9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Add to cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '\$' + widget.price,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class TeaSize extends StatelessWidget {
  final String title;
  final ValueChanged onChange;
  final int value, groupValue;
  const TeaSize(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChange(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            color: isSelected ? colorGreen : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }
}
