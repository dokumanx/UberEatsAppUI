import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uber_eats_ui/json/home_page_json.dart';
import 'package:uber_eats_ui/pages/store_details_page.dart';
import 'package:uber_eats_ui/theme/colors.dart';
import 'package:uber_eats_ui/theme/styles.dart';
import 'package:uber_eats_ui/widgets/custom_slider.dart';

import 'common_widgets.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            HomePagesServiceOptions(),
            SizedBox(
              height: 15,
            ),
            HomePageSearchSection(size),
            SizedBox(
              height: 15,
            ),
            CustomSliderWidget(
              items: List.generate(
                      3, (index) => "assets/images/slide_${index + 1}.jpg")
                  .toList(),
            ),
            HomePageCategories(
              size: size,
            ),
            SizedBox(
              height: 15,
            ),
            HomePageMenu(
              size: size,
              content: firstMenu[0],
            ),
            MenuCustomDetails(
              content: firstMenu[0],
            ),
            SizedBox(
              height: 15,
            ),
            HomePageMoreToExploreSection(
              size: size,
            ),
            HomePagePopularNearYouSection(
              size: size,
            )
          ],
        )
      ],
    );
  }
}

class HomePagePopularNearYouSection extends StatelessWidget {
  final Size size;

  const HomePagePopularNearYouSection({this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          height: 10,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15.0, bottom: 15),
          child: Text(
            "Popular Near You",
            style: customTitle,
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              popularNearYou.length,
              (index) {
                return Container(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomePageMenu(
                                size: size, content: popularNearYou[index]),
                            MenuCustomDetails(content: popularNearYou[index]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))),
      ],
    );
  }
}

class HomePageMoreToExploreSection extends StatelessWidget {
  final Size size;

  const HomePageMoreToExploreSection({this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          height: 10,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15.0, bottom: 15),
          child: Text(
            "More to explore",
            style: customTitle,
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              exploreMenu.length,
              (index) {
                return Container(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomePageMenu(
                                size: size, content: exploreMenu[index]),
                            MenuCustomDetails(
                              content: exploreMenu[index],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))),
      ],
    );
  }
}

class HomePageMenu extends StatelessWidget {
  final Size size;
  final Map content;

  const HomePageMenu({this.size, this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/store_details",
            arguments: StoreDetailPageArguments(content: content));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 160,
                  child: Hero(
                    tag: content["img_id"].toString(),
                    child: Image(
                      image: NetworkImage(
                        content["img"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SvgPicture.asset(
                    content["is_liked"]
                        ? "assets/images/loved_icon.svg"
                        : "assets/images/love_icon.svg",
                    width: 20,
                    color: white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              content["name"],
              style: customContent,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  "Sponsored",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.info,
                  size: 14,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCategories extends StatelessWidget {
  final Size size;

  const HomePageCategories({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(color: textFieldColor),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(color: white),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              children: categories.map((item) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        item["img"],
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item["name"],
                        style: customContent,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePagesServiceOptions extends StatefulWidget {
  @override
  _HomePagesServiceOptionsState createState() =>
      _HomePagesServiceOptionsState();
}

class _HomePagesServiceOptionsState extends State<HomePagesServiceOptions> {
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menu.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              activeMenu = index;
            });
          },
          child: activeMenu == index
              ? ElasticIn(
                  duration: Duration(milliseconds: 500),
                  child: HomePageMenuItem(
                    activeMenu: activeMenu,
                    index: index,
                  ))
              : HomePageMenuItem(
                  activeMenu: activeMenu,
                  index: index,
                ),
        );
      }),
    );
  }
}

class HomePageSearchSection extends StatelessWidget {
  final Size size;

  const HomePageSearchSection(this.size);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          height: 45,
          width: size.width - 70,
          decoration: BoxDecoration(
              color: textFieldColor, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/pin_icon.svg",
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "New York",
                      style: customContent,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/time_icon.svg",
                      width: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Now",
                      style: customContent,
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
                child: SvgPicture.asset("assets/images/filter_icon.svg")))
      ],
    );
  }
}

class HomePageMenuItem extends StatelessWidget {
  final int activeMenu;
  final int index;

  const HomePageMenuItem({this.activeMenu, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: activeMenu == index ? black : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(
          menu[index],
          style: TextStyle(
              fontSize: 16, color: activeMenu == index ? white : black),
        ),
      ),
    );
  }
}
