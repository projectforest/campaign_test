$(function(){

  var result = function(response, searchparams, counter){
  
    $("<div>").text("user: " + searchparams).appendTo("#main");
    $("<div>").text(JSON.stringify(response)).appendTo("#main");
    $("<div>").text('{"counter": ' + counter +"}").appendTo("#main");
    
  }
  var counter = 0;
  

  $("#searchForm").on("submit", function(e){
    e.preventDefault();
    var searchparams = $('#searchResult').val();
    counter +=1;
    var data = {searchparams: searchparams};

    $.ajax({
      type: 'GET',
      url: '/search',
      data: data,
      contentType: 'application/json; charset=utf-8',
      success: function(responses){
        $("#main").empty();
        result(responses, searchparams, counter);
        console.log(responses);
        
      }
    });
  });

});
