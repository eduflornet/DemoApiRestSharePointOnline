$(function () {
    bindDeleteButtonClick();
});
var listName;
function bindDeleteButtonClick() {
    $("#btnSubmitDeleteList").on("click", function () {
        listName = $("#txtListNameDelete").val();
        if (listName) {
            deleteList(listName);
            $("#divDeleteListResults").css("display", "block");
            
        }
        
    });
}

function deleteList(listName) {
    var siteUrl = _spPageContextInfo.webAbsoluteUrl;
    var fullUrl = siteUrl + "/_api/web/lists/GetByTitle('" + listName + "')";
    // http://<DOMAIN>/<SITE>/_api/web/lists/GetByTitle('<LISTNAME>')
    

    $.ajax({
        url: fullUrl,
        type: "POST",
        headers: {
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val(),
            "X-HTTP-Method": "DELETE",
            "IF-MATCH": "*"
        },
        success: onQuerySucceededDeleteList,
        error: onQueryFailedDeleteList
    });
}

function onQuerySucceededDeleteList() {
    $("#divDeleteListResults").html('La lista: <b>' + listName + '</b> se ha borrado con exito! <br/>');
    $("#divDeleteListResults").css("display", "block");
    $("#divCreateListResults").css("display", "none");
    $("#divGetListData").css("display", "none");

}

function onQueryFailedDeleteList(sender, args) {
    alert('Error, no se ha encontrado la lista: '+listName+' para borrar!');
}