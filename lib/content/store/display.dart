import 'package:flutter/material.dart';

import 'package:visual_ai/pages/backable_page.dart';
import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';

import 'content.dart';


class StoreContentDisplayPage extends StatefulWidget {
  final StoreContent content;

  StoreContentDisplayPage(this.content, {
    Key? key,
  }) : super(key: key);

  @override
  _StoreContentDisplayPageState createState() => _StoreContentDisplayPageState();
}

class _StoreContentDisplayPageState extends State<StoreContentDisplayPage> {
  List<dynamic> productList = [];
  List<String> size = [
    'S',
    'M',
    'L',
    'XL',
  ];

  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    Color(0xFFFFC1D9),
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return BackablePage(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            elevation: 0,
            snap: true,
            automaticallyImplyLeading: false,
            floating: true,
            stretch: true,
            backgroundColor: Theme.of(context).cardColor,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: widget.content.icon,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Transform.translate(
                offset: Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.content.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.content.released_str,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.content.price_str,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Take a break from jeans with the parker long straight pant. These lightweight, pleat front pants feature a flattering high waist and loose, straight legs.',
                      style: TextStyle(height: 1.5, color: Theme.of(context).cardColor, fontSize: 15),
                    ),
                    SizedBox(height: 30),
                    Text('Color', style: TextStyle(color: Theme.of(context).cardColor, fontSize: 18)),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                shape: BoxShape.circle
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: _selectedColor == index
                                  ? Icon(
                                    Icons.check,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  )
                                  : Container(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Size', style: TextStyle(color: Theme.of(context).cardColor, fontSize: 18)),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: size.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: _selectedSize == index
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).cardColor,
                                shape: BoxShape.circle
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  size[index],
                                  style: TextStyle(
                                    color: _selectedSize == index
                                      ? Theme.of(context).scaffoldBackgroundColor
                                      : null,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical:
                              defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
