import 'package:flutter/material.dart';
import 'package:minimalist_state_management/features/post_list_view/list_view_state.dart';
import 'package:minimalist_state_management/models/post.dart';
import 'package:minimalist_state_management/services/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ValueListenableBuilder<List<Post>>(
      valueListenable: state.postsNotifier,
      builder: (context, postsValue, _) {
        return ListView(
          children: postsValue
              .map((post) => ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(
                      child: Text("${post.id}"),
                    ),
            trailing: IconButton(onPressed: (){

              state.postsNotifier.postRemoveTapped(post);

            }, icon: Icon(Icons.remove_circle_outline),),
                  ))
              .toList(),
        );
      }
    );
  }
}
