Class PubSub.BS.PollingBal Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Property TargetConfigNames As %String(MAXLEN = 1000);

Parameter SETTINGS = "TargetConfigNames";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
	set sc = $$$OK
	try {
		set req = ##class(PubSub.Msg.CallbackRequest).%New()

		set req.Id = pInput.Get("id")
		set req.Obj = pInput.Get("obj")
		set req.Verbe = pInput.Get("verbe")
	
		$$$ThrowOnError(..SendRequestAsync(..TargetConfigNames,req,.pOutput))
	}
	Catch(e) {
		set sc = e.AsStatus()
	}
	Quit sc
}

}
