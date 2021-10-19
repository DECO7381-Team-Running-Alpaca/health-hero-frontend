String formatInstruction(String rawSentence) {
  String afterSplit;

  if (rawSentence.startsWith('<')) {
    var beforSplit = rawSentence;
    List after_split_ol = beforSplit.split('<ol>');
    String join_after_ol = after_split_ol.join();
    List after_split_li = join_after_ol.split('<li>');
    String join_after_li = after_split_li.join();

    List after_split_1ol = join_after_li.split('</ol>');
    String join_after_1ol = after_split_1ol.join();
    List after_split_1li = join_after_1ol.split('</li>');
    String join_after_1li = after_split_1li.join();

    afterSplit = join_after_1li;
  } else {
    afterSplit = rawSentence;
  }
  return afterSplit;
}
