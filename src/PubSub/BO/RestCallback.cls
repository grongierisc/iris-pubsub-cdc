Class PubSub.BO.RestCallback Extends EnsLib.REST.Operation
{

Method onCallbackRequest(pRequest As PubSub.Msg.CallbackRequest, Output pResponse As Ens.StringResponse) As %Status
{
   set tSC = $$$OK
   try {
	   
	  set pResponse = ##class(Ens.StringResponse).%New()
    	
    	set tDyna = {}
      	set tDyna.type = pRequest.entityType
      	set tDyna.operation = pRequest.operationType
      	set tDyna.id = pRequest.entityId
      
      	set json = tDyna.%ToJSON()
    	
    	Set httprequest=##class(%Net.HttpRequest).%New()
    	$$$ThrowOnError(httprequest.SetHeader("Content-Type", "application/json; charset=utf-8"))
    	$$$ThrowOnError(httprequest.EntityBody.Write(json))
    	set sc = ..Adapter.SendFormDataArray(.tHttpResponse,"POST",httprequest,.pFormVarNames,.pData,pRequest.URI)
    	
    	
    	#dim tHttpResponse as %Net.HttpResponse
    	//gestion erreur fonctionnelle
    	if $$$ISERR(sc){
    		
    		If $IsObject(tHttpResponse) {
        		set tSC = $$$ERROR(9200,"Erreur http : "_tHttpResponse.StatusCode_" Body : "_tHttpResponse.Data.Read())
    		}
    		else{
	    		set tSC = sc	
    		}
    	
    	}    	
    	
    	If $IsObject(tHttpResponse) {

        	set pResponse.StringValue = tHttpResponse.Data.Read()
         
    	}
    	
   	}
	Catch(e) {
		set tSC = e.AsStatus()
	}
	Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="PubSub.Msg.CallbackRequest">
    <Method>onCallbackRequest</Method>
  </MapItem>
</MapItems>
}

}
