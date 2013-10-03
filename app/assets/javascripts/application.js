// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-markdown
// require_tree .

function zoom_in()
{   
  var map = document.getElementById("location-map").src;
  var pattern = /zoom=(\d+)/;
  var zoom_level = parseInt(pattern.exec(map)[1]);
  if(zoom_level < 14)
    zoom_level++;
  document.getElementById("location-map").src = map.replace(pattern,"zoom="+zoom_level);
}

function zoom_out()
{
  var map = document.getElementById("location-map").src;
  var pattern = /zoom=(\d+)/;
  var zoom_level = parseInt(pattern.exec(map)[1]);
  if(zoom_level > 4)
    zoom_level--;
  document.getElementById("location-map").src = map.replace(pattern,"zoom="+zoom_level);
}
