import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Offers",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context,index){
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.tertiary
                  ),
                  child: const Center(child: Text("Offers Banner",))
              );
            }
        ),
      ),
    );
  }
}
