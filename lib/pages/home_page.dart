import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:flutter_jd/common/service/service_method.dart';
import 'package:flutter_jd/common/widget/swiper_widget.dart';
import 'package:flutter_jd/common/widget/tap_navigator.dart';
// import 'package:flutter_jd/common/widget/ad_banner.dart';
import 'package:flutter_jd/common/widget/leader_phone.dart';
import 'package:flutter_jd/common/widget/recommend.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerkey =
      new GlobalKey<RefreshFooterState>();
  GlobalKey<RefreshHeaderState> _headerkey =
      new GlobalKey<RefreshHeaderState>();

  String homePageContent;

  @override
  void initState() {
    _getHotGoods();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  void _getHotGoods() {
    // var formPage = {'page': page};
    // getHomePageBeloConten(formPage).then((val) {
    //   var data = json.decode(val.toString());
    //   List<Map> newGoodsList = (data['data'] as List).cast();
    //   setState(() {
    //     hotGoodsList.addAll(newGoodsList);
    //     page++;
    //   });
    // });
    if (hotGoodsList.length < 100) {
      List<Map> newGoodsList = [
        {
          "image":
              "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/35033/13/12719/176775/5d0c7d44E228b4c69/e9d204fef2826732.jpg!q70.dpg.webp",
          "name": "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/71373/32/1073/141257/5cf487ebE4345aa64/95dd8460b6821522.jpg!q70.dpg.webp",
          "name": "方形太阳镜男墨镜圆脸优雅运动司机镜开车潮人偏光驾驶镜简约舒适 黑框黑灰",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/42428/26/3470/74958/5ccebe85Ebf7c8afc/c2b98cc5a47acc8a.jpg!q70.dpg.webp",
          "name": "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/24322/22/10930/122283/5c8b5fdaEf9dc26f2/6e1d53b2e144b9a5.jpg!q70.dpg.webp",
          "name": "复古牛皮 三折男士钱包真皮横款皮夹 棕色",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/60900/27/332/561839/5ce88fb5E8277226e/a4dc694731f40da4.jpg!q70.dpg.webp",
          "name": "生活无忧(lattliv)陶瓷杯套装带盖带勺马克杯咖啡杯办公室水杯牛奶杯 白色淡蓝色随机发",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img14.360buyimg.com/mobilecms/s372x372_jfs/t1/41278/6/7712/282360/5d14ceb3E5cda8672/a1ef89c146636ace.png!q70.webp",
          "name": "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img14.360buyimg.com/mobilecms/s372x372_jfs/t1/10098/1/12/57012/5bd9246fEe6cb02cc/09d6b6fc41316a54.jpg!q70.dpg.webp",
          "name": "富光拾喜玻璃杯带茶隔水杯男女士便携创意双层泡茶杯子 320ml 黑色",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/14064/17/1878/132939/5c17389eE0c08e0a1/0dc5d436f5158434.jpg!q70.dpg.webp",
          "name": "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t3079/51/316390861/119361/35c60a22/57b0282aNba8e588f.jpg!q70.dpg.webp",
          "name": "<品牌直降>跑步机家用款小型女性懒人多功能室内可折叠式静音 T03蓝白普通款",
          "mallPrice": "150",
          "price": "250"
        },
        {
          "image":
              "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/69843/25/3261/162959/5d182838E9a1d59e6/bf329546994df689.jpg!q70.dpg.webp",
          "name": "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
          "mallPrice": "150",
          "price": "250"
        },
      ];
      hotGoodsList.addAll(newGoodsList);
      page++;
      setState(() {
       hotGoodsList:hotGoodsList; 
      });
    }
  }

  Widget _hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _wrapWidget() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((item) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  item['image'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  item['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('￥${item['mallPrice']}'),
                    Text('${item['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(spacing: 2, children: listWidget);
    } else {
      return Container(
        padding: EdgeInsets.all(15.0),
        child: Text('再无数据...'),
      );
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[_hotTitle, _wrapWidget()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('京东商城'),
          elevation: 0.0,
        ),
        body: Container(
            child: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            // if(snapshot.hasData){
            //   var data = json.decode(snapshot.data.toString());
            // List<Map> swiperDataList = (data['data']['slides'] as List).cast();
            List<String> swiperDataList = [
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/23112/33/6431/99212/5c540d7fEf8000223/fddb6b047c02ba3d.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/75767/32/795/153806/5cf08efdEc627483f/5058ee28fd271fb5.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/78106/12/4940/499233/5d3052acE526d5a15/b2bde1269d9f6d82.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/46650/35/5177/132121/5d2ea944E16eb1056/a721698491480649.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/60213/28/4621/446974/5d2c2ca5E588dd7ab/e770665a2928fb5b.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/29602/28/6448/147417/5c5018e1Ed6bdfbfe/44777b12d731ad4b.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/68632/28/4771/136043/5d2ea1a5Ef3a40b4a/81b75466f678101f.jpg!cr_1125x549_0_72!q70.jpg.dpg',
              'http://m.360buyimg.com/mobilecms/s750x366_jfs/t1/64353/22/4686/93895/5d2d403aE30c7f342/ecc2c05398e223fa.jpg!cr_1125x549_0_72!q70.jpg.dpg',
            ];
            List<Map> navgatorList = [
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/20983/16/10753/6124/5c8a16aaE5d6b15d7/01e0e818a7505267.png.webp",
                "name": "京东超市"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/39401/17/2391/5859/5cc06fcfE2ad40668/28cda0a571b4a576.png.webp",
                "name": "数码电器"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/17169/3/4127/4611/5c2f35cfEd87b0dd5/65c0cdc1362635fc.png.webp",
                "name": "京东服饰"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/27962/13/1445/4620/5c120b24Edd8c34fe/43ea8051bc50d939.png.webp",
                "name": "京东生鲜"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t16990/157/2001547525/17770/a7b93378/5ae01befN2494769f.png.webp",
                "name": "京东到家"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t18454/342/2607665324/6406/273daced/5b03b74eN3541598d.png.webp",
                "name": "充值缴费"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t22228/270/207441984/11564/88140ab7/5b03fae3N67f78fe3.png.webp",
                "name": "9.9元拼"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/7068/29/8987/5605/5c120da2Ecae1cc3a/016033c7ef3e0c6c.png.webp",
                "name": "领券"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t16828/63/2653634926/5662/d18f6fa1/5b03b779N5c0b196f.png.webp",
                "name": "赚钱"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/22262/9/1470/4527/5c120cd0E5d3c6c66/4792ec307a853e9f.png.webp",
                "name": "PLUS会员"
              },
              {
                "image":
                    "http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/14555/23/1446/4195/5c120e71E947f3ca1/cdbad904f61e1fb7.png.webp",
                "name": "海囤全球"
              },
            ];
            // String adPicture = 'http://m.360buyimg.com/mobilecms/s750x230_jfs/t1/35766/32/13502/150390/5d282778E06160b9f/74cd397502255aa4.jpg!q70.jpg.dpg';
            String leaderImage =
                'http://m.360buyimg.com/mobilecms/s750x230_jfs/t1/35766/32/13502/150390/5d282778E06160b9f/74cd397502255aa4.jpg!q70.jpg.dpg';
            String leaderPhone = '13260094140';
            List<Map> recommendList = [
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t22207/252/2438311501/282892/6689091b/5b56e91bN633555ce.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/62308/4/2546/80642/5d0cb548E9787fa7d/6cf8268de8fe161b.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/41850/30/7332/116679/5d0c8694E59924b77/1113ac0765351525.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/54251/11/2997/160620/5d0c8694Ebed70171/10fd9e6fcf2544db.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/72195/25/4584/95260/5d2be853Eed016135/faeb2b6d67b2c8bc.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/55446/29/5450/298428/5d312df4Ed5853f36/4b1bdaec8c20af12.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/11399/34/8780/105271/5c70fc9aEf4c6f451/a7ccdc94f46460ed.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
              {
                'image':
                    'http://m.360buyimg.com/mobilecms/s150x150_jfs/t1/62710/13/4752/99828/5d2e8c3fE62871508/f7a8927857e8aef3.jpg!q70.jpg.dpg',
                'mallPrice': '149',
                'price': '149'
              },
            ];
            return EasyRefresh(
              onRefresh: () {
                print("下载加载");
                hotGoodsList.clear();
              },
              loadMore: () async {
                print('加载更多');
                print(page);
                if (hotGoodsList.length < 100) {
                  List<Map> newGoodsList = [
                    {
                      "image":
                          "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/35033/13/12719/176775/5d0c7d44E228b4c69/e9d204fef2826732.jpg!q70.dpg.webp",
                      "name":
                          "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/71373/32/1073/141257/5cf487ebE4345aa64/95dd8460b6821522.jpg!q70.dpg.webp",
                      "name": "方形太阳镜男墨镜圆脸优雅运动司机镜开车潮人偏光驾驶镜简约舒适 黑框黑灰",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/42428/26/3470/74958/5ccebe85Ebf7c8afc/c2b98cc5a47acc8a.jpg!q70.dpg.webp",
                      "name":
                          "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/24322/22/10930/122283/5c8b5fdaEf9dc26f2/6e1d53b2e144b9a5.jpg!q70.dpg.webp",
                      "name": "复古牛皮 三折男士钱包真皮横款皮夹 棕色",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/60900/27/332/561839/5ce88fb5E8277226e/a4dc694731f40da4.jpg!q70.dpg.webp",
                      "name": "生活无忧(lattliv)陶瓷杯套装带盖带勺马克杯咖啡杯办公室水杯牛奶杯 白色淡蓝色随机发",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img14.360buyimg.com/mobilecms/s372x372_jfs/t1/41278/6/7712/282360/5d14ceb3E5cda8672/a1ef89c146636ace.png!q70.webp",
                      "name":
                          "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img14.360buyimg.com/mobilecms/s372x372_jfs/t1/10098/1/12/57012/5bd9246fEe6cb02cc/09d6b6fc41316a54.jpg!q70.dpg.webp",
                      "name": "富光拾喜玻璃杯带茶隔水杯男女士便携创意双层泡茶杯子 320ml 黑色",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/14064/17/1878/132939/5c17389eE0c08e0a1/0dc5d436f5158434.jpg!q70.dpg.webp",
                      "name":
                          "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t3079/51/316390861/119361/35c60a22/57b0282aNba8e588f.jpg!q70.dpg.webp",
                      "name": "<品牌直降>跑步机家用款小型女性懒人多功能室内可折叠式静音 T03蓝白普通款",
                      "mallPrice": "150",
                      "price": "250"
                    },
                    {
                      "image":
                          "http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/69843/25/3261/162959/5d182838E9a1d59e6/bf329546994df689.jpg!q70.dpg.webp",
                      "name":
                          "柏尼时（parnis）军表 男士全自动机械表 夜光防水 休闲真皮皮带 大表盘 男表 黑壳黄字－磨砂皮带－大表盘",
                      "mallPrice": "150",
                      "price": "250"
                    },
                  ];
                  hotGoodsList.addAll(newGoodsList);
                  setState(() {
                    hotGoodsList:hotGoodsList; 
                  });
                }
              },
              // refreshHeader: ClassicsHeader(
              //   key: _headerkey,
              //   bgColor: Colors.transparent,
              //   textColor: Colors.grey,
              //   moreInfoColor: Colors.grey,

              // ),
              refreshHeader: BezierCircleHeader(
                key: _headerkey,
                color: Theme.of(context).scaffoldBackgroundColor,
                backgroundColor: Color.fromRGBO(228, 49, 48, 1.0),
              ),
              refreshFooter: ClassicsFooter(
                key: _footerkey,
                bgColor: Colors.transparent,
                textColor: Colors.grey,
                moreInfoColor: Colors.grey,
                noMoreText: '加载完成...',
                moreInfo: '加载中...',
                loadReadyText: '释放加载...',
                loadingText: '加载中...',
                loadedText: '上拉加载...',
                loadText: '上拉加载...',
              ),
              child: ListView(
                children: <Widget>[
                  SwiperWidget(swiperDataList: swiperDataList),
                  TapNavigator(
                    naviatorList: navgatorList,
                  ),
                  // AdBanner(adPicture:adPicture),
                  LeaderPhone(
                      leaderImage: leaderImage, leaderPhone: leaderPhone),
                  Recommend(recommendList: recommendList),
                  _hotGoods(),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      '我是有底线的...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            );

            // }else{
            //   return Center(
            //     child: Text('加载中....'),
            //   );
            // }
          },
        )),
      ),
    );
  }
}
