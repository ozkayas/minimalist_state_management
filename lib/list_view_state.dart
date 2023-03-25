import 'package:flutter/material.dart';
import 'package:minimalist_state_management/post.dart';

class ListViewState{

/*ValueNotifier<List<Post>> postsNotifier =  ValueNotifier<List<Post>>(
   [const Post(
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
  const Post(
    userId: 1,
    id: 2,
    title: "qui est esse",
    body: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
  ),
  const Post(
    userId: 1,
    id: 3,
    title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
  ),
  const Post(
    userId: 1,
    id: 4,
    title: "eum et est occaecati",
    body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
  ),
  const Post(
    userId: 1,
    id: 5,
    title: "nesciunt quas odio",
    body: "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque",
  ),
  const Post(
    userId: 1,
    id: 6,
    title: "dolorem eum magni eos aperiam quia",
    body: "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae",
  ),
  const Post(
    userId: 1,
    id: 7,
    title: "magnam facilis autem",
    body: "dolore placeat quibusdam ea quo vitae\nmagni quis enim qui quis quo nemo aut saepe\nquidem repellat excepturi ut quia\nsunt ut sequi eos ea sed quas",
  ),]
);

void postRemoveTapped(Post postToRemove){


  // print(postsNotifier.value.length);
  postsNotifier.value.remove(postToRemove);
  // postsNotifier.value = [...postsNotifier.value];
  postsNotifier.value = List<Post>.from(postsNotifier.value);
  // print(postsNotifier.value.length);

}


void addPostTapped(Post postToAdd){
  postsNotifier.value.add(postToAdd);
  postsNotifier.value = List<Post>.from(postsNotifier.value);

}*/

MyListViewNotifier postsNotifier = MyListViewNotifier([const Post(
  userId: 1,
  id: 2,
  title: "qui est esse",
  body: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
),
  const Post(
    userId: 1,
    id: 3,
    title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
  ),
  const Post(
    userId: 1,
    id: 4,
    title: "eum et est occaecati",
    body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
  ),]);

}

class MyListViewNotifier<T> extends ValueNotifier<List<T>>{
  MyListViewNotifier(super.value);

  void postRemoveTapped(T post){
    value.remove(post);
    value = List.from(value);
    print(value);

  }

  void addPostTapped(T post){
    value.add(post);
    // value = [...value];
    notifyListeners();
    print("=== POST ADEDI: ${value.length}");

  }



}


