import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pixelsapp/core/presentation/widgets/qtext.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/core/utils/contextExtentions/sizeExtentions.dart';
import 'package:pixelsapp/features/homescreen/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  HomeProvider _provider = HomeProvider();
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsRes.primaryblue,
        onPressed: () {
          _provider.saveNetworkImageToGallery(
              _provider.photosList[_provider.photoSelecIndex].src!.portrait ??
                  '');
        },
        child: _provider.loading
            ? const SizedBox(
                height: 10,
                child: SpinKitChasingDots(
                  color: Colors.white,
                ),
              )
            : const Icon(
                Icons.download,
                color: ColorsRes.white,
                size: 20,
              ),
      ),
      body: Container(
        width: context.getWidth,
        height: context.getHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(_provider
                    .photosList[_provider.photoSelecIndex].src!.portrait
                    .toString()))),
      ),
    );
  }
}
