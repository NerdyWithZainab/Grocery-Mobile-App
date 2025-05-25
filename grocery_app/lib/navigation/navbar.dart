import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Container navBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                screenIndex = 0;
              });
            },
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                screenIndex = 1;
              });
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                screenIndex = 2;
              });
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                screenIndex = 3;
              });
            },
            icon: const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                screenIndex = 4;
              });
            },
            icon: const Icon(
              Icons.person_2_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
