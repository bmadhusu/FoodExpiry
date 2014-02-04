FE = {
    setup: function() {
	
	$('<label for="food_expiry_range" class="expiry_range">' +
	  'Filter Range' + '</label>' +
	  '<select id="food_expiry_range">' +
	  '<option value="All" selected>All</option>' +
	  '<option value="1 week">1 week</option>' +
	  '<option value="2 weeks">2 weeks</option>' +
	  '<option value="3 weeks">3 weeks</option>' +
	  '<option value="1 month">1 month</option>' +
	  '<option value="Custom">Custom</option>' +
	  '</select>').insertAfter('h1').change(FE.filter_foods);
    },

    filter_foods: function() {
	
	filter_date = new Date(); // filter_date is GLOBAL
	var num_days_to_add;

	switch (($(this).val()))
	{
	case "1 week":
	    num_days_to_add = 7;
	    break;
	case "2 weeks":
	    num_days_to_add = 14;
	    break;
	case "3 weeks":
	    num_days_to_add = 21;
	    break;
	case "1 month":
	    num_days_to_add = 31;
	    break;
	case "All":
	    num_days_to_add = 365;
	    break;
	}

	filter_date.setDate(filter_date.getDate() + num_days_to_add);
	
// get today's date and add # of days to get limit date
// then compare limit date with expiry date to see if it falls after it; if so
// hide it

//	$('#foods tbody tr').each(FE.filter_in_or_out(filter_date));
	running_price = 0.0;  // global variable
	running_expired_price = 0.0;  // global variable

	$('#foods tbody tr').each(FE.filter_in_or_out);
// set price tally

	$("#price_tally").text("$"+running_price.toFixed(2));
	$("#expired_price_tally").text("$"+running_expired_price.toFixed(2));
    },

    
    filter_in_or_out: function () {
	var exp_date = new Date($(this).find('td:nth-child(3)').text());

	var todays_date = Date.now()
	// if food expired, show it & highlight it
	if (exp_date < todays_date) {
	    $(this).show();
	    $(this).addClass("hilite");
	    running_expired_price = running_expired_price + parseFloat($(this).find('td:nth-child(5)').text());
	}
	else if (exp_date <= filter_date) {
	    $(this).show();
	    running_price = running_price + parseFloat($(this).find('td:nth-child(4)').text());
	} else {
	    $(this).hide();
	};
    }
    
}

$(FE.setup);
