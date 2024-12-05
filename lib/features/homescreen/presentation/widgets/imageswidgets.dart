import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/core/utils/contextExtentions/sizeExtentions.dart';
import 'package:pixelsapp/features/homescreen/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class ImagesWidgets extends StatefulWidget {
  const ImagesWidgets({super.key});

  @override
  State<ImagesWidgets> createState() => _ImagesWidgetsState();
}

class _ImagesWidgetsState extends State<ImagesWidgets> {
  late ScrollController _scrollController;
  HomeProvider _provider = HomeProvider();

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200 &&
            !_provider.loading) {
          _provider.loadMoreGallery();
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Container(
        width: context.getWidth,
        height: context.getHeight,
        color: Colors.black,
        child: MasonryGridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: _provider.photosList.length + (_provider.loading ? 1 : 0),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemBuilder: (context, index) {
            if (index == _provider.photosList.length) {
              return const SizedBox(
                height: 50,
                child: Center(
                  child: SpinKitChasingDots(
                    color: ColorsRes.primaryblue,
                  ),
                ),
              );
            }
            final photo = _provider.photosList[index];
            return GestureDetector(
              onTap: () {
                _provider.setImage(index);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  photo.src?.original ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: const Center(child: Text("Image not available")),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
