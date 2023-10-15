import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/app_color.dart';

class CustomerSupportScreen extends StatelessWidget {
  CustomerSupportScreen({super.key});

  final Uri _url = Uri.parse("https://oneclickflowers.com");

  Future<void> _launch() async{
    if(!await launchUrl(_url)){
      throw Exception("Could not launch url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.light,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        CircleAvatar(
                          child:
                              Icon(Icons.phone_rounded, color: AppColor.light),
                          backgroundColor: Colors.greenAccent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Call",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.message,
                            color: AppColor.light,
                          ),
                          backgroundColor: Colors.orangeAccent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Support",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.facebook_rounded),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Facebook",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height:10,),
            const ListTile(
              leading: Icon(Icons.place_rounded),
              title: Text("Address : No 40 Baria Sreet 133/2 NewYork City"),
            ),
            const ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text("info@oneclickflower.com"),
            ),
            InkWell(
              onTap: _launch,
              child: const ListTile(
                leading: Icon(Icons.web_rounded),
                title: Text("www.oneclickflowers.com"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
