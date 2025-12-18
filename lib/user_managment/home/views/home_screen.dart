import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Grid Demo',
      home: const HomeScreen(),
    );
  }
}

class ApiUrls {
  static const String base = "https://admin.shaqaty.com/api";
  static const String slider = "$base/get-slider";
  static const String categories = "$base/get-categories";
  static const String featured = "$base/get-featured-section";
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> homeFuture;

  @override
  void initState() {
    super.initState();
    homeFuture = fetchHomeData();
  }

  Future<Map<String, dynamic>> fetchHomeData() async {
    const lat = 23.232639;
    const lng = 69.6415341;

    final responses = await Future.wait([
      http.get(Uri.parse(ApiUrls.slider)),
      http.get(Uri.parse("${ApiUrls.categories}?page=1")),
      http.get(Uri.parse(
        "${ApiUrls.featured}?latitude=$lat&longitude=$lng&radius=0",
      )),
    ]);

    if (responses.any((e) => e.statusCode != 200)) {
      throw Exception("API failed");
    }

    return {
      "sliders": jsonDecode(responses[0].body)["data"] ?? [],
      "categories": jsonDecode(responses[1].body)["data"]["data"] ?? [],
      "sections": jsonDecode(responses[2].body)["data"] ?? [],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: homeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text("Something went wrong"));
          }

          final data = snapshot.data!;
          final sliders = data["sliders"];
          final categories = data["categories"];
          final sections = data["sections"];

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              // Sliders
              if (sliders.isNotEmpty)
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    itemCount: sliders.length,
                    itemBuilder: (context, index) {
                      final slider = sliders[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          slider["image"],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),

              // Categories in Grid
              if (categories.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1, // square
                  ),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              cat["image"],
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cat["name"],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    );
                  },
                ),
              const SizedBox(height: 20),

              // Sections in Grid
              ...sections.map<Widget>((section) {
                final title = section["title"] ?? "";
                final items = section["items"] ?? [];
                if (items.isEmpty) return const SizedBox();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  item["image"],
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item["name"] ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
