import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitter_clone_material/data/models/tweet.dart';

part 'tweets_state.dart';

class TweetsCubit extends Cubit<TweetsState> {
  TweetsCubit() : super(TweetsInitial());
  Future<List<Tweet>> get_tweets() async {
    final supabase = Supabase.instance.client;
    final List<dynamic> data = await supabase
        .from("Tweets")
        .select("*, Profiles!inner(*)")
        .order('created_at', ascending: false);
    print(data);
    emit(TweetsRefreshing(false));
    return data.map((e) => Tweet.fromMap(e)).toList();
  }

  Future<void> refresh() async {
    emit(TweetsRefreshing(true));
  }

  Future<void> create_tweet(String content) async {
    final supabase = Supabase.instance.client;
    await supabase.from('Tweets').insert({'content': content, 'posted_by': 1});
    refresh();
  }
}
