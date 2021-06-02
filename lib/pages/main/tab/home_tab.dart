import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';

class HomeTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _openSearchPage,
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  //打开搜索页
  _openSearchPage() {
    Get.toNamed(RouteConfig.search);
  }

  Widget _buildContent() {
    return EasyRefresh.custom(
      firstRefresh: true,
      slivers: [
        SliverToBoxAdapter(
          child: Obx(() => _buildBanner()),
        ),
        Obx(() => SliverList(
              delegate: SliverChildBuilderDelegate(
                _buildItem,
                childCount: controller.homeState.articles.value?.length ?? 0,
              ),
            )),
      ],
      onRefresh: () => controller.homeState.loadData(),
      onLoad: () => controller.homeState.loadMore(),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    ArticleData data = controller.homeState.articles.value![index];
    return ArticleItemWidget(item: data);
  }

  //banner
  Widget _buildBanner() {
    return Container(
      child: AspectRatio(
        aspectRatio: 9 / 5,
        child: Swiper(
          itemCount: controller.homeState.bannerData.value?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: controller.homeState.bannerData.value![index].imagePath,
              fit: BoxFit.cover,
            );
          },
          onTap: (int index) {
            Get.toNamed(
              RouteConfig.web,
              arguments: controller.homeState.bannerData.value![index].url,
            );
          },
          autoplay: true,
          autoplayDelay: 6000,
          pagination: SwiperPagination(),
        ),
      ),
    );
  }
}
