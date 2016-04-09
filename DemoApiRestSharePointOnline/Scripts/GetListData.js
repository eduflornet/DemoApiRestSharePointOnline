
function getListData() {
    var siteUrl = _spPageContextInfo.webAbsoluteUrl;
    var fullUrl = siteUrl + "/_api/web/lists";
    // http://<DOMAIN>/<SITE>/_api/web/lists

    $.ajax({
        url: fullUrl,
        type: "GET",
        headers: {
            "accept": "application/json;odata=verbose",
        },
        success: onQuerySucceededGetList,
        error: onQueryFailedGetList
    });
}

function onQuerySucceededGetList(data) {
    var listItemInfo = '';
    listItemInfo += '<br/><b>Resultado de Obtener Lista:</b><br/>';
    $.each(data.d.results, function (key, value) {
        listItemInfo += 'Titulo: ' + value.Title + ' - Creado: ' +
            value.Created + '<br />';
    });
    
    $("#divGetListData").html(listItemInfo);
    
}

function onQueryFailedGetList() {
    alert('Error!');
}