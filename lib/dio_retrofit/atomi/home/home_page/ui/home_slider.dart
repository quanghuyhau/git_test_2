import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  final List<String> imgListSlider = [
    "https://sumstore.vn/wp-content/uploads/2023/06/shop-bong-da-sum-store-hcm-2.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_e-j3wy6Qwr4eavujxFGC8p8mQQJNhmkT9Q&s",
    "https://matasport.vn/wp-content/uploads/2022/11/Nhung-dia-chi-ban-quan-ao-bong-da-Ha-Dong-noi-tieng-hien-nay-800x450.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAq4iuh1MSjjib4RWx8tgGHwOdIjz2rl8SE3D7QLY7XGxIKHWMuy3U1wBheGsweytkV4o&usqp=CAU",
    "https://aobongda.net/pic/News/shop-ao-bong-da-tphcm_HasThumb.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 350,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1.0
              ),
              items: imgListSlider.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: i,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator()
                          ),
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
