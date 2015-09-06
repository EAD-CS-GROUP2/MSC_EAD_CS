/**
 * Searching for schedules.
 */
function search() {
    var formDataString = $('#search-form').serialize();
    $.ajax({
        type: "GET",
        url: "searchSchedule",
        data: formDataString,
        dataType: 'html',
        success: function(html) {
            $('#schedule-items').html(html);
        }
    });
}