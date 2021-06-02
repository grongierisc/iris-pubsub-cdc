Class Demo.SerialPerson Extends (%SerialObject, %Populate)
{

Property FirtName As %String(POPSPEC = "FirstName()");

Property LastName As %String(POPSPEC = "LastName()");

Storage Default
{
<Data name="PersonState">
<Value name="1">
<Value>FirtName</Value>
</Value>
<Value name="2">
<Value>LastName</Value>
</Value>
</Data>
<State>PersonState</State>
<StreamLocation>^Demo.PersonS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
