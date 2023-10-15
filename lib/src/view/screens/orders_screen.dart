import '../../../core/app_color.dart';
import '../widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My Orders",
        style: Theme.of(context).textTheme.displayLarge,
      ),
      iconTheme: const IconThemeData(color: AppColor.secondary),
      bottom: TabBar(
        indicatorColor: AppColor.dark,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(13), color: AppColor.primary),
        tabs: const <Widget>[
          Tab(
            child: Text("All",style: TextStyle(color: AppColor.dark),),
          ),
          Tab(
            child: Text("To pay",style: TextStyle(color: AppColor.dark),),
          ),
          Tab(
            child: Text("To ship",style: TextStyle(color: AppColor.dark),),
          ),
          Tab(
            child: Text("To recieve",style: TextStyle(color: AppColor.dark),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: _appBar(context),
        ));
  }
}
