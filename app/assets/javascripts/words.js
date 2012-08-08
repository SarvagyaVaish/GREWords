$(document).ready(function(){

  var controller = ".words-controller";
  var wordName = controller + " #word-name";
  var showHint = controller + " #show-hint";
  var showMeaning = controller + " #show-meaning";
  var wordMeaning = controller + " #word-meaning";
  var wordSentence = controller + " #word-sentence";

  $(wordName).show();
  $(showHint).hide();
  $(showMeaning).hide();
  $(wordMeaning).show();
  $(wordSentence).show();
  
});

