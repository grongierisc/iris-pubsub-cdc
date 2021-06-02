Class Demo.Person Extends (%Persistent, %Populate)
{

Property FirtName As %String(POPSPEC = "FirstName()");

Property LastName As %String(POPSPEC = "LastName()");

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirtName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
</Data>
<DataLocation>^Demo.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Demo.PersonD</IdLocation>
<IndexLocation>^Demo.PersonI</IndexLocation>
<StreamLocation>^Demo.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
