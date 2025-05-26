import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    loadImagesWithCheck();
  }

  List<Map<String, dynamic>> categories = [];
  Future<void> loadImagesWithCheck() async {
    final List<Map<String, dynamic>> rawCategories = [
      {
        'title': 'Fresh Fruits\n& Vegetable',
        'price': '\$07.00',
        'image': "assets/images/fruits_vegetables.png",
        'description':
            'Fresh organic fruits and vegetables delivered straight from the farm',
        'rating': 4.5,
        'itemCount': 245,
        'backgroundColor': const Color(0xFFE8F5E8), // Light green
      },
      {
        'title': 'Bakery & Snacks',
        'price': '\$06.00',
        'image': 'assets/images/bakery.png',
        'description': 'Fresh baked goods',
        'rating': 4.2,
        'itemCount': 180,
        'backgroundColor': const Color(0xFFFFF2E0), // Light orange
      },
      {
        'title': 'Meat & Fish',
        'price': '\$08.00',
        'image': 'assets/images/meat.jpg',
        'description':
            'Premium quality meat and fish sourced from trusted suppliers',
        'rating': 4.7,
        'itemCount': 120,
        'backgroundColor': const Color(0xFFFFE6E6), // Light pink/red
      },
      {
        'title': 'Egg',
        'price': '\$06.00',
        'image': 'assets/images/egg.webp',
        'description': 'Farm fresh eggs',
        'rating': 4.3,
        'itemCount': 95,
        'backgroundColor': const Color(0xFFFFF0F0), // Very light pink
      },
      {
        'title': 'Cooking Oil\n& Ghee',
        'price': '\$06.00',
        'image': 'assets/images/cooking_oil.jpg',
        'description':
            'Pure cooking oils and ghee made from natural ingredients',
        'rating': 4.1,
        'itemCount': 75,
        'backgroundColor': const Color(0xFFE8F5E8), // Light green
      },
      {
        'title': 'Juices',
        'price': '\$06.00',
        'image': 'assets/images/juices.jpg',
        'description': '100% natural fruit juices without preservatives',
        'rating': 4.6,
        'itemCount': 65,
        'backgroundColor': const Color(0xFFFFE6F0), // Light pink
      },
    ];
    setState(() {
      categories = rawCategories;
    });
  }

  // Helper function to calculate dynamic height based on content
  double _calculateDynamicHeight(
    String title,
    String description,
    int itemCount,
    double rating,
  ) {
    const double baseHeight = 180.0;
    const double titleMultiplier = 2.5;
    const double descriptionMultiplier = 0.8;
    const double itemCountHeight = 15.0;
    const double ratingHeight = 10.0;

    // Calculate height based on text length and content
    double titleHeight = title.length * titleMultiplier;
    double descriptionHeight = description.length * descriptionMultiplier;
    double extraHeight = itemCountHeight + (rating > 0 ? ratingHeight : 0);

    // Add random variation for more natural masonry effect
    double randomVariation =
        (itemCount % 3) * 20.0; // Based on item count for consistency

    // Calculate total height
    double totalHeight =
        baseHeight +
        titleHeight +
        descriptionHeight +
        extraHeight +
        randomVariation;

    // Apply constraints: minimum 200, maximum 320
    return totalHeight.clamp(200.0, 320.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Groceries',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Collections',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            final dynamicHeight = _calculateDynamicHeight(
              item['title']!,
              item['description'] ?? '',
              item['itemCount'] ?? 0,
              item['rating']?.toDouble() ?? 0.0,
            );

            return CategoryTile(
              title: item['title']!,
              price: item['price']!,
              image: item['image']!,
              description: item['description'] ?? '',
              rating: item['rating']?.toDouble() ?? 0.0,
              itemCount: item['itemCount'] ?? 0,
              backgroundColor: item['backgroundColor'] ?? Colors.grey[100]!,
              height: dynamicHeight,
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
  final int itemCount;
  final Color backgroundColor;
  final double height;

  const CategoryTile({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.itemCount,
    required this.backgroundColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Uses the calculated dynamic height
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and item count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$itemCount Items',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Sort/filter icon
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),

                // Spacer to push image to bottom
                const Spacer(),

                // Image section
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
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
              ],
            ),
          ),

          // Circular price badge at bottom right
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.shopping_cart, color: Colors.white, size: 20),
            ),
          ),

          // Price label near the circular button
          Positioned(
            bottom: 50,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                price,
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
