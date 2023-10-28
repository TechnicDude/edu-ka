import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/likeapi.dart';
import 'package:edukaapp/model/api_models/favorite_model.dart';
import 'package:edukaapp/provider/favorite_Provider.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/dialog_helper.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../localization/Language/languages.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteProvider favoriteProvider = FavoriteProvider();

  get i => null;

  @override
  void initState() {
    // TODO: implement initState
    favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    favoriteProvider.favoritelist();

    super.initState();
  }

  bool isPressed = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  bool searchshow = false;

  List<FavoriteData> bottomlist = [];
  bool datashow = false;

  Future fetchdata() async {
    bottomlist = [];
    for (int i = 0; i < favoriteProvider.favoriteList.length; i++) {
      if (favoriteProvider.favoriteList[i].bundleId!
          .toLowerCase()
          .contains(searchString.toLowerCase())) {
        bottomlist.add(favoriteProvider.favoriteList[i]);
      }
    }

    datashow = true;
    return bottomlist;
  }

  Future dislike(String id) async {
    LikeApi _likeapi = new LikeApi();
    final response = await _likeapi.disfav(id);
    await favoriteProvider.favoritelist();

    DialogHelper.showFlutterToast(strMsg: "Favorite removed successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 2.w,
              ),
              Text(Languages.of(context)!.favoritecourse,
                  // "Favorite Course",
                  style: AppStyle.mytexttitle),
              InkWell(child: Icon(Icons.shopping_cart_outlined)),
            ],
          ),
        ),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : Consumer<FavoriteProvider>(
                builder: (context, favoriterecipeProvider, child) {
                return SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 1.5.h, right: 1.5.h, bottom: 2.h),
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: favoriteProvider.favoriteList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 0.5.h),
                                  child: InkWell(
                                    child: Container(
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(0.2.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 8.h,
                                                      width: 8.h,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    1.h)),
                                                        child:
                                                            NetWorkImageScreen(
                                                          image: (APIURL
                                                                  .bannerimage +
                                                              favoriteProvider
                                                                  .favoriteList[
                                                                      index]
                                                                  .webinar!
                                                                  .imageCover!),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 50.w,
                                                      child: Text(
                                                          favoriteProvider
                                                              .favoriteList[
                                                                  index]
                                                              .webinar!
                                                              .translations![
                                                                  index]
                                                              .title!,
                                                          maxLines: 2,
                                                          style: AppStyle
                                                              .textcatsubtitle
                                                              .copyWith(
                                                                  fontSize:
                                                                      15.sp)),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    SizedBox(
                                                      width: 50.w,
                                                      child: Text(
                                                          favoriteProvider
                                                              .favoriteList[
                                                                  index]
                                                              .webinar!
                                                              .price!
                                                              .toString(),
                                                          maxLines: 1,
                                                          style: AppStyle
                                                              .textsubsubtitle),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .video_call_outlined,
                                                          size: 2.h,
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        Text(
                                                            favoriteProvider
                                                                .favoriteList[
                                                                    index]
                                                                .webinar!
                                                                .status!,
                                                            //"378 lectures",
                                                            maxLines: 1,
                                                            style: AppStyle
                                                                .textsubsubtitle),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                dislike(favoriteProvider
                                                    .favoriteList[index].id
                                                    .toString());
                                              },
                                              icon: Icon(Icons.favorite),
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )),
                );
              }));
  }
}

// import 'package:edukaapp/api/api.dart';
// import 'package:edukaapp/api/likeapi.dart';
// import 'package:edukaapp/model/api_models/favorite_model.dart';
// import 'package:edukaapp/provider/favorite_Provider.dart';
// import 'package:edukaapp/utils/appimages.dart';
// import 'package:edukaapp/utils/appcolors.dart';
// import 'package:edukaapp/utils/appstyle.dart';
// import 'package:edukaapp/utils/dialog_helper.dart';
// import 'package:edukaapp/utils/loaderscreen.dart';
// import 'package:edukaapp/utils/networkimages.dart';
// import 'package:edukaapp/utils/no_internetconnection.dart';
// import 'package:edukaapp/utils/nodatafoundscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   FavoriteProvider favoriteProvider = FavoriteProvider();

//   get i => null;

//   @override
//   void initState() {
//     // TODO: implement initState
//     favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
//     favoriteProvider.favoritelist();

//     super.initState();
//   }

//   bool isPressed = false;
//   TextEditingController sercheditcontroler = TextEditingController();
//   String searchString = '';
//   bool searchshow = false;

//   List<FavoriteData> favoritelist = [];
//   bool datashow = false;

//   Future fetchdata() async {
//     favoritelist = [];
//     for (int i = 0; i < favoriteProvider.favoriteList.length; i++) {
//       if (favoriteProvider.favoriteList[i].bundleId!
//           .toLowerCase()
//           .contains(searchString.toLowerCase())) {
//         favoritelist.add(favoriteProvider.favoriteList[i]);
//       }
//     }

//     datashow = true;
//     return favoritelist;
//   }

//   Future dislike(String id) async {
//     LikeApi _likeapi = new LikeApi();
//     final response = await _likeapi.disfav(id);
//     await favoriteProvider.favoritelist();

