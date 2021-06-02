/// Description
Class Demo.DemoListArray Extends (%Persistent, %Populate)
{

/// Simple property
Property Simple As %String(POPSPEC = "FirstName()");

/// List of Simple prop
Property ListSimple As list Of %String(POPSPEC = "FirstName()");

/// Array of Simple prop
Property ArraySimple As array Of %String(POPSPEC = "FirstName()", SQLPROJECTION = "table/column");

/// Object property
Property Object As Person;

/// List of Simple prop
Property ListObject As list Of Person;

/// Array of Simple prop
Property ArrayObject As array Of Person;

/// SerialObject property
Property SerialObject As SerialPerson;

/// List of SerialObject
Property ListSerialObject As list Of SerialPerson;

/// Array of SerialObject
Property ArraySerialObject As array Of SerialPerson;

/// Test
ClassMethod Test() As %Status
{
    Set sc = $$$OK
    
    do ##class(Demo.DemoListArray).%KillExtent()
    do ##class(Demo.Person).%KillExtent()
    do ##class(Demo.Person).Populate(100)
    do ##class(Demo.DemoListArray).Populate(100)

    Return sc
}

Storage Default
{
<Data name="ArrayObject">
<Attribute>ArrayObject</Attribute>
<Structure>subnode</Structure>
<Subscript>"ArrayObject"</Subscript>
</Data>
<Data name="ArraySerialObject">
<Attribute>ArraySerialObject</Attribute>
<Structure>subnode</Structure>
<Subscript>"ArraySerialObject"</Subscript>
</Data>
<Data name="ArraySimple">
<Attribute>ArraySimple</Attribute>
<Structure>subnode</Structure>
<Subscript>"ArraySimple"</Subscript>
</Data>
<Data name="DemoListArrayDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Simple</Value>
</Value>
<Value name="3">
<Value>ListSimple</Value>
</Value>
<Value name="4">
<Value>Object</Value>
</Value>
<Value name="5">
<Value>ListObject</Value>
</Value>
<Value name="6">
<Value>SerialObject</Value>
</Value>
<Value name="7">
<Value>ListSerialObject</Value>
</Value>
</Data>
<DataLocation>^Demo.DemoListArrayD</DataLocation>
<DefaultData>DemoListArrayDefaultData</DefaultData>
<IdLocation>^Demo.DemoListArrayD</IdLocation>
<IndexLocation>^Demo.DemoListArrayI</IndexLocation>
<StreamLocation>^Demo.DemoListArrayS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
