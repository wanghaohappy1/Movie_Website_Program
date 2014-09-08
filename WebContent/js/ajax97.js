jQuery(init);
    	function init() {
    		var movieName = jQuery("#movieName").val();
    		
    		var key = "umgs9aw92awmyuw6qvmgqkgv";
    		
    		jQuery.ajax({
    			url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey="+key+"&q="+movieName+"&page_limit=10",
    			dataType: "jsonp",
    			success: handleResponse
    		});
    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
    	}
    	

    	
