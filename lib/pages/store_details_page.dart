import 'package:flutter/material.dart';
import 'package:uber_eats_ui/widgets/store_detail_widgets.dart';

class StoreDetailPage extends StatefulWidget {
  final Map<String, dynamic> content;

  const StoreDetailPage({Key key, this.content}) : super(key: key);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStoreDetailsBody(
        content: widget.content,
      ),
      bottomSheet: CustomBottomSheet(),
    );
  }
}

class StoreDetailPageArguments {
  final Map<String, dynamic> content;

  StoreDetailPageArguments({this.content});
}
