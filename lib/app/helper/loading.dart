import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_now/app/constants/app_constant.dart';

class LoadingApp {
  static Widget getSearchLoadingScreen(BuildContext context,
      {int itemCount = 4}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: AppConstant.borderColor,
      highlightColor: AppConstant.hightlightColor,
      child: Container(
        height: 96,
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                height: 56,
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            height: 8,
                            color: Colors.grey,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppConstant.borderColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 8,
                            color: Colors.grey,
                          ),
                        ),
                        const Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 8,
                            color: Colors.grey,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                height: 8, width: 36, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: singleLoading,
        ),
      );
    }
    return Column(
      children: list,
    );
  }
}
