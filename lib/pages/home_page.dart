import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uber_eats_ui/json/home_page_json.dart';
import 'package:uber_eats_ui/theme/colors.dart';
import 'package:uber_eats_ui/theme/styles.dart';
import 'package:uber_eats_ui/widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(_size),
    );
  }

  Widget getBody(Size size) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(menu.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeMenu = index;
                    });
                  },
                  child: _activeMenu == index
                      ? ElasticIn(
                          duration: Duration(milliseconds: 500),
                          child: _getMenuItem(index))
                      : _getMenuItem(index),
                );
              }),
            ),
            SizedBox(
              height: 15,
            ),
            _getSearchSection(size),
            SizedBox(
              height: 15,
            ),
            CustomSliderWidget(
              items: List.generate(
                      3, (index) => "assets/images/slide_${index + 1}.jpg")
                  .toList(),
            ),
            getCategories(size),
            SizedBox(
              height: 15,
            ),
            getMenu(size, contents: firstMenu[0]),
            getFirstMenuDetails(),
            SizedBox(
              height: 15,
            ),
            getMoreToExplore(size),
            getPopularNearYou(size)
          ],
        )
      ],
    );
  }

  Column getPopularNearYou(Size size) {
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
                        padding: EdgeInsets.only(bottom: 50),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getMenu(size, contents: exploreMenu[index]),
                            getMenuDetails(index, contents: popularNearYou),
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

  Column getMoreToExplore(Size size) {
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
                        padding: EdgeInsets.only(bottom: 50),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getMenu(size, contents: exploreMenu[index]),
                            getMenuDetails(index, contents: exploreMenu),
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

  Container getMenu(Size size, {Map<String, dynamic> contents}) {
    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 160,
                  child: Image(
                    image: NetworkImage(
                      contents["img"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SvgPicture.asset(
                    contents["is_liked"]
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
              contents["name"],
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
            Text(
              contents["description"],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Row getMenuDetails(int index, {@required List contents}) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: customIconContainerStyle,
          child: Icon(
            LineIcons.hourglass_half,
            size: 20,
            color: primary,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: customIconContainerStyle,
          child: Text(contents[index]["time"]),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: customIconContainerStyle,
          child: Row(
            children: [
              Text(contents[index]["rate"]),
              SizedBox(
                width: 5,
              ),
              Icon(
                LineIcons.star,
                size: 15,
                color: yellowStar,
              ),
              SizedBox(
                width: 5,
              ),
              Text(contents[index]["rate_number"]),
            ],
          ),
        ),
      ],
    );
  }

  Row getFirstMenuDetails() {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: customIconContainerStyle,
          child: Icon(
            LineIcons.hourglass_half,
            size: 20,
            color: primary,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: customIconContainerStyle,
          child: Text(firstMenu[0]["time"]),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: customIconContainerStyle,
          child: Text(firstMenu[0]["delivery_fee"]),
        ),
      ],
    );
  }

  Container getCategories(Size size) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(color: textFieldColor),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(color: white),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              children: categories.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
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

  Row _getSearchSection(Size size) {
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

  Container _getMenuItem(int index) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: _activeMenu == index ? black : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(
          menu[index],
          style: TextStyle(
              fontSize: 16, color: _activeMenu == index ? white : black),
        ),
      ),
    );
  }
}
