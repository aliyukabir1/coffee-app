import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/Home/components/cappucciotab.dart';
import 'package:flutter_application_1/views/Home/components/cold_brew_tab.dart';
import 'package:flutter_application_1/views/Home/components/custom_appbar.dart';
import 'package:flutter_application_1/views/Home/components/espresso_tab.dart';
import 'package:flutter_application_1/views/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var selectedNavbar = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void changeNavbarIndex(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedNavbar,
          onTap: (index) {
            changeNavbarIndex(index);
          },
          fixedColor: colorLightBrown,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const CustomAppBar(),
            const SizedBox(
              height: 20,
            ),
            const Text('Good Morning, Aliyu',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            const SearchBar(),
            const SizedBox(height: 20),
            SizedBox(
                height: MediaQuery.of(context).size.height * .60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            color: colorGreen,
                            borderRadius: BorderRadius.circular(20)),
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        tabs: const [
                          TabBarWidget(
                            name: 'Cappuccino',
                            icon: Icons.coffee,
                          ),
                          TabBarWidget(
                            name: 'Cold Brew',
                            icon: Icons.coffee,
                          ),
                          TabBarWidget(
                            name: 'Espresso',
                            icon: Icons.coffee,
                          ),
                        ]),
                    const SizedBox(height: 40),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            CappuccinoTab(),
                            ColdBrewTab(),
                            EspressoTab(),
                          ]),
                    )
                  ],
                ))
          ]),
        )),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  const TabBarWidget({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [Icon(icon), const SizedBox(width: 5), Text(name)],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      fillColor: Colors.grey.withOpacity(0.3),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      prefixIcon: const Icon(Icons.search),
      hintText: 'Search Coffee',
      suffixIcon: Container(
        margin: const EdgeInsets.all(5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorLightBrown,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.tune,
          color: Colors.white,
        ),
      ),
    ));
  }
}
