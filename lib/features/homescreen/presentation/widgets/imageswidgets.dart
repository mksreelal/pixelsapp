import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/features/homescreen/bloc/homebloc.dart';
import 'package:pixelsapp/features/homescreen/bloc/home_event.dart';
import 'package:pixelsapp/features/homescreen/bloc/homeState.dart';

class ImagesWidgets extends StatefulWidget {
  @override
  _ImagesWidgetsState createState() => _ImagesWidgetsState();
}

class _ImagesWidgetsState extends State<ImagesWidgets> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          context.read<HomeBloc>().add(LoadMoreGallery());
        }
      });
    context.read<HomeBloc>().add(LoadInitialGallery());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: SpinKitChasingDots(
              color: Colors.white,
            ),
          );
        } else if (state is HomeLoaded) {
          final photos = state.photos;

          return Container(
            color: Colors.black,
            child: MasonryGridView.builder(
              controller: _scrollController,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemCount: photos.length + (state.hasMore ? 1 : 0),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemBuilder: (context, index) {
                if (index == photos.length) {
                  return const SizedBox(
                      height: 50, child: Center(child: SizedBox()));
                }
                final photo = photos[index];
                return InkWell(
                  onTap: () {
                    context.read<HomeBloc>().add(SelectImage(index));
                    pushNamed(RouteName.imagePreview);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(photo.src?.original ?? '',
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return Container(); // Initial state
        }
      },
    );
  }
}
