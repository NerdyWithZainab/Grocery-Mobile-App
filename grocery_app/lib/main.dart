import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      bottomNavigationBar: NavBar(context),
    );
  }

  Container NavBar(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Groceries Collections')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: List.generate(categories.length, (index) {
            final item = categories[index];
            return StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: CategoryTile(
                title: item['title']!,
                price: item['price']!,
                image: item['image']!,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const CategoryTile({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: const TextStyle(color: Colors.green)),
          ),
          const SizedBox(height: 8),
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
