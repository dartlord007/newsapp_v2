

import 'dart:convert';

import 'package:newsapp_v2/models/slider_model.dart';

// class Sliders {
//   List<sliderModel> sliders = [];

//   Future<void> getSlider() async {
//     String url =
//         "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8eb940539c874fa98a2050d4afde5d5b";
//     var response = await http.get(Uri.parse(url));

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == 'ok') {
//       jsonData["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element['description'] != null) {
//           sliderModel slidermodel = sliderModel(
//             title: element["title"],
//             description: element["description"],
//             url: element["url"],
//             urlToImage: element["urlToImage"],
//             content: element["content"],
//             author: element["author"],
//           );
//           sliders.add(slidermodel);
//         }
//       });
//     }
//   }
// }

List<sliderModel> getSliders() {
  List<sliderModel> slider = [];
  sliderModel categoryModel = sliderModel();

  categoryModel.name = "Business";
  categoryModel.image = "images/business.jpg";
  slider.add(categoryModel);
  categoryModel = sliderModel();

  categoryModel.name = "Entertainment";
  categoryModel.image = "images/entertainment.jpg";
  slider.add(categoryModel);
  categoryModel = sliderModel();

  categoryModel.name = "General";
  categoryModel.image = "images/general.jpg";
  slider.add(categoryModel);
  categoryModel = sliderModel();

  categoryModel.name = "Health";
  categoryModel.image = "images/health.jpg";
  slider.add(categoryModel);
  categoryModel = sliderModel();

  categoryModel.name = "Sports";
  categoryModel.image = "images/sport.jpg";
  slider.add(categoryModel);
  categoryModel = sliderModel();

  return slider;
}

