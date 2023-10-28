import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  "https://hubskills.com/wp-content/uploads/online-course-video-must-be-6-12-minutes.png",
  "https://hubskills.com/wp-content/uploads/online-course-video-must-be-6-12-minutes.png",
];

class VideoSliderScreen extends StatelessWidget {
  const VideoSliderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h)),
      child: CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return InkWell(
            onTap: () {},
            child: CachedNetworkImage(
              imageUrl: imgList[2],
              width: 100.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => LoaderScreen(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: false,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
