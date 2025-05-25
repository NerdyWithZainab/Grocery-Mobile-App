import 'package:flutter/material.dart';
import 'package:grocery_app/screens/cart.dart';
import 'package:grocery_app/screens/categories.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/location.dart';
import 'package:grocery_app/screens/user-profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int screenIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const LocationScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: _buildNavBar(),
    );
  }

  Widget _buildNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            index: 0,
            label: 'Home',
          ),
          _buildNavItem(
            icon: Icons.shopping_bag_outlined,
            selectedIcon: Icons.shopping_bag,
            index: 1,
            label: 'Categories',
          ),
          _buildNavItem(
            icon: Icons.shopping_cart_outlined,
            selectedIcon: Icons.shopping_cart,
            index: 2,
            label: 'Cart',
          ),
          _buildNavItem(
            icon: Icons.location_on_outlined,
            selectedIcon: Icons.location_on,
            index: 3,
            label: 'Location',
          ),
          _buildNavItem(
            icon: Icons.person_2_outlined,
            selectedIcon: Icons.person_2,
            index: 4,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required int index,
    required String label,
  }) {
    final bool isSelected = screenIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          screenIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.green.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? Colors.green : Colors.grey,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.green : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
