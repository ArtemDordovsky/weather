$(function(){
    $('body').on('click', '#three_days', function(){
      var days = 3;
      $.ajax({
        type: "GET",
        url: "/forecasts",
        data: {num_of_days: days}
      }).done(function( html ) {
        $("#forecast_three_days").html(html);});
    });
    $('body').on('click', 'button', function(){
      var year = $('select#date_year option:selected').val();
      var month = $('select#date_month option:selected').val();
      var day = $('select#date_day option:selected').val();
      var date = year+'-'+month+'-'+day;
      $.ajax({
        type: "GET",
        url: "/forecasts",
        data: {date: date}
      }).done(function( html ) {
        $("#forecast_of_date").html(html);});
    });
});
