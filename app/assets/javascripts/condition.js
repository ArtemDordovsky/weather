$(function(){
    $(".graph").peity("line", {width: 300, height: 150});
    var days = ""
    var date = ""
    $("body").on('click', '#three_days', function(){
        var forecast = $("#forecast_three_days")
        forecast.toggle();
          days = 3
          $.ajax({
            type: "GET",
            url: "/forecasts",
            data: {num_of_days: days}
          }).done(function( html ) {
            $("#forecast_three_days").(html);});
    });
    $("body").on('click', 'button', function(){
        date = "2013-06-08"
    $.ajax({
        type: "GET",
        url: "/forecasts",
        data: {date: date}
    }).done(function( html ) {
      $("#forecast_of_date").escape(html);});
    });
});
