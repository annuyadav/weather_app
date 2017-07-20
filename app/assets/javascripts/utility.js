function display_notice(key, msg) {
    new PNotify({
        type: key,
        text: msg,
        delay: 3000
    });
}

$(document).ajaxComplete(function (event, request) {
    var msg = request.getResponseHeader('X-Message');
    var type = request.getResponseHeader('X-Message-Type');
    if (type != null)display_notice(type, msg); //use whatever popup, notification or whatever plugin you want
});