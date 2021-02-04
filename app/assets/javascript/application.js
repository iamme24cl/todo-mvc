/*
 *= require jquery
 *= require_tree .
 *= require_self
 */

$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
    })
});


console.log("hello from app.js")