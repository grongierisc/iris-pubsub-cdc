Class PubSub.Msg.CallbackRequest Extends Ens.Request
{

/// depends on the SOAiness operation type
Property URI As %String(MAXLEN = 1000);

Property Verbe As %String;

Property Id As %String;

Property Obj As %String;


}
