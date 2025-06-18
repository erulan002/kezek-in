import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kezek_in/core/const/images.dart';
import 'package:kezek_in/navigation/route_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          context.go(RouteNames.logIn);
                          break;
                        case 1:
                          break;
                        case 2:
                          break;
                        case 3:
                          break;
                        case 4:
                          break;
                      }
                    },

                    title: Text('data'),
                    leading: Icon(Icons.person, color: Colors.teal),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    tileColor: Colors.grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
