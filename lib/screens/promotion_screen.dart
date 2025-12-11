import 'package:chowdeck_clone/constants/app_colors.dart';
import 'package:chowdeck_clone/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../providers/nav_provider.dart';

class PromotionScreen extends ConsumerWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leadingWidth: 200,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_backspace, size: 28),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 4),
              const Text("Promotions", style: TextStyles.pageTitle),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.confirmation_num_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 20.0,
                ),
                hintText: 'Enter promotion code',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle apply promotion code action
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Redeem Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),
            Text('Your available promos', style: TextStyles.sectionTitle),
            const SizedBox(height: 30),
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.myGreen,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'N500 off',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'on orders above N2,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        const Icon(
                          Icons.local_offer,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 65,
                    // width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 32, 111, 90),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Valid untill:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '31 Dec 2024',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Usage',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          onTap: (i) {
            ref.read(bottomNavProvider.notifier).state = i;
            if (i == 0) {
              // Navigate to MainScreen and set index to Home (0)
              Navigator.of(context).pushReplacementNamed('/main');
            } else {
              // For other tabs, navigate to MainScreen and set the index
              ref.read(bottomNavProvider.notifier).state = i;
              Navigator.of(context).pushReplacementNamed('/main');
            }
          },
          selectedItemColor: AppColors.myGreen,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
          enableFeedback: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.house,
                color: index == 0 ? AppColors.myGreen : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.search,
                color: index == 1 ? AppColors.myGreen : Colors.grey,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.handbag,
                color: index == 2 ? AppColors.myGreen : Colors.grey,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LucideIcons.messageCircleMore,
                color: index == 3 ? AppColors.myGreen : Colors.grey,
              ),
              label: "Support",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/profile.png", width: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
