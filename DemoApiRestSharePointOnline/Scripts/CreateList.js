$(function () {
    bindCreateButtonClick();
});

function bindCreateButtonClick() {
    $("#btnSubmitCreateList").on("click", function () {
        var listName = $("#txtListNameCreate").val();
        if (listName) {
            createList(listName);
            $("#divCreateListResults").css("display", "block");
        }
        
    });
}

function createList(listName) {
    var siteUrl = _spPageContextInfo.webAbsoluteUrl;
    var fullUrl = siteUrl + "/_api/web/lists";

    $.ajax({
        url: fullUrl,
        type: "POST",
        data: JSON.stringify({
            '__metadata': { 'type': 'SP.List' },
            'BaseTemplate': 100,
            'Title': listName
        }),
        headers: {
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val()
        },
        success: onQuerySucceededCreateList,
        error: onQueryFailedCreateList
    });
}

function onQuerySucceededCreateList(data) {
    $("#divCreateListResults").html('La lista: <b>' + data.d.Title + '</b> se ha creado con exito!<br/>');
    $("#divCreateListResults").css("display", "block");
    $("#divDeleteListResults").css("display", "none");
    $("#divGetListData").css("display", "none");
    
}

function onQueryFailedCreateList() {
    alert('Error, no se ha podido crear la lista!');
}