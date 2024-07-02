import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      "assets/images/e.jpg",
      "assets/images/a.jpg",
      "assets/images/c.jpg",
      "assets/images/b.jpg",
      "assets/images/d.jpg",
      
    ];
    return CarouselSlider(
      items: imagePaths.map((imagePath) {
        return Container(
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 600),
        viewportFraction: 0.8,
      ),
    );
  }
}
