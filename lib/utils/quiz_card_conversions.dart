String getQuizCardEncodedAnswer(List<String> answerOptions) {
  // add the tag <option> before each element of the list and concatenate them
  return answerOptions.map((entry) => '<option>$entry').join();
}

List<String> getQuizCardDecodedAnswer(String encodedAnswer) {
  // split the string by the tag <option> and remove the first element which is empty
  return encodedAnswer.split('<option>').sublist(1);
}
