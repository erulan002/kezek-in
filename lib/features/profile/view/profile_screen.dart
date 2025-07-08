import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kezek_in/core/const/images.dart';
import 'package:kezek_in/features/profile/view/classes/profile_item.dart';
import 'package:kezek_in/navigation/route_names.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<ProfileItem> profileItems = [
    ProfileItem(
      title: 'Log In',
      onTap: (context) => context.push(RouteNames.singIn),
      icon: Icons.person,
    ),
    ProfileItem(
      title: 'Edit Profile',
      onTap: (context) => context.push(RouteNames.singIn),
      icon: Icons.edit,
    ),
    ProfileItem(
      title: 'Settings',
      onTap: (context) => context.push(RouteNames.singIn),
      icon: Icons.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: 150,
                  child: ClipOval(
                    child: Image.asset(
                      AppImages.malePortraitProfile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: IconButton(
                    color: Colors.grey.withOpacity(0.1),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                itemCount: profileItems.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final item = profileItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      onTap: () => item.onTap(context),
                      title: Text(item.title),
                      leading: Icon(item.icon, color: Colors.teal),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                      ),
                      tileColor: Colors.grey.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(onPressed: () {

                    FirebaseAuth.instance.signOut();
                    context.go(RouteNames.singIn);
              }, child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text('Log Out'),
                ],
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
