/// 
Class PubSub.BP.PubSub Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.PubSub.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='Targets' type='EnsLib.PubSub.Target' collection='list' instantiate='0' />
<property name='targetKey' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='AlertDestination' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Publisher' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
</context>
<sequence xend='200' yend='450' >
<call name='Get Subscribers' target='EnsLib.PubSub.PubSubOperation' async='0' xpos='200' ypos='250' >
<request type='EnsLib.PubSub.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='EnsLib.PubSub.Response' >
<assign property="context.Targets" value="callresponse.TargetList" action="set" />
</response>
</call>
<foreach name='Target' property='context.Targets' key='context.targetKey' xpos='200' ypos='350' xend='200' yend='800' >
<scope xpos='200' ypos='250' xend='200' yend='700' >
<call name='Subcriber' target='@context.Targets.GetAt(context.targetKey).Target' async='1' xpos='200' ypos='450' >
<request type='PubSub.Msg.CallbackRequest' >
<assign property="callrequest.Obj" value="$PIECE(request.Topic,&quot;.&quot;,2)" action="set" />
<assign property="callrequest.Id" value="$PIECE(request.Topic,&quot;.&quot;,4)" action="set" />
<assign property="callrequest.Verbe" value="$PIECE(request.Topic,&quot;.&quot;,3)" action="set" />
<assign property="callrequest.URI" value="context.Targets.GetAt(context.targetKey).Address" action="set" />
</request>
<response type='Ens.StringResponse' />
</call>
<faulthandlers>
<catchall xpos='200' ypos='550' xend='200' yend='650' >
<code name='Affecte AlertDestiantion' xpos='200' ypos='250' >
<![CDATA[ if ( $SYSTEM.Status.GetErrorCodes(..%Context.%LastError)="9200") { set context.AlertDestination="Metier" } else
 {
 set context.AlertDestination="Technique"
 }]]>
</code>
<call name='Generate Error' target='Ens.Alert' async='0' xpos='200' ypos='350' >
<request type='Ens.AlertRequest' >
<assign property="callrequest.SourceConfigName" value="..%Process.%ConfigName" action="set" />
<assign property="callrequest.SessionId" value="..%Process.%SessionId" action="set" />
<assign property="callrequest.AlertText" value="$SYSTEM.Status.GetOneStatusText(..%Context.%LastError)" action="set" />
<assign property="callrequest.AlertTime" value="$ZTIMESTAMP" action="set" />
<assign property="callrequest.AlertDestination" value="context.AlertDestination" action="set" />
</request>
<response type='Ens.Response' />
</call>
</catchall>
</faulthandlers>
</scope>
</foreach>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
