import 'package:flutter/material.dart';
import 'package:uber_eats_ui/pages/home_page.dart';
import 'package:uber_eats_ui/pages/store_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: (settings) {
        StoreDetailPageArguments args = settings.arguments;

        switch (settings.name) {
          case "/store_details":
            return MaterialPageRoute(
                builder: (_) => StoreDetailPage(
                      content: args.content,
                    ));
        }
        return MaterialPageRoute(builder: (_) => HomePage());
      },
    );
  }
}
