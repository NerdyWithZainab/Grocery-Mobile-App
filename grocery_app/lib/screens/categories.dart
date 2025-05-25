import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Fresh Fruits & Vegetable',
      'price': '\$07.00',
      'image': 'assets/images/fruits.webp',
      'description':
          'Fresh organic fruits and vegetables delivered straight from the farm',
      'rating': 4.5,
    },
    {
      'title': 'Bakery & Snacks',
      'price': '\$06.00',
      'image': 'assets/images/bakery.png',
      'description': 'Fresh baked goods',
      'rating': 4.2,
    },
    {
      'title': 'Meat & Fish',
      'price': '\$08.00',
      'image': 'assets/images/meat.png',
      'description':
          'Premium quality meat and fish sourced from trusted suppliers with guaranteed freshness',
      'rating': 4.7,
    },
    {
      'title': 'Egg Chicken Red',
      'price': '\$06.00',
      'image': 'assets/images/egg.png',
      'description': 'Farm fresh',
      'rating': 4.3,
    },
    {
      'title': 'Cooking Oil & Ghee',
      'price': '\$06.00',
      'image': 'assets/images/oil.png',
      'description': 'Pure cooking oils and ghee made from natural ingredients',
      'rating': 4.1,
    },
    {
      'title': 'Apple & Grape Juice',
      'price': '\$06.00',
      'image': 'assets/images/juice.png',
      'description':
          '100% natural fruit juices without any artificial preservatives or added sugars',
      'rating': 4.6,
    },
  ];

  // Helper function to calculate dynamic height based on content
  double _calculateDynamicHeight(
    String title,
    String description,
    double rating,
  ) {
    const double baseHeight = 160.0;
    const double titleMultiplier = 1.2;
    const double descriptionMultiplier = 0.8;
    const double ratingHeight = 20.0;

    // Calculate height based on text length
    double titleHeight = title.length * titleMultiplier;
    double descriptionHeight = description.length * descriptionMultiplier;
    double extraHeight = rating > 0 ? ratingHeight : 0;

    // Calculate total height with min/max constraints
    double totalHeight =
        baseHeight + titleHeight + descriptionHeight + extraHeight;

    // Apply constraints: minimum 160, maximum 280
    return totalHeight.clamp(160.0, 280.0);
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
            final dynamicHeight = _calculateDynamicHeight(
              item['title']!,
              item['description'] ?? '',
              item['rating']?.toDouble() ?? 0.0,
            );

            return CategoryTile(
              title: item['title']!,
              price: item['price']!,
              image: item['image']!,
              description: item['description'] ?? '',
              rating: item['rating']?.toDouble() ?? 0.0,
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
      height: height, // This uses the dynamic height
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
                      // Rating (only show if rating > 0)
                      if (rating > 0) ...[
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
                      ],
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
