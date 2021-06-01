Class PubSub.REST.Dispatch Extends %CSP.REST
{

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 0;

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <!-- Get this spec -->
  <Route Url="/callback" Method="post" Call="callback" />
</Routes>
}

/// Get this spec
ClassMethod callback() As %Status
{
	set status = $$$OK
	try {

		set bodyStream = %request.Content
		set body = ""
		if $ISOBJECT($get(bodyStream)) {
			set body = bodyStream.Read(,.sc)
			set request = ##class(Ens.StringRequest).%New()
			set request.StringValue = body
			
			$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("WS_IN_CALLBACK",.tService))
			$$$ThrowOnError(tService.ProcessInput(request,.output))
		
		}
		w body
		
	} catch(ex) {
		set status = ex.AsStatus()
	}
	return status
}

}
