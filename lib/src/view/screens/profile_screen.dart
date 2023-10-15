import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundColor: AppColor.tertiary,
              child: Icon(
                Icons.person_rounded,
                size: 120,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Hello Sina",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10,),
            Text(
              "sina@gmail.com",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Divider(),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.password_rounded,
                  color: AppColor.primary,
                ),
              ),
              title: Text(
                "Change Password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.primary,
              ),
            ),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.wallet_rounded,
                  color: AppColor.primary,
                ),
              ),
              title: Text(
                "Billing Details",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.primary,
              ),
            ),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.manage_accounts_rounded,
                  color: AppColor.primary,
                ),
              ),
              title: Text(
                "User Management",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.primary,
              ),
            ),
            Divider(),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColor.primary,
                ),
              ),
              title: Text(
                "Information",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.primary,
              ),
            ),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.logout_rounded,
                  color: AppColor.primary,
                ),
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
