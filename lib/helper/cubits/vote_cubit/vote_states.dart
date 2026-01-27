class VoteStates{}
class NoVoteState extends VoteStates{}
class PositiveVoteState extends VoteStates{}
class NagitiveVoteState extends VoteStates{}
class ErrorState extends VoteStates{
  final String errorMessage;
ErrorState({required this.errorMessage});
}
class LoadingState extends VoteStates{}