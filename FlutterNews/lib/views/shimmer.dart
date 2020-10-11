import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.white24,
        highlightColor: Colors.white54,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
