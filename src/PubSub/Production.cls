Class PubSub.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="PubSub.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SQL_IN_BAL" Category="" ClassName="PubSub.BS.PollingBal" PoolSize="1" Enabled="true" Foreground="false" Comment="Générateur de callback pour Oscar" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="JGService">JG</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
    <Setting Target="Host" Name="TargetConfigNames">ROUTE_PUBSUB</Setting>
    <Setting Target="Adapter" Name="Credentials">PostgresDB</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">delete FROM public.bal where Id = ?</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">Id</Setting>
    <Setting Target="Adapter" Name="Query">select Id, Obj, Verbe FROM public.bal</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:postgresql://db:5432/DemoData</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">org.postgresql.Driver</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">/tmp/iris/postgresql-42.2.14.jar</Setting>
  </Item>
  <Item Name="JG" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="JDKVersion">JDK18</Setting>
    <Setting Target="Host" Name="Port">55551</Setting>
  </Item>
  <Item Name="PROC_PUBSUB" Category="" ClassName="PubSub.BP.PubSub" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
