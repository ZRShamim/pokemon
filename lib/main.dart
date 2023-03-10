import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_api/components/colors/custom_color.dart';
import 'package:poke_api/components/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: 'App Name',
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
          primaryColor: CustomColor.mainBG,
          backgroundColor: CustomColor.mainBG,
          textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
          appBarTheme: const AppBarTheme(
            color: CustomColor.mainBG,
            elevation: 0,
          ),
        ),
        navigatorKey: Get.key,
        initialRoute: Routes.pokedexScreen,
        getPages: Routes.routeList,
      ),
    );
  }
}
