Include EnsSQLTypes

Class PubSub.BO.RemoteBDD Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method SelectRemoteBDD(pRequest As PubSub.Msg.FormationSelectRequest, Output pResponse As PubSub.Msg.FormationSelectResponse) As %Status
{
	set tStatus = $$$OK
	
	try{
        set pResponse = ##class(PubSub.Msg.FormationSelectResponse).%New()
		//Pour les tests, on truncate les tables avant insertion
		$$$ThrowOnError(..Adapter.ExecuteQuery(.tRS,"select * from formation where id = ?",pRequest.Id))
		While tRS.%Next(){

			set pResponse.Formation.Nom =  tRS.Get("nom")
			set pResponse.Formation.Salle =  tRS.Get("salle")
            
		}
	}
	catch exp
	{
		Set tStatus = exp.AsStatus()
	}

	Quit tStatus
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="PubSub.Msg.FormationSelectRequest"> 
		<Method>SelectRemoteBDD</Method>
	</MapItem>
</MapItems>
}

}
