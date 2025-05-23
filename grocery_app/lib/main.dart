import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Grocery App",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
      ),
      themeMode: ThemeMode.system,
      home: GroceryApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(),
      home: const Grocery(title: "Grocery App"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Grocery extends StatefulWidget {
  const Grocery({super.key, required this.title});

  final String title;

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  int screenIndex = 0;
  final screens = [
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
      bottomNavigationBar: navBar(context),
    );
  }

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, String>> categories = [
    {
      'title': 'Fresh Fruits & Vegetable',
      'price': '\$07.00',
      'image': 'assets/images/fruits.webp',
    },
    {
      'title': 'Bakery & Snacks',
      'price': '\$06.00',
      'image': 'assets/images/bakery.png',
    },
    {
      'title': 'Meat & Fish',
      'price': '\$08.00',
      'image': 'assets/images/meat.png',
    },
    {
      'title': 'Egg Chicken Red',
      'price': '\$06.00',
      'image': 'assets/images/egg.png',
    },
    {
      'title': 'Cooking Oil & Ghee',
      'price': '\$06.00',
      'image': 'assets/images/oil.png',
    },
    {
      'title': 'Apple & Grape Juice',
      'price': '\$06.00',
      'image': 'assets/images/juice.png',
    },
  ];

  // Helper function for type conversion (add this to your class):
  double _convertToDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Groceries',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Collections',
              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return CategoryTile(
              title: item['title']!,
              price: item['price']!,
              image: item['image']!,
              description: item['description'] ?? '',
              rating: _convertToDouble(item['rating']),
              height: _convertToDouble(item['height'], defaultValue: 200.0),
            );
          },
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String description;
  final double rating;
  final double height;

  const CategoryTile({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with varying heights
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Content section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Price
                      Text(
                        price,
                        style: GoogleFonts.roboto(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