//     DialogHelper.showFlutterToast(strMsg: "Favorite removed successfully");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white.withOpacity(0.95),
//         appBar: AppBar(
//           iconTheme: IconThemeData(
//             color: AppColors.colorBlack,
//           ),
//           backgroundColor: Colors.white.withOpacity(0.95),
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: 2.w,
//               ),
//               Text("Favorite Course", style: AppStyle.mytexttitle),
//               InkWell(child: Icon(Icons.shopping_cart_outlined)),
//             ],
//           ),
//         ),
//         body:
//             Provider.of<InternetConnectionStatus>(context) ==
//                     InternetConnectionStatus.disconnected
//                 ? InternetNotAvailable()
//                 : Consumer<FavoriteProvider>(
//                     builder: (context, favoriteProvider, child) {
//                     return SingleChildScrollView(
//                       child: Padding(
//                           padding: EdgeInsets.only(
//                               left: 1.5.h, right: 1.5.h, bottom: 2.h),
//                           child: Column(
//                             children: [

//                               if (!favoriteProvider.datanotfound)
//                                 SizedBox(
//                                     height: 80.h,
//                                     child: Center(child: LoaderScreen())),
//                               if (favoriteProvider.datanotfound)
//                                 if (favoriteProvider.favoriteList.isEmpty)
//                                   NoDataFoundErrorScreens(),
//                               if (favoriteProvider.datanotfound)
//                                 if (favoriteProvider.favoriteList.isNotEmpty)
//                                   FutureBuilder(
//                                       future: fetchdata(),
//                                       builder: (context, snapshot) {
//                                         print(datashow);
//                                         if (snapshot.hasData && datashow) {
//                                           if (favoritelist.isEmpty)
//                                             NoDataFoundErrorScreens();

//                                           return ListView.builder(
//                                               itemCount: favoriteProvider
//                                                   .favoriteList.length,
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               physics:
//                                                   const PageScrollPhysics(),
//                                               itemBuilder: (context, index) {
//                                                 return Padding(
//                                                   padding: EdgeInsets.only(
//                                                       top: 1.h, bottom: 0.5.h),
//                                                   child: InkWell(
//                                                     child: Container(
//                                                       height: 10.h,
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(1.h),
//                                                       ),
//                                                       child: Padding(
//                                                         padding: EdgeInsets.all(
//                                                             0.2.h),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Column(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .start,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .start,
//                                                                   children: [
//                                                                     SizedBox(
//                                                                       height:
//                                                                           8.h,
//                                                                       width:
//                                                                           8.h,
//                                                                       child:
//                                                                           ClipRRect(
//                                                                         borderRadius:
//                                                                             BorderRadius.all(Radius.circular(2.h)),
//                                                                         child:
//                                                                             NetWorkImageScreen(
//                                                                           image:
//                                                                               (APIURL.bannerimage + favoriteProvider.favoriteList[index].webinar!.imageCover!),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 3.w,
//                                                                 ),
//                                                                 Column(
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .start,
//                                                                   children: [
//                                                                     SizedBox(
//                                                                       width:
//                                                                           50.w,
//                                                                       child: Text(
//                                                                           favoriteProvider
//                                                                               .favoriteList[
//                                                                                   index]
//                                                                               .webinar!
//                                                                               .translations![
//                                                                                   index]
//                                                                               .title!,
//                                                                           maxLines:
//                                                                               2,
//                                                                           style: AppStyle
//                                                                               .textcatsubtitle
//                                                                               .copyWith(fontSize: 15.sp)),
//                                                                     ),
//                                                                     SizedBox(
//                                                                       height:
//                                                                           0.5.h,
//                                                                     ),
//                                                                     SizedBox(
//                                                                       width:
//                                                                           50.w,
//                                                                       child: Text(
//                                                                           favoriteProvider
//                                                                               .favoriteList[
//                                                                                   index]
//                                                                               .webinar!
//                                                                               .price!
//                                                                               .toString(),
//                                                                           maxLines:
//                                                                               1,
//                                                                           style:
//                                                                               AppStyle.textsubsubtitle),
//                                                                     ),
//                                                                     SizedBox(
//                                                                       height:
//                                                                           0.5.h,
//                                                                     ),
//                                                                     Row(
//                                                                       children: [
//                                                                         Icon(
//                                                                           Icons
//                                                                               .video_call_outlined,
//                                                                           size:
//                                                                               2.h,
//                                                                         ),
//                                                                         SizedBox(
//                                                                           width:
//                                                                               1.w,
//                                                                         ),
//                                                                         Text(
//                                                                             favoriteProvider.favoriteList[index].webinar!.status!,
//                                                                             //"378 lectures",
//                                                                             maxLines: 1,
//                                                                             style: AppStyle.textsubsubtitle),
//                                                                       ],
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             IconButton(
//                                                               onPressed: () {
//                                                                 dislike(favoriteProvider
//                                                                     .favoriteList[
//                                                                         index]
//                                                                     .id
//                                                                     .toString());
//                                                               },
//                                                               icon: Icon(Icons
//                                                                   .favorite),
//                                                               color: Colors.red,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 );
//                                               });
//                                         } else {
//                                           return NoDataFoundErrorScreens();
//                                         }
//                                       }),
//                               SizedBox(
//                                 height: 4.h,
//                               ),
//                             ],
//                           )),
//                     );
//                   }));
//   }
// }
