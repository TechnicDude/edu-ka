import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/banner_model.dart';
import 'package:edukaapp/screens/GloabeSearch/globlesearch.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2FOnlineCoursesPakistan%2F&psig=AOvVaw12NAauudb0pQ_8mlgPrWx3&ust=1677569162409000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPigiaKWtf0CFQAAAAAdAAAAABAz",
//   'https://www.kyos.com/wp-content/uploads/2021/03/Training-Courses-laptop-shutterstock_532475893m.jpg',
// ];

class SliderScreen extends StatelessWidget {
  final List<BannerData>? bannerdata;
  const SliderScreen({Key? key, this.bannerdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(bannerdata!.length);

    return CarouselSlider.builder(
      itemCount: bannerdata!.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: APIURL.bannerimage + bannerdata![itemIndex].image!,
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
    );
  }
}

// class SliderScreen extends StatelessWidget {
//   const SliderScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.bottomCenter,
//       children: [
//         Container(
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h)),
//           child: CarouselSlider.builder(
//             itemCount: 4,
//             //
//             itemBuilder:
//                 (BuildContext context, int itemIndex, int pageViewIndex) {
//               return InkWell(
//                 child: CachedNetworkImage(
//                   imageUrl: APIURL.imageurl + bannerdata![itemIndex].image!,
//                   // imgList[2],

//                   width: 100.w,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => LoaderScreen(),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               );
//             },
//             options: CarouselOptions(
//               enlargeCenterPage: false,
//               viewportFraction: 1,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
