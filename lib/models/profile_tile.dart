import 'package:flutter/material.dart';

class ProfileTile {
  final IconData icon;
  final String title;
  final IconData? trailingIcon;
  final String? subtitle;

  ProfileTile({required this.icon, required this.title, this.trailingIcon, this.subtitle});
}
