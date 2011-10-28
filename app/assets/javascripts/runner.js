$(function() {
  flashLoop(0);
});

var flashLoop = function(count) {
  count = count + 1;
  if(count <= 6){
    $("#flash-notices").fadeToggle(800, flashLoop(count));
  };
};
