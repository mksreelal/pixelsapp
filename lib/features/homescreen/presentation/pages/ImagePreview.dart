import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelsapp/features/homescreen/bloc/homeState.dart';
import 'package:pixelsapp/features/homescreen/bloc/home_event.dart';
import 'package:pixelsapp/features/homescreen/bloc/homebloc.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeImageSelected) {
            final imageUrl = state.imageUrl;

            return FloatingActionButton(
              backgroundColor: ColorsRes.primaryblue,
              onPressed: () {
                // Dispatch the DownloadImage event to trigger image download
                context.read<HomeBloc>().add(DownloadImage(imageUrl));
              },
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    // Show loading indicator while downloading
                    return const SizedBox(
                      height: 10,
                      child: SpinKitChasingDots(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    // Show download icon when not loading
                    return const Icon(
                      Icons.download,
                      color: ColorsRes.white,
                      size: 20,
                    );
                  }
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeImageSelected) {
            final imageUrl = state.imageUrl;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else if (state is HomeLoading) {
            // Show loading spinner when the download is in progress
            return const Center(
              child: SpinKitChasingDots(
                color: Colors.white,
              ),
            );
          } else {
            return const Center(child: Text('No image selected'));
          }
        },
      ),
    );
  }
}
