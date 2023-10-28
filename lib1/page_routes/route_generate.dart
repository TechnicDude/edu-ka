import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/provider/profile_Provider.dart';
import 'package:edukaapp/screens/GloabeSearch/globlesearch.dart';
import 'package:edukaapp/screens/MyAccount/account/accountscreen.dart';
import 'package:edukaapp/screens/MyAccount/components/aboutus.dart';
import 'package:edukaapp/screens/MyAccount/components/blog.dart';
import 'package:edukaapp/screens/MyAccount/components/contactus.dart';
import 'package:edukaapp/screens/MyAccount/components/cookiespolicy.dart';
import 'package:edukaapp/screens/MyAccount/components/feedback.dart';
import 'package:edukaapp/screens/MyAccount/components/privacypolicy.dart';
import 'package:edukaapp/screens/MyAccount/components/termsconditions.dart';
import 'package:edukaapp/screens/MyAccount/subscription.dart';
import 'package:edukaapp/screens/coursedetails/CourseDetailsScreen.dart';
import 'package:edukaapp/screens/home/components/auther/autherscreen.dart';
import 'package:edukaapp/screens/profilepage/editprofile.dart';
import 'package:edukaapp/screens/profilepage/instructureprofile.dart';
import 'package:edukaapp/screens/profilepage/profilescreen.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/screens/onboding/introscreen.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:flutter/material.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/PaymentPage/AddtoCart.dart';
import 'package:edukaapp/screens/PaymentPage/CheckoutScreen.dart';
import 'package:edukaapp/screens/PaymentPage/cartcourses.dart';
import 'package:edukaapp/screens/PaymentPage/ordercheckoutdetails.dart';
import 'package:edukaapp/screens/favorite/favoritescreen.dart';
import 'package:edukaapp/screens/change_language_screen.dart';
import 'package:edukaapp/screens/home/components/sub_categories/subcategory.dart';
import 'package:edukaapp/screens/home/home_screen.dart';
import 'package:edukaapp/screens/loginsignup/changenewpassword.dart';
import 'package:edukaapp/screens/loginsignup/changepassword.dart';
import 'package:edukaapp/screens/loginsignup/forgetpassword.dart';
import 'package:edukaapp/screens/loginsignup/login.dart';
import 'package:edukaapp/screens/loginsignup/otpverify.dart';
import 'package:edukaapp/screens/loginsignup/signup.dart';
import 'package:edukaapp/screens/myCourses/mycourse.dart';
import 'package:edukaapp/screens/notification/notification.dart';
import 'package:edukaapp/screens/onboding/onboding_screen.dart';
import 'package:edukaapp/screens/splashscreen.dart';
import 'package:provider/provider.dart';
import '../screens/home/components/Home_Cards/enrollcourse_card.dart';
import '../screens/home/components/allcourses/allcourses_screen.dart';
import '../screens/home/components/categories/allcategoriesscreen.dart';
import '../screens/home/components/popularcourse/popularcoursescreen.dart';
import '../screens/home/components/auther/autherprofiledetails.dart';
import '../screens/myCourses/components/AllCoursesWidgets/AllcourseListdetails.dart';
import '../screens/myCourses/components/ArchivedCourse/archivedCourses.dart';
import '../screens/myCourses/components/DownloadCourse/downloadedCourses.dart';
import '../screens/myCourses/components/FavoritedCourse/favoritedCourse.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = SplashScreen();
        break;

      case Routes.changeLanguageScreen:
        widgetScreen = ChangeLanguageScreen();
        break;

      case Routes.onBoardScreen:
        widgetScreen = OnbodingScreen();
        break;

      case Routes.loginScreen:
        widgetScreen = LoginScreenActivity();
        break;
      case Routes.signupScreen:
        widgetScreen = SignupScreenActivity();
        break;

      case Routes.forgetPassword:
        widgetScreen = ForgetPassword();
        break;

      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
            pagetype: args[StringFile.pagetype], email: args[StringFile.email]);
        break;

      case Routes.changenewPassword:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangenewPassword(
          userid: args[StringFile.userid],
          email: args[StringFile.email],
          otp: args[StringFile.otp],
        );
        break;

      case Routes.changePassword:
        widgetScreen = ChangePassword();
        break;

      case Routes.homePage:
        widgetScreen = HomePage();
        break;

      case Routes.allCategoriesScreen:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: AllCategoriesScreen());
        break;

      case Routes.popularCourseScreen:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: PopularCourseScreen());
        break;
      case Routes.allcoursesScreen:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: AllcoursesScreen());
        break;
      case Routes.enrollCourseCard:
        widgetScreen = EnrollCourseCard();
        break;

      case Routes.autherScreen:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: AutherScreen());
        break;

      case Routes.subcategorieScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: SubcategorieScreen(
            categoryName: args[StringFile.categoryName],
            categoryId: args[StringFile.categoryId],
            subcategory: args[StringFile.subcategory],
          ),
        );
        break;

      case Routes.allCourseListDetails:
        widgetScreen = AllCourseListDetails();
        break;

      case Routes.archivedCourse:
        widgetScreen = ArchivedCourse();
        break;

      case Routes.downloadedCourse:
        widgetScreen = DownloadedCourse();
        break;
      case Routes.favoriteCourse:
        widgetScreen = FavoriteCourse();
        break;

      case Routes.favoriteScreen:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: FavoriteScreen());
        break;

      case Routes.myCoursesScreen:
        widgetScreen = MyCoursesScreen();
        break;

      case Routes.notificationScreen:
        widgetScreen = NotificationScreen();
        break;

      case Routes.addtoCartScreen:
        widgetScreen = AddtoCartScreen();
        break;
      case Routes.cartCourses:
        widgetScreen = CartCourses();
        break;

      case Routes.checkoutScreen:
        widgetScreen = CheckoutScreen();
        break;
      case Routes.ordercheckoutdetails:
        widgetScreen = Ordercheckoutdetails();
        break;

      case Routes.entryPoint:
        widgetScreen = EntryPoint();
        break;
      case Routes.instructureProfile:
        widgetScreen = InstructureProfile();
        break;

      case Routes.instructureProfiledetails:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: InstructureProfiledetails(
            autherdetails: args[StringFile.autherdetails],
            autherName: args[StringFile.autherName],
          ),
        );
        break;

      case Routes.profileScreen:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: ProfileScreen());
        break;

      case Routes.editProfile:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: EditProfile(
              profileuserdata: args[StringFile.profileuserdata],
            ));
        break;

      case Routes.globalSearch:
        widgetScreen = GlobalSearch();
        break;

      case Routes.courseDetailsScreen:
        widgetScreen = CourseDetailsScreen();
        break;

      case Routes.accountScreen:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: AccountScreen());
        break;

      case Routes.contactus:
        widgetScreen = ContactUs();
        break;

      case Routes.cookiesPolicy:
        widgetScreen = CookiesPolicy();
        break;
      case Routes.privacyPolicy:
        widgetScreen = PrivacyPolicy();
        break;
      case Routes.termsAndCondition:
        widgetScreen = TermsAndCondition();
        break;
      case Routes.feedbacks:
        widgetScreen = Feedbacks();
        break;
      case Routes.blog:
        widgetScreen = Blog();
        break;
      case Routes.aboutUs:
        widgetScreen = AboutUs();
        break;
      case Routes.intro:
        widgetScreen = Intro();
        break;
      case Routes.ourPackage:
        widgetScreen = OurPackage();
        break;

      default:
        widgetScreen = SplashScreen();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
