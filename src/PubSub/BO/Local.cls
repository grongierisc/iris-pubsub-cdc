Class PubSub.BO.Local Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method InsertLocalBDD(pRequest As PubSub.Msg.FormationInsertRequest, Output pResponse As Ens.StringResponse) As %Status
{
    set tStatus = $$$OK
    
    try{
        set pResponse = ##class(Ens.StringResponse).%New()
        set tFormation = ##class(PubSub.Table.Formation).%New()
        set tFormation.Nom = pRequest.Formation.Nom
        set tFormation.Salle = pRequest.Formation.Salle
        do tFormation.%Save()

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
    <MapItem MessageType="PubSub.Msg.FormationInsertRequest"> 
        <Method>InsertLocalBDD</Method>
    </MapItem>
</MapItems>
}

}
