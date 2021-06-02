Class PubSub.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="PubSub.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PubSub.BS.PollingBal" Category="" ClassName="PubSub.BS.PollingBal" PoolSize="1" Enabled="true" Foreground="false" Comment="Générateur de callback pour Oscar" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">PubSub.BP.PubSub</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">delete FROM public.bal where id = ?</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">id</Setting>
    <Setting Target="Adapter" Name="Query">select id, obj,verbe FROM public.bal</Setting>
    <Setting Target="Adapter" Name="Credentials">PostgresDB</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:postgresql://db:5432/DemoData</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">/tmp/iris/postgresql-42.2.14.jar</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">org.postgresql.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JG</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
  </Item>
  <Item Name="JG" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PubSub.BP.PubSub" Category="" ClassName="PubSub.BP.PubSub" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="PubSub.BO.RestCallback" Category="" ClassName="PubSub.BO.RestCallback" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PubSub.BO.RemoteBDD" Category="" ClassName="PubSub.BO.RemoteBDD" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">PostgresDB</Setting>
    <Setting Target="Adapter" Name="JGService">JG</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:postgresql://db:5432/DemoData</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">org.postgresql.Driver</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">/tmp/iris/postgresql-42.2.14.jar</Setting>
  </Item>
  <Item Name="PubSub.BO.Local" Category="" ClassName="PubSub.BO.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PubSub.BP.Local" Category="" ClassName="PubSub.BP.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PubSub.BS.RESTServiceCallBack" Category="" ClassName="PubSub.BS.RESTServiceCallBack" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
