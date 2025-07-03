import 'package:flutter/cupertino.dart';

class ProfileItem {
  final String title;
  final void Function(BuildContext context) onTap;
  final IconData icon;

  ProfileItem({required this.title, required this.onTap, required this.icon});
}
