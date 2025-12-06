// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chowdeck_clone/constants/app_colors.dart';
import 'package:chowdeck_clone/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.myGreen,
                      ),
                      const SizedBox(width: 4),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          "Morohunbo Avenue, Ibadan",
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),

                  // Bag + Filter
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_bag),
                      const SizedBox(width: 4),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.myGreen,
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: 14,
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.tune, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1764782979306-1e489462d895?auto=format&fit=crop&w=987&q=80",
                        width: double.infinity,
                        height: 70,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey[300]),
                        errorWidget: (context, url, error) {
                          print("Error loading image: $error");
                          return Icon(Icons.error, color: Colors.red);
                        },
                      ),
                      SizedBox(height: 16),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final icons = [
                            'assets/icons/restaurant.png',
                            'assets/icons/bag.png',
                            'assets/icons/hospital.png',
                            'assets/icons/restaurant.png',
                            'assets/icons/bag.png',
                            'assets/icons/hospital.png',
                            'assets/icons/bag.png',
                            'assets/icons/restaurant.png',
                          ];

                          final colors = [
                            Color(0xFFfff1f6),
                            Color(0xFFfef3ee),
                            Color(0xFFeef4ff),
                            Color(0xFFffcdd2),
                            Color(0xFFe1bee7),
                            Color(0xFFe4fbf3),
                            Color(0xFF80cbc4),
                            Color(0xFFf4faff),
                          ];

                          final names = [
                            'Restaurants',
                            'Groceries',
                            'Pharmacies',
                            'Cafes',
                            'Bakeries',
                            'Butcheries',
                            'Florists',
                            'More',
                          ];

                          return IconCard(
                            icon: icons[index],
                            backgroundColor: colors[index],
                            iconColor: Colors.green,
                            name: names[index],
                          );
                        },
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 162, 235),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 178, 105, 224),
                                size: 50,
                              ),
                              Expanded(
                                child: Text(
                                  "Enjoy free delivery and reduced fees everyday with Chowpass",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      178,
                                      105,
                                      224,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Subscribe Now",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 1.2, // pushes beyond the padding
                          child: Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Explore',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => SizedBox(width: 3),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=987&q=80",

                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(color: Colors.grey[300]),
                                      errorWidget: (context, url, error) {
                                        print("Error loading image: $error");
                                        return Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 100,
                                  ), // limit width
                                  child: Text(
                                    'Item 7(Go) - Orogun iyansasadafddf',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow
                                        .ellipsis, // shows "..." if too long
                                    maxLines: 2, // wrap up to 2 lines
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: 5,
                          shrinkWrap: true,
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 1.2, // pushes beyond the padding
                          child: Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Favorites',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 210,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=987&q=80",

                                      width: 270,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(color: Colors.grey[300]),
                                      errorWidget: (context, url, error) {
                                        print("Error loading image: $error");
                                        return Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Item 7(Go) - Orogun iyansasadafddf',
                                    overflow: TextOverflow
                                        .ellipsis, // shows "..." if too long
                                    maxLines: 2, // wrap up to 2 lines
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.pedal_bike),
                                          SizedBox(width: 4),
                                          Text('From ₦250'),
                                          SizedBox(width: 6),
                                          Container(
                                            width: 1,
                                            height: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            'Closed',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Text('4.5(291)'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 5,
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
