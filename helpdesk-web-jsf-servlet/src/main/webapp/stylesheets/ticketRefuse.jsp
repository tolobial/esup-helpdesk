<%@include file="_include.jsp"%>
<%@ taglib prefix="fck" uri="http://www.fck-faces.org/fck-faces"%>
<e:page stringsVar="msgs" menuItem=""
	locale="#{sessionController.locale}"
	authorized="#{ticketController.userCanRefuse}">
	<%@include file="_navigation.jsp"%>

	<e:form 
		freezeScreenOnSubmit="#{sessionController.freezeScreenOnSubmit}" 
		showSubmitPopupText="#{sessionController.showSubmitPopupText}" 
		showSubmitPopupImage="#{sessionController.showSubmitPopupImage}" 
		id="ticketActionForm" enctype="multipart/form-data" >
		<e:panelGrid columns="2" width="100%" columnClasses="colLeft,colRight">
			<e:section value="#{msgs['TICKET_ACTION.TITLE.REFUSE']}" >
				<f:param value="#{ticketController.ticket.id}" />
			</e:section>
			<%@include file="_ticketActionCancel.jsp"%>
		</e:panelGrid>
		<e:messages />
		<e:panelGrid columns="3" width="100%" columnClasses="colLeftMax,colRightNowrap,colRightNowrap">
			<e:paragraph value="#{msgs['TICKET_ACTION.TEXT.REFUSE']}" />
			<%@include file="_ticketActionResponses.jsp"%>
			<%@include file="_ticketActionUpload.jsp"%>
		</e:panelGrid>
		<fck:editor  
			id="actionMessage" 
			value="#{ticketController.actionMessage}" 
			toolbarSet="actionMessage" />
		<e:panelGrid columns="2" columnClasses="colLeftNowrap,colRightMaxNowrap" width="100%" >
			<h:panelGroup id="mainButtonGroup" style="position: absolute; white-space: nowrap;" >
				<h:panelGroup style="cursor: pointer" onclick="simulateLinkClick('ticketActionForm:actionButton');" >
					<e:bold value="#{msgs['TICKET_ACTION.BUTTON.REFUSE']} " />
					<t:graphicImage value="/media/images/refuse.png" />
				</h:panelGroup>
				<e:commandButton 
					id="actionButton" style="display: none"
					value="#{msgs['TICKET_ACTION.BUTTON.REFUSE']}"
					action="#{ticketController.doRefuse}" />
			</h:panelGroup>
			<h:panelGroup>
				<%@include file="_ticketActionSpentTime.jsp"%>
				<%@include file="_ticketActionScope.jsp"%>
				<%@include file="_ticketActionPreviewButton.jsp"%>
			</h:panelGroup>
		</e:panelGrid>
		<%@include file="_ticketActionPreview.jsp"%>
		<%@include file="_ticketActionHistory.jsp"%>
	</e:form>
	<t:aliasBean alias="#{controller}" value="#{null}" >
		<%@include file="_signature.jsp"%>
	</t:aliasBean>
	<%@include file="_ticketActionJavascript.jsp"%>
</e:page>

