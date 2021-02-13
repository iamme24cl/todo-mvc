$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
    })
});

console.log("testing from lists.js");
