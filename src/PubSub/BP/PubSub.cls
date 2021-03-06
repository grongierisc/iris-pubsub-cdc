/// 
Class PubSub.BP.PubSub Extends Ens.BusinessProcessBPL
{


/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='PubSub.Msg.CallbackRequest' response='Ens.Response' height='2000' width='2000' >
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
<assign property="callrequest.Message" value="request" action="set" />
<assign property="callrequest.Topic" value="request.Id_&quot;.&quot;_request.Verbe_&quot;.&quot;_request.Obj" action="set" />
<assign property="callrequest.DomainName" value="&quot;PubSub&quot;" action="set" />
</request>
<response type='EnsLib.PubSub.Response' >
<assign property="context.Targets" value="callresponse.TargetList" action="set" />
</response>
</call>
<foreach name='Target' property='context.Targets' key='context.targetKey' xpos='200' ypos='350' xend='200' yend='700' >
<scope xpos='200' ypos='250' xend='200' yend='600' >
<call name='Subcriber' target='@context.Targets.GetAt(context.targetKey).Target' async='1' xpos='200' ypos='350' >
<request type='PubSub.Msg.CallbackRequest' >
<assign property="callrequest.URI" value="context.Targets.GetAt(context.targetKey).Address" action="set" />
<assign property="callrequest.Verbe" value="request.Verbe" action="set" />
<assign property="callrequest.Id" value="request.Id" action="set" />
<assign property="callrequest.Obj" value="request.Obj" action="set" />
</request>
<response type='Ens.StringResponse' />
</call>
<faulthandlers>
<catchall xpos='200' ypos='450' xend='200' yend='450' >
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

}
