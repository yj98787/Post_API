import 'package:flutter/material.dart';
import 'package:post_api/Models/post_model.dart';
import 'package:post_api/Screens/body_page.dart';
import '../Services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Posts> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Posts> fetchedPosts = await API.getPosts();
    setState(() {
      posts = fetchedPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "POSTS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: posts.isEmpty
          ? const Center(child: CircularProgressIndicator()) // (Show loader)
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BodyPage(
                id: post.id!,
                body: post.body!,
                title: post.title!,
              )));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                post.id.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(post.title ?? "No Title"),
            subtitle: Text("Tap to view body"),
          );
        },
      ),
    );
  }
}
