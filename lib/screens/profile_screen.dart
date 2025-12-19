import 'package:chowdeck_clone/constants/text_styles.dart';
import 'package:chowdeck_clone/models/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileTile> listTiles = [
      ProfileTile(icon: Icons.person, title: 'Personal Details'),
      ProfileTile(icon: Icons.location_on, title: 'Addresses'),
      ProfileTile(icon: Icons.star_border_rounded, title: 'Chowpass', subtitle: 'You could have saved 2000 this month'),
      ProfileTile(icon: Icons.wallet, title: 'Wallet'),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.all(26.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  child: Image.asset('assets/icons/profile.png'),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Sinmiloluwa Oloyede',
                  style: TextStyles.sectionTitle,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 2),
                          Text('422'),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.white),
                          SizedBox(width: 2),
                          Text('422', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 231, 231),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Transform.translate(
                        offset: const Offset(0, -20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 147, 108, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                '9880952323',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 2),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(color: Colors.grey),
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Paystack-Titan',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.copy, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Personal', style: TextStyles.sectionTitle),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listTiles.length,
                      itemBuilder: (context, index) {
                        return _buildListTile(listTiles[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListTile(ProfileTile tile) {
  return Container(
    color: Colors.white,
    child: ListTile(
      leading: Icon(
        tile.icon,
        color: tile.icon == Icons.star_border_rounded ? Colors.deepPurpleAccent : Colors.grey[700],
      ),
      title: Text(tile.title),
      subtitle: tile.subtitle != null
          ? _highlightNumber(tile.subtitle!)
          : null,
      trailing: tile.trailingIcon != null
          ? Icon(tile.trailingIcon)
          : const Icon(Icons.arrow_forward_ios, size: 16),
    ),
  );
}

Widget _highlightNumber(String text) {
  final regex = RegExp(r'(\d+)'); 
  final match = regex.firstMatch(text);

  if (match == null) return Text(text, style: TextStyle(color: Colors.grey[700]));

  final number = int.tryParse(match.group(0)!) ?? 0;
  final formattedNumber = '₦${NumberFormat("#,##0").format(number)}';

  final start = match.start;
  final end = match.end;

  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: text.substring(0, start),
          style: TextStyle(color: Colors.grey[700]),
        ),
        TextSpan(
          text: formattedNumber,
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: text.substring(end),
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    ),
  );
}
