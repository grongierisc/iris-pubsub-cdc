Class SOA.BS.RESTServiceCallBack Extends Ens.BusinessService
{

Parameter TARGET = "ROUTE_PUBSUB";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	set status = $$$OK

	try {
		$$$LOGINFO(pInput.StringValue)
		set tDynEntity = {}.%FromJSON(pInput.StringValue)
		
		set tRequest = ##class(PubSub.Msg.CallbackRequest).%New()
        set tRequest.Id = tDynEntity.id
        set tRequest.Obj = tDynEntity.obj
        set tRequest.Verbe = tDynEntity.verbe
			
		// Make a synchronous call to the business process and use the response message as our response
		$$$ThrowOnError(..SendRequestSync(..#TARGET, tRequest, .pOutput))
		
		
	} catch ex {
		set status = ex.AsStatus()
	}
	Quit status
}

}
