/// 
Class PubSub.BP.Local Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='PubSub.Msg.CallbackRequest' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='Formation' type='PubSub.Obj.Formation' instantiate='0' />
</context>
<sequence xend='200' yend='489' >
<call name='Get Detail' target='PubSub.BO.RemoteBDD' async='0' xpos='355' ypos='242' >
<request type='PubSub.Msg.FormationSelectRequest' >
<assign property="callrequest.Id" value="request.Id" action="set" />
</request>
<response type='PubSub.Msg.FormationSelectResponse' >
<assign property="context.Formation" value="callresponse.Formation" action="set" />
</response>
</call>
<call name='Insert Local' target='PubSub.BO.Local' async='1' xpos='332' ypos='362' >
<request type='PubSub.Msg.FormationInsertRequest' >
<assign property="callrequest.Formation" value="context.Formation" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}


}
