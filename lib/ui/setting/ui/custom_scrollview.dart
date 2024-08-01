import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomScrollviewScreen extends StatefulWidget {
  const CustomScrollviewScreen({super.key});

  @override
  State<CustomScrollviewScreen> createState() => _CustomScrollviewScreenState();
}

class _CustomScrollviewScreenState extends State<CustomScrollviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(),
          _sliverToBoxAdapter()],

      ),
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
      title: Row(
        children: [
          _iconAppBar(icon: Icon(Icons.arrow_back,size: 20,),
              onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMovieScreen()));
              })],
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            child: Center(
                child: Text(
              "Bố Già",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
          )),
      expandedHeight: 200,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/bogia.jpg",
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _sliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,),
            padding: EdgeInsets.all(10),
            child: ReadMoreText(
                trimLines: 15,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Xem thêm',
                trimExpandedText: ' Thu gọn',
                style: TextStyle(height:2),
              "Bố Già là một bộ phim điện ảnh Việt Nam đã gây tiếng vang lớn ngay từ những ngày đầu ra mắt. Với doanh thu ấn tượng 200 tỷ đồng chỉ sau 10 ngày công chiếu, bộ phim đã xô đổ mọi kỷ lục trước đó và trở thành bộ phim có doanh thu cao nhất trong lịch sử điện ảnh Việt Nam. Bộ phim liên tục tạo nên những cột mốc chưa từng có, như phim đạt 100 tỷ, 150 tỷ và 200 tỷ nhanh nhất, phim có doanh thu trong một ngày cao nhất và phim bán được nhiều vé nhất qua ứng dụng ví Momo trong 4 ngày sneakshow. \nBố Già xoay quanh câu chuyện về tình cha con và gia đình, được khai thác một cách khéo léo và sâu sắc, khiến khán giả không khỏi rơi nước mắt. Những tình huống chân thực và cảm động trong phim đã chạm đến trái tim của nhiều người, làm họ cảm thấy sự bình dị và giá trị của gia đình. Bộ phim không chỉ là một tác phẩm giải trí mà còn mang lại nhiều cảm xúc và thông điệp ý nghĩa về tình thân và cuộc sống. Thành công của Bố Già không chỉ đến từ cốt truyện cảm động mà còn nhờ vào sự chỉ đạo tài tình của Trấn Thành, người vừa là biên kịch, đồng đạo diễn và diễn viên chính. Trấn Thành đã gửi lời cảm ơn chân thành đến khán giả, những người đã ủng hộ và yêu mến bộ phim. Hiện tại, ekip Bố Già đang tổ chức cinetour tại hai miền Nam - Bắc để quảng bá thêm cho bộ phim, hứa hẹn sẽ tiếp tục chinh phục những cột mốc mới trong tương lai."
            )
          ),
        ],
      ),
    );
  }

  _iconAppBar({required VoidCallback onTap, required Icon icon}) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: ClipOval(
          child: Container(
            height: 30,
              width: 30,
              color: Colors.white,
              child: icon),
        ),
      ),
    );
  }

}
