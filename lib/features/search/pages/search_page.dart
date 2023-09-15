import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/image_resource.dart';
import '../../../core/widgets/annoted_region.dart';
import '../../../core/widgets/show_asset_image.dart';
import '../../post/blocs/get_post_bloc/get_post_bloc.dart';
import '../../post/widgets/build_posts.dart';
import '../blocs/search_bloc/search_bloc.dart';
import '../widgets/search_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBloc(bloc: BlocProvider.of<GetPostBloc>(context)),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: CustomAnnotatedRegion(
              child: Column(
                children: [
                  SearchBox(
                    controller: searchController,
                    onSubmit: () {
                      context
                          .read<SearchBloc>()
                          .add(SearchPostModel(query: searchController.text));
                    },
                    hintText: 'Search posts',
                  ).animate().slideX(duration: 500.milliseconds).fadeIn(),
                  Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoaded) {
                        return BuildPosts(
                          posts: state.posts,
                          crossAxisCount: 1,
                        );
                      } else if (state is SearchNotFound) {
                        return Stack(
                          children: [
                            ShowAssetImage(image: ImageResources.notFound),
                            Align(
                              alignment: Alignment.center,
                              child: Text("Not found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            )
                          ],
                        );
                      }
                      return ShowAssetImage(image: ImageResources.search)
                          .animate()
                          .fadeIn(duration: 200.milliseconds)
                          .then()
                          .shakeX()
                          .then()
                          .shimmer();
                    },
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
