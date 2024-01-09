import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_v2/models/category_model.dart';
import 'package:newsapp_v2/models/slider_model.dart';
import 'package:newsapp_v2/services/data.dart';
import 'package:newsapp_v2/services/slider_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = getCategories();
  List<sliderModel> slider = getSliders();
  @override
  void initState() {
    categories = getCategories();
    slider = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dart",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            SizedBox(
              width: 1,
            ),
            Text(
              "News!",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image,
                    categoryName: categories[index].categoryName,
                  );
                },
                itemCount: categories.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
                itemCount: slider.length,
                itemBuilder: (context, index, realIndex) {
                  String? res = slider[index].image;
                  String? res1 = slider[index].name;
                  return buildImage(res!, index, res1!);
                },
                options: CarouselOptions(
                    height: 220,
                    // viewportFraction:1,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height))
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 7.5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
    ),
  );
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, this.image, this.categoryName});
  final image, categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset(image, width: 120, height: 70, fit: BoxFit.cover),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              categoryName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
