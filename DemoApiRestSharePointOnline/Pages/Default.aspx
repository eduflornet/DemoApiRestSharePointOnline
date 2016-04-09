<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" ></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/GetListData.js"></script>
    <script type="text/javascript" src="../Scripts/CreateList.js"></script>
    <script type="text/javascript" src="../Scripts/DeleteList.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Uso de API REST en SharePoint Online
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

     <div class="btn-group" role="group" aria-label="...">
     <button type="button" id="btnGetListData" class="btn btn-default">Obtener Lista</button>
     <button type="button" id="btnCreateList" class="btn btn-default">Crear Lista</button>
        <button type="button" id="btnDeleteList" class="btn btn-default">Borrar Lista</button>
    </div>

    <br/>
    
    <div id="divGetListData"></div>

    <div id="divCreateList" style="display: none">
    <br/>
    <strong>Introduce el nombre de la lista a crear:</strong>
    <input type="text" id="txtListNameCreate" />
    <input type="button" id="btnSubmitCreateList" value="Crear" />
</div>
<div id="divCreateListResults" style="display: none"></div>

    <div id="divDeleteList" style="display: none">
    <br/>
    <strong>Introduce el nombre de la lista a borrar:</strong>
    <input type="text" id="txtListNameDelete" />
    <input type="button" id="btnSubmitDeleteList" value="Borrar" />
</div>
<div id="divDeleteListResults" style="display: none"></div>
    

   <script type="text/javascript">
       $("#btnGetListData").click(function () {
           getListData();
           $("#divGetListData").css("display", "block");
           $("#divCreateList").css("display", "none");
           $("#divDeleteList").css("display", "none");
           $("#divCreateListResults").css("display", "none");
           $("#divDeleteListResults").css("display", "none");
       });

       $("#btnCreateList").click(function () {
           $("#divCreateList").css("display", "block");
           $("#divDeleteList").css("display", "none");
           $("#divDeleteListResults").css("display", "none");
           $("#divGetListData").css("display", "none");
       });

       $("#btnDeleteList").click(function () {
           $("#divDeleteList").css("display", "block");
           $("#divCreateList").css("display", "none");
           $("#divCreateListResults").css("display", "none");
           $("#divGetListData").css("display", "none");
       });
   </script>

</asp:Content>
