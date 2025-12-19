import 'package:chowdeck_clone/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  static const lists = [
    'All',
    'Restaurants',
    'Shops',
    'Pharmacies',
    'Local Markets',
  ];

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  final categories = [
    'Pastries',
    'Healthy',
    'Breakfast',
    'Pizza',
    'Soups',
    'Spaghetti',
    'Rice',
    'Shawarma',
    'Asian',
    'Mexican',
  ];

  // Mock data for restaurants
  final restaurants = [
    {
      'name': 'Pizza Palace',
      'rating': 4.5,
      'reviews': 234,
      'deliveryTime': '30-45 mins',
      'deliveryFee': 'N500',
    },
    {
      'name': 'Burger Barn',
      'rating': 4.2,
      'reviews': 156,
      'deliveryTime': '20-30 mins',
      'deliveryFee': 'N300',
    },
    {
      'name': 'Sushi Haven',
      'rating': 4.8,
      'reviews': 389,
      'deliveryTime': '35-50 mins',
      'deliveryFee': 'N800',
    },
    {
      'name': 'Taco Fiesta',
      'rating': 4.3,
      'reviews': 198,
      'deliveryTime': '25-35 mins',
      'deliveryFee': 'N400',
    },
  ];

  // Mock data for shops
  final shops = [
    {
      'name': 'Fashion Hub',
      'rating': 4.1,
      'reviews': 145,
      'deliveryTime': '1-2 hours',
      'deliveryFee': 'N1000',
    },
    {
      'name': 'Electronics Store',
      'rating': 4.6,
      'reviews': 312,
      'deliveryTime': '2-3 hours',
      'deliveryFee': 'N1500',
    },
    {
      'name': 'Home Decor Plus',
      'rating': 3.9,
      'reviews': 87,
      'deliveryTime': '1.5-2 hours',
      'deliveryFee': 'N800',
    },
  ];

  // Mock data for pharmacies
  final pharmacies = [
    {
      'name': 'MediCare Pharmacy',
      'rating': 4.7,
      'reviews': 267,
      'deliveryTime': '15-30 mins',
      'deliveryFee': 'N200',
    },
    {
      'name': 'HealthFirst Pharmacy',
      'rating': 4.4,
      'reviews': 198,
      'deliveryTime': '20-35 mins',
      'deliveryFee': 'N300',
    },
    {
      'name': 'Quick Relief Pharmacy',
      'rating': 4.5,
      'reviews': 156,
      'deliveryTime': '10-20 mins',
      'deliveryFee': 'N250',
    },
  ];

  // Mock data for local markets
  final localMarkets = [
    {
      'name': 'Lekki Market',
      'rating': 4.0,
      'reviews': 423,
      'deliveryTime': '45-60 mins',
      'deliveryFee': 'N500',
    },
    {
      'name': 'Ikeja Market',
      'rating': 3.8,
      'reviews': 356,
      'deliveryTime': '50-70 mins',
      'deliveryFee': 'N600',
    },
    {
      'name': 'Lagos Island Market',
      'rating': 4.2,
      'reviews': 289,
      'deliveryTime': '40-55 mins',
      'deliveryFee': 'N550',
    },
  ];

  Widget _buildCategoryList(List<Map<String, dynamic>> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${item['rating']} (${item['reviews']})',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${item['deliveryTime']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Text(
                      'Delivery: ${item['deliveryFee']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMoreCategoriesList(List<Map<String, dynamic>> items) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Icon(Icons.tag)),
            ),
          ),
        );
      },
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Food, drinks, groceries',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isActive = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          if (index > 0) {
                            _slideController.forward(from: 0.0);
                          }
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.black : Colors.transparent,
                            border: isActive ? null : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              lists[index],
                              style: TextStyle(
                                color: isActive ? Colors.white : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: lists.length,
                  ),
                ),
                const SizedBox(height: 24),
                Divider(),
                Text('Categories', style: TextStyles.sectionTitle),
                const SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(child: Icon(Icons.tag)),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                if (selectedIndex == 1)
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _slideController,
                      child: _buildCategoryList(restaurants),
                    ),
                  )
                else if (selectedIndex == 2)
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _slideController,
                      child: _buildCategoryList(shops),
                    ),
                  )
                else if (selectedIndex == 3)
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _slideController,
                      child: _buildCategoryList(pharmacies),
                    ),
                  )
                else if (selectedIndex == 4)
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _slideController,
                      child: _buildCategoryList(localMarkets),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
