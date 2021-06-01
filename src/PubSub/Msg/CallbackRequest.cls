Class PubSub.Msg.CallbackRequest Extends Ens.Request
{

/// depends on the SOAiness operation type
Property URI As %String(MAXLEN = 1000);

Property Verbe As %String;

Property Id As %String;

Property Obj As %String;

Storage Default
{
<Data name="CallbackRequestDefaultData">
<Subscript>"CallbackRequest"</Subscript>
<Value name="1">
<Value>URI</Value>
</Value>
<Value name="2">
<Value>Verbe</Value>
</Value>
<Value name="3">
<Value>Id</Value>
</Value>
<Value name="4">
<Value>Obj</Value>
</Value>
</Data>
<DefaultData>CallbackRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
