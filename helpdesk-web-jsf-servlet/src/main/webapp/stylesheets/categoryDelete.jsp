<%@include file="_include.jsp"%>
<e:page stringsVar="msgs" menuItem="departments"
	locale="#{sessionController.locale}"
	authorized="#{departmentsController.currentUserCanManageDepartmentCategories}">
	<%@include file="_navigation.jsp"%>

	<e:form 
		freezeScreenOnSubmit="#{sessionController.freezeScreenOnSubmit}" 
		showSubmitPopupText="#{sessionController.showSubmitPopupText}" 
		showSubmitPopupImage="#{sessionController.showSubmitPopupImage}" 
		id="categoryDeleteForm">
		<e:panelGrid columns="2" columnClasses="colLeft,colRight" width="100%" >
			<e:section value="#{msgs['CATEGORY_DELETE.TITLE']}">
				<f:param value="#{departmentsController.categoryToUpdate.department.label}" />
				<f:param value="#{departmentsController.categoryToUpdate.label}" />
			</e:section>
			<h:panelGroup>
				<h:panelGroup style="cursor: pointer" onclick="simulateLinkClick('categoryDeleteForm:cancelButton');" >
					<e:bold value="#{msgs['_.BUTTON.CANCEL']} " />
					<t:graphicImage value="/media/images/back.png"
						alt="#{msgs['_.BUTTON.CANCEL']}" 
						title="#{msgs['_.BUTTON.CANCEL']}" />
				</h:panelGroup>
				<e:commandButton id="cancelButton" action="cancel"
					value="#{msgs['_.BUTTON.CANCEL']}" immediate="true" />
			</h:panelGroup>
		</e:panelGrid>
		<e:messages />
		<e:paragraph value="#{msgs['CATEGORY_DELETE.TEXT.TOP']}" />
		<h:panelGroup
			rendered="#{departmentsController.moveCategoryTree != null}">
			<t:tree2 id="tree" value="#{departmentsController.moveCategoryTree}"
				var="node" varNodeToggler="t" clientSideToggle="true"
				showRootNode="true">
				<f:facet name="root">
					<h:panelGroup >
						<t:graphicImage value="/media/images/root-opened.png" rendered="#{t.nodeExpanded}" />
						<t:graphicImage value="/media/images/root-closed.png" rendered="#{!t.nodeExpanded}" />
						<e:italic value=" #{msgs['CATEGORY_DELETE.TEXT.ROOT_LABEL']}" />
					</h:panelGroup>
				</f:facet>
				<f:facet name="department">
					<h:panelGroup>
						<t:graphicImage value="#{departmentIconUrlProvider[node.department]}" />
						<e:text value=" #{msgs['CATEGORY_DELETE.TEXT.DEPARTMENT_LABEL']}">
							<f:param value="#{node.department.label}" />
						</e:text>
					</h:panelGroup>
				</f:facet>
				<f:facet name="category">
					<h:panelGroup>
						<t:graphicImage value="#{categoryIconUrlProvider[node.category]}" />
						<h:panelGroup
							style="cursor: pointer" 
							onclick="simulateLinkClick('categoryDeleteForm:tree:#{node.identifier}:selectButton');" >
							<e:bold 
								value=" #{msgs['CATEGORY_DELETE.TEXT.CATEGORY_LABEL']}" >
								<f:param value="#{node.category.label}" />
							</e:bold>
						</h:panelGroup>
						<e:commandButton value="->" id="selectButton" style="display: none"
							action="#{departmentsController.moveTicketsAndDeleteCategory}">
							<t:updateActionListener value="#{node.department}"
								property="#{departmentsController.targetDepartment}" />
							<t:updateActionListener value="#{node.category}"
								property="#{departmentsController.targetCategory}" />
						</e:commandButton>
					</h:panelGroup>
				</f:facet>
			</t:tree2>
		</h:panelGroup>
		<h:panelGroup
			style="cursor: pointer" 
			onclick="simulateLinkClick('categoryDeleteForm:deleteButton');" >
			<e:bold 
				value="#{msgs['CATEGORY_DELETE.BUTTON.ALSO_DELETE_TICKETS']} " />
			<t:graphicImage value="/media/images/delete.png" />
		</h:panelGroup>
		<e:commandButton id="deleteButton" 
			value="#{msgs['CATEGORY_DELETE.BUTTON.ALSO_DELETE_TICKETS']}"
			action="#{departmentsController.moveTicketsAndDeleteCategory}">
			<t:updateActionListener value="#{null}"
				property="#{departmentsController.targetCategory}" />
		</e:commandButton>
	</e:form>
	<t:aliasBean alias="#{controller}" value="#{null}" >
		<%@include file="_signature.jsp"%>
	</t:aliasBean>
	<script type="text/javascript">
		hideButton("categoryDeleteForm:cancelButton");
		hideButton("categoryDeleteForm:deleteButton");
</script>
</e:page>
