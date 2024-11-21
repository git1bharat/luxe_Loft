import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe_loft/utill/luxe_color.dart';
import 'package:luxe_loft/utill/luxe_typography.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(child: Image.asset('assets/icons/menu_icon.png')),
        title: Padding(
          padding: EdgeInsets.only(left: 80.w),
          child: Image.asset(
            'assets/images/logo.png',
            width: 60.w,
            height: 60.h,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 5.w,
                ),
                Image.asset('assets/icons/scan.png')
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Column(
                  children: [
                    Text('Hi,Andrea'),
                    Text(
                      'What are you looking for today?',
                      style: LuxeTypo.displayLarge,
                    ),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            _buildFlashCover(
                'https://images.unsplash.com/5/unsplash-kitsune-4.jpg?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bc01c83c3da0425e9baa6c7a9204af81'),
            const SizedBox(
                width: 390,
                height: 60,
                child: Center(
                    child: Text('Cellphone   Grocery   cosmatic  clothes'))),
            const SizedBox(
              height: 15,
            ),
            _buildGridItemList(
                'https://images.unsplash.com/5/unsplash-kitsune-4.jpg?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bc01c83c3da0425e9baa6c7a9204af81',
                'mobile')
          ],
        ),
      ),
    );
  }
}

Widget _buildGridItemList(String image, String productName) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: LuxeColors.brandSecondry),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      width: 60.w,
      height: 70.h,
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Same radius as the container
        child: Image.network(
          image,
        ),
      )));
}

Widget _buildFlashCover(String imageUrl) {
  return Container(
    width: 450,
    height: 230,
    decoration: const BoxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image Section
        ClipRRect(
          child: Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == 0 ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == 0 ? LuxeColors.brandSecondry : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    ),
  );
}

Widget _buildTabScreen() {
  return DefaultTabController(
    initialIndex: 1,
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: <Widget>[
            Tab(
              child: Text('cellphone'),
            ),
            Tab(
              child: Text('Grocery'),
            ),
            Tab(
              child: Text('cosmatic'),
            ),
          ],
        ),
      ),
      body: const TabBarView(
        children: <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    ),
  );
}

Widget _buildList(List<String> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(items[index]),
        leading: const Icon(Icons.list),
      );
    },
  );
}
