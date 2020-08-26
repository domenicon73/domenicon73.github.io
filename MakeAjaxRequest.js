/**
 * @author psaila
 */

 function makeAjaxRequest(url, callback_function, return_xml,
  xml_msg, method)
{ var http_request = false;

  if (window.XMLHttpRequest){ 
     // Mozilla,...
    http_request = 
       new XMLHttpRequest();
	if (
	   http_request.overrideMimeType) 
	 { http_request.
	    overrideMimeType('text/xml');
	 } 
	} else
	if (window.ActiveXObject) { // IE
	   try {
	     http_request = new ActiveXObject("Msxml2.XMLHTTP");
    	   } 
	   catch (e) {
    	  try { 
		  	http_request = new ActiveXObject("Microsoft.XMLHTTP");
        	  } 
	       catch (e) {} } }
	if (!http_request) {
	   alert('Unfortunatelly your ' +
		 'browser doesn\'t support ' +
		  'this feature.');
	    return false;
	  }

	http_request.onreadystatechange =
	   function() 
	  { if (http_request.readyState == 4)
	    { if (http_request.status == 200)
	      { if (return_xml) {
		       eval(callback_function +
				 '(http_request.responseXML, "xml")');
			} else
			{ // rispsota testuale
				eval(callback_function + '(http_request.responseText, "text")');
			 } 
			} else 
			{ 
			  alert('There was a problem with ' + 'the request.(Code: ' + http_request.status + ')' );
			} 
		} 
		}
		if(xml_msg != null)
		     method = 'POST';
		  http_request.open(method, url, true);
		  // se xml_msg nullo, non invia
		  // niente
		  http_request.send(xml_msg);
}
