import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/image_resource.dart';
import '../utils/failure_message.dart';
import 'show_asset_image.dart';
import '../../features/post/blocs/get_post_bloc/get_post_bloc.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    if (message == FailureMessage.noInternetConnection) {
      return const NoInternetConnectionWidget();
    }
    return Center(child: Text(message));
  }
}

class NoInternetConnectionWidget extends StatefulWidget {
  const NoInternetConnectionWidget({super.key});

  @override
  State<NoInternetConnectionWidget> createState() =>
      _NoInternetConnectionWidgetState();
}

class _NoInternetConnectionWidgetState
    extends State<NoInternetConnectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowAssetImage(image: ImageResources.noInternet),
        Center(
          child: _refreshButton(context),
        )
      ],
    );
  }

  IconButton _refreshButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<GetPostBloc>().add(GetPosts());
          setState(() {});
        },
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade200,
          ),
          child: const Icon(
            Icons.refresh,
            size: 120,
            color: Colors.black54,
          ),
        ));
  }
}
