part of 'tweets_cubit.dart';

@immutable
sealed class TweetsState {}

final class TweetsInitial extends TweetsState {}

final class TweetsRefreshing extends TweetsState {
  final bool refreshing;
  TweetsRefreshing(this.refreshing);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TweetsRefreshing &&
          runtimeType == other.runtimeType &&
          refreshing == other.refreshing;

  @override
  int get hashCode => super.hashCode;
}
