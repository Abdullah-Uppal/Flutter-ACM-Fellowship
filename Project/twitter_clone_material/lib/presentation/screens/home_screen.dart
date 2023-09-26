import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitter_clone_material/cubits/tweets/tweets_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TweetsCubit, TweetsState>(
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(title: const Text("Feed")),
            drawer: Drawer(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilledButton.icon(
                        onPressed: () async {
                          await Supabase.instance.client.auth.signOut();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/login", (route) => false);
                        },
                        icon: Icon(Icons.logout),
                        label: Text("Logout"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                            top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextField(
                              controller: contentController,
                              maxLines: 3,
                              maxLength: 420,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                label: const Text("Content"),
                              ),
                            ),
                            FilledButton(
                              onPressed: () async {
                                await context
                                    .read<TweetsCubit>()
                                    .create_tweet(contentController.text);
                                Navigator.of(_).pop();
                              },
                              child: Text("Post"),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
            body: FutureBuilder(
              future: context.read<TweetsCubit>().get_tweets(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TweetsCubit>().refresh();
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index]!.content ?? "",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "@" +
                                    (snapshot.data![index]!.profile!.username ??
                                        "null"),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey.shade400),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ));
      },
    );
  }
}
