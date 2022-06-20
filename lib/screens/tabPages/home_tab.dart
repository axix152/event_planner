import 'package:event_planner/global.dart';
import 'package:event_planner/screens/categories/details_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/myDrawer.dart';
import '../categories/categoryItem.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final _dbref = FirebaseDatabase.instance.ref().child("serviceProvider");
  @override
  Widget build(BuildContext context) {
    var data = _dbref.orderByKey();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Event Planner"),
          centerTitle: true,
        ),
        drawer: MyDrawer(
          name: userModel!.name,
          email: userModel!.email,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: data.onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Failed To load data"),
                  );
                }
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  Map extractedData = snapshot.data.snapshot.value;
                  List item = [];
                  extractedData.forEach(
                      (index, snap) => item.add({"key": index, ...snap}));
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10.h),
                      itemCount: extractedData.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (ctx, i) => GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(
                            title: item[i]['details']['Title'],
                            price: item[i]['details']['Price'],
                            description: item[i]['details']['Description'],
                            name: item[i]['name'],
                            phone: item[i]['phone'],
                            image: item[i]['details']['Url'],
                            id: item[i]['id'],
                            email: item[i]['email'],
                          ));
                        },
                        child: CategoryItem(
                          title: item[i]['details']['Title'],
                          image: item[i]['details']['Url'],
                          price: item[i]['details']['Price'],
                        ),
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
