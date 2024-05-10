import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> items; // 표시할 아이템 목록 (여기서는 텍스트 리스트를 예시로 사용)
  final CarouselController controller = CarouselController(); // 컨트롤러
  final double height; // 슬라이더의 높이

  CarouselSliderWidget({
    required this.items,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            items[index],
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        );
      },
      carouselController: controller,
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        initialPage: 0,
      ),
    );
  }
}
