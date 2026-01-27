 class  VoteData {
  Map<String, int> positiveVote;
  Map<String, int> negativeVote;
  Map<String, int> deleteVote;

  VoteData({
    Map<String, int>? positiveVote,
    Map<String, int>? negativeVote,
    Map<String, int>? deleteVote,
  })  : positiveVote = positiveVote ?? {
          'contributionDecision': 1,
          'reasonId': 1,
          'sourceId': 1,
        },
        negativeVote = negativeVote ?? {
          'contributionDecision': 0,
          'reasonId': 1,
          'sourceId': 1,
        },
        deleteVote = deleteVote ?? {
          'contributionDecision': 2,
          'reasonId': 2,
          'sourceId': 2,
        };
}