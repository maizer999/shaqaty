import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/user_managment/home/widgets/app_theme.dart';
import 'package:flutter_core/user_managment/home/widgets/category_widget_home.dart';
import 'package:flutter_core/user_managment/home/widgets/home_sections_adapter.dart';
import 'package:flutter_core/user_managment/home/widgets/no_internet.dart';
import 'package:flutter_core/user_managment/home/widgets/slider_widget.dart';
import 'package:flutter_core/user_managment/home/widgets/something_went_wrong.dart';
import 'package:http/http.dart' as http;

import '../../widgets/shimmer_loading_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> _homeData;

  @override
  void initState() {
    super.initState();
    _homeData = fetchHomeData();
  }

  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      final location = "default_location"; // you can replace with HiveUtils.getLocationV2()
      final response = await http.get(Uri.parse('https://your-api.com/home?location=$location'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load home data');
      }
    } catch (e) {
      throw Exception('No Internet or Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.color.primaryColor,
        body: FutureBuilder<Map<String, dynamic>>(
          future: _homeData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return shimmerEffect();
            } else if (snapshot.hasError) {
              if (snapshot.error.toString().contains('No Internet')) {
                return NoInternet(onRetry: () {
                  setState(() {
                    _homeData = fetchHomeData();
                  });
                });
              }
              return const SomethingWentWrong();
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return homeScreenContent(data);
            } else {
              return const SomethingWentWrong();
            }
          },
        ),
      ),
    );
  }

  Widget homeScreenContent(Map<String, dynamic> data) {
    final sections = data['sections'] ?? [];
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        const SliderWidget(),
        const SizedBox(height: 20),
        const CategoryWidgetHome(),
        ...sections.map((section) => HomeSectionsAdapter(section: section)).toList(),
      ],
    );
  }

  Widget shimmerEffect() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomShimmer(height: 52, width: double.maxFinite, borderRadius: 10),
          const SizedBox(height: 12),
          CustomShimmer(height: 170, width: double.maxFinite, borderRadius: 10),
          const SizedBox(height: 12),
          CustomShimmer(height: 214, width: double.maxFinite, borderRadius: 10),
        ],
      ),
    );
  }
}
