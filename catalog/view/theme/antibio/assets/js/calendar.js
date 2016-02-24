function dateToString(e){
    var dateYear = e.slice(0,4);
    var dateMonth = e.slice(5,7);
    var dateDay = e.slice(8,10);
    return(dateDay + '.' + dateMonth + '.' + dateYear + ' ');
}

function formatDate(date) {

  var dd = date.getDate();
  if (dd < 10) dd = '0' + dd;

  var mm = date.getMonth() + 1;
  if (mm < 10) mm = '0' + mm;

  var yy = date.getFullYear();
//  if (yy < 10) yy = '0' + yy;

  return yy + '-' + mm + '-' + dd;
}


function compareDate(a){
    var curdt = new Date(  );
    curdt = formatDate(curdt);
    var yy1 = a.slice(0,4);
    var mm1 = a.slice(5,7);
    var dd1 = a.slice(8,10);
    var yy2 = curdt.slice(0,4);
    var mm2 = curdt.slice(5,7);
    var dd2 = curdt.slice(8,10);
    if (yy1 > yy2){
        return true;
    } else if(yy1 < yy2){
        return false;
    } else if(yy1 == yy2){
        if (mm1 > mm2){
            return true;
        } else if(mm1 < mm2){
            return false;
        } else if(mm1 == mm2){
            if (dd1 > dd2){
                return true;
            } else if(dd1 < dd2){
                return false;
            } else if(dd1 == dd2){
                return true;
            }
        }
    }
}
console.log(compareDate('2016-01-26'));

// малый календарь

$(document).ready(function() {
    $.getJSON('/getplaces', function (json) {
        var AvailableDates = json;
        var dateArray = [];
        for (i = 0; i < json.events.length; i++){
            dateArray[i] = json.events[i].date;
        }
        var firstDate = '';
        for (i = 0; i < dateArray.length; i++){
            if (compareDate(dateArray[i])){
                firstDate = dateArray[i];
                break;
            }
        }
        $('#dpInline').datepicker({ // для календаря
            dateFormat: 'yy-mm-dd',
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            altField: "#calendarDateField",
            altFormat: "yy-mm-dd",
            onSelect: function(date) {
                for ( i = 0; i < AvailableDates.events.length; i++){
                    if(AvailableDates.events[i].date == date){
                        window.location = AvailableDates.events[i].link
                        break;
                    } else {
                        window.location = "/calendar";
                    }
                }
            },
            beforeShowDay: function(date){
                var string = $.datepicker.formatDate('yy-mm-dd', date);
                if (dateArray.indexOf(string) == -1)
                {
                    return [true, "calendarTdNotActive",""]; 
                }
                else
                {
                    var tx = "";
                    for (i = 0; i < AvailableDates.events.length; i++){
                        if (AvailableDates.events[i].date == string){
                            tx = AvailableDates.events[i].locate;
                        }
                        dateArray[i] = AvailableDates.events[i].date;
                    }
                    return [true, "",tx]; 
                }
            }
        });
        $('#dpInline').datepicker( "setDate", firstDate );
    });
    
});

//большой календарь
	
$(document).ready(function() {
    $.getJSON('/getplaces', function (json) {
        var AvailableDates = json;
        var dateArray = [];
        for (i = 0; i < json.events.length; i++){
            dateArray[i] = json.events[i].date;
        }
        var firstDate = '';
        for (i = 0; i < dateArray.length; i++){
            if (compareDate(dateArray[i])){
                firstDate = dateArray[i];
                break;
            }
        }
        function showInfo(date) {
            var dt_val = $('#calendarDateField').val();
            var html = "";
            for (i = 0; i < AvailableDates.events.length; i++){
                if (AvailableDates.events[i].date == dt_val){
                    html += '<div class="col-md-4"><div class="post-item style2 item-calendar no-padding"><div class="post-content-wr"><div class="post-meta-top"><div class="post-image">';
                    html += '<a href="' + AvailableDates.events[i].link + '">';
                    html += '<img src="' + AvailableDates.events[i].image + '" alt="'+ AvailableDates.events[i].title + '">';
                    html += '</a></div><h2 class="post-title">';
                    html += '<a href="' + AvailableDates.events[i].link + '">'+ AvailableDates.events[i].title + '</a>';
                    html += '</h2></div><div class="post-content  clearfix">';
                    html += '<div class="post-tags">' + dateToString(AvailableDates.events[i].date) + '</div>';                      
                    html += '<div class="post-desc">';
                    var miniDesc = AvailableDates.events[i].description;console.log(miniDesc);
                    miniDesc = miniDesc.slice(0,20);
                    html += '<p>' + miniDesc + '...</p>';
                    html += '</div></div></div></div></div>';
                }
                $('#calendarListData').html(html);
            }
        }
        
        $('#dpInlineBig').datepicker({ // для календаря
            dateFormat: 'yy-mm-dd',
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            altField: "#calendarDateField",
            altFormat: "yy-mm-dd",
            onSelect: function(date) {
                showInfo(date);
            },
            beforeShowDay: function(date){
                var string = $.datepicker.formatDate('yy-mm-dd', date);
                if (dateArray.indexOf(string) == -1)
                {
                    return [true, "calendarTdNotActive",""]; 
                }
                else
                {
                    var tx = "";
                    for (i = 0; i < AvailableDates.events.length; i++){
                        if (AvailableDates.events[i].date == string){
                            tx = AvailableDates.events[i].locate;
                        }
                        dateArray[i] = AvailableDates.events[i].date;
                    }
                    return [true, "",tx]; 
                }
            }
        });
        $('#dpInlineBig').datepicker( "setDate", firstDate );
        showInfo(firstDate);
    });
    
});
