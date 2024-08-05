import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/dio_retrofit/atomi/home/home_page/ui/home_slider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<String> imgList = [
    "https://www.sport9.vn/images/uploaded/blog%206/adidas-x-crazyfast%20(5).jpg",
    "https://cf.shopee.vn/file/cb189565c02a08a0d57b9d03d048bcc3",
    "https://www.sport9.vn/images/uploaded/blog%206/adidas-x-crazyfast%20(5).jpg",
    "https://cf.shopee.vn/file/cb189565c02a08a0d57b9d03d048bcc3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: HomeSlider(),
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _soccerClothes(),
                  _soccerShoes(),
                ],
              ),
              childCount: 1,
            ),
          )
        ]),
      ),
    );
  }

  _soccerClothes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
          child: Text("Quần áo đá bóng",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 160.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 140.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image(
                              fit: BoxFit.cover,
                              image: AssetImage('images/b.jpg'),
                            ),
                            ListTile(
                              title: Text(
                                'Đồ thể thao',
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text('200.000',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  _soccerShoes() {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('images/a.png'),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Text('Giày đá bóng ',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0, left: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text('Tất cả', style: TextStyle(color: Colors.white)),
                  onPressed: () {}),
            )
          ],
        ),
        Container(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
            children: List.generate(4, (index) {
              return Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: (MediaQuery.of(context).size.width / 2) - 70,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: imgList[index],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        ListTile(
                            title: Text(
                          'Giày đá bóng',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ))
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Container(
          child: Padding(
            padding:
                EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0, bottom: 10),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('images/b.jpg'),
            ),
          ),
        )
      ],
    );
  }
}
