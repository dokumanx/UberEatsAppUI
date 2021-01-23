import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uber_eats_ui/json/home_page_json.dart';
import 'package:uber_eats_ui/theme/colors.dart';
import 'package:uber_eats_ui/theme/styles.dart';
import 'package:uber_eats_ui/widgets/common_widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: black.withOpacity(.1)))),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              "\$15.00 away from a \$0.00 delivery fee.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStoreDetailsBody extends StatelessWidget {
  final Map<String, dynamic> content;

  const CustomStoreDetailsBody({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreDetailImage(
              size: size,
              content: content,
            ),
            SizedBox(
              height: 15,
            ),
            StoreDetailContent(
              content: content,
              size: size,
            ),
            SizedBox(
              height: 25,
            ),
            CustomDivider(),
            StoreDetailInfoSection(
              size: size,
              content: content,
            ),
            StoreDetailsDeliveryFee(
              content: content,
              size: size,
            ),
            SizedBox(
              height: 15,
            ),
            CustomDivider(),
            StoreDetailsCustomMenu()
          ],
        ),
      ),
    );
  }
}

class StoreDetailsCustomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                ),
                Icon(LineIcons.search)
              ],
            ),
          ),
          Text(
            "Packed For You",
            style: customTitle,
          ),
          SizedBox(
            height: 30,
          ),
          CustomMenuPackedForYou()
        ],
      ),
    );
  }
}

class CustomMenuPackedForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(packForYou.length, (index) {
        var packForYouItem = packForYou[index];

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        packForYou[index]["name"],
                        style: customContent,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(packForYou[index]["description"]),
                      SizedBox(
                        height: 15,
                      ),
                      Text(packForYou[index]["price"]),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: 150,
                      height: 100,
                      image: NetworkImage(
                        packForYouItem["img"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        );
      }),
    );
  }
}

class StoreDetailsDeliveryFee extends StatelessWidget {
  final Map<String, dynamic> content;
  final Size size;

  const StoreDetailsDeliveryFee({Key key, this.content, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 30,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: black.withOpacity(.15)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery fee", style: TextStyle(color: black.withOpacity(.5))),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(content["delivery_fee"]),
              Container(
                child: Icon(
                  Icons.arrow_circle_up_outlined,
                  size: 18,
                  color: black.withOpacity(.4),
                ),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: black.withOpacity(.15),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: textFieldColor,
      thickness: 2,
      endIndent: 15,
      indent: 15,
      height: 0,
    );
  }
}

class StoreDetailImage extends StatelessWidget {
  final Map<String, dynamic> content;
  final Size size;

  const StoreDetailImage({Key key, this.content, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "${content["img_id"]}",
          child: Container(
            width: size.width,
            height: 150,
            child: Image(
              image: NetworkImage(content["img"]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(color: white, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_back),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              IconButton(
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(color: white, shape: BoxShape.circle),
                    child: Icon(Icons.favorite_border),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ],
    );
  }
}

class StoreDetailContent extends StatelessWidget {
  final Map<String, dynamic> content;
  final Size size;

  const StoreDetailContent({Key key, this.content, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - (size.width / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: Text(
              content["name"],
              style: customTitle.copyWith(fontSize: 24),
            ),
          ),
          MenuCustomDetails(
            content: content,
          )
        ],
      ),
    );
  }
}

class StoreDetailInfoSection extends StatelessWidget {
  final Map<String, dynamic> content;
  final Size size;

  const StoreDetailInfoSection({Key key, this.content, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Store Info",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StoreDetailsAddressInfo(content: content),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                LineIcons.comment,
                color: primary.withOpacity(.5),
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "People say...",
                style: TextStyle(color: black.withOpacity(.5)),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          StoreDetailsPeopleFeedback(size: size),
        ],
      ),
    );
  }
}

class StoreDetailsAddressInfo extends StatelessWidget {
  const StoreDetailsAddressInfo({
    Key key,
    @required this.content,
  }) : super(key: key);

  final Map<String, dynamic> content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/images/pin_icon.svg",
          width: 15,
          color: Colors.black.withOpacity(.5),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          content["address"],
          style: customLittleContent,
        )),
        Container(
          child: Text(
            "More\nInfo",
            style: customLittleContent.copyWith(color: primary, fontSize: 12),
          ),
        )
      ],
    );
  }
}

class StoreDetailsPeopleFeedback extends StatelessWidget {
  final Size size;

  const StoreDetailsPeopleFeedback({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(peopleFeedback.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: primary.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                peopleFeedback[index],
                style: customLittleContent.copyWith(color: primary),
              ),
            ),
          );
        }),
      ),
    );
  }
}
