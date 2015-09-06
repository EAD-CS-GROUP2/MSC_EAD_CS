
<div id="footer">
    <div class="container">
        <p class="text-muted credit">All Rights Reserved 2015 <a href="#">FMS</a></p>
    </div>
</div>

<!-- Please add any js here -->




<!-- Bootstrap core JavaScript
================================================== -->
<!-- Latest compiled and minified JavaScript -->

<%--<script type='text/javascript' src="../resources/js/jquery-2.1.1.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datepicker/js/bootstrap-datepicker.js"></script>
<%--<script type='text/javascript' src="../resources/js/bootstrap.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/cdnbootstrap.min.js"></script>


<script>
    $('#myFormSubmit').click(function(e){
        e.preventDefault();
        $.post('${pageContext.request.contextPath}/register',
                $('#myForm').serialize(),
                function(data, status, xhr){
//                    alert("saved!");
                    $('#bs-example23').slideDown("fast");
                });
    });
</script>

<script type="text/javascript">
            $(document).ready(
                    function() {
                        $('.datefield').datepicker({format: 'dd/mm/yyyy'});
                    }
            );
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#ship').change(function() {
        $.ajax({
            url : '${pageContext.request.contextPath}/back-office/load-ships',
            data : {
                shipid : $('#ship').val()
            },
            success : function(responseText) {
                console.log(responseText);




                $("#departurePort").val("2015-09-25");
                $("#arrivalPort").val("KOBE");
//                shipSchedule_obj.setDeDate("2015-08-27");
//                shipSchedule_obj.setDeparturePort("HAMBANTOTA");
//                shipSchedule_obj.setDistance(1200);
//                shipSchedule_obj.setId("3");
//                Ship ship	=	new Ship();
//                ship.setDescription("Vehicle carire");
//                ship.setId("2");
//                ship.setName("CINDY");
//                ship.setReferenceId(referenceId);
//
//                shipSchedule_obj.setShip(ship);
//                shipSchedule_obj.setArDate("2015-09-25");
//                shipSchedule_obj.setStatus("Active");


//                $.map($.parseJSON(responseText), function(item) {
//
//                    console.log( { value: item.cityName, data: item.id } );
//                })
            }
        });
    });

    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    var loginSuccess = getParameterByName('auth');
    if (loginSuccess == "false"){
        showAlert();
    }

    function showAlert() {
        $("#myAlert").addClass("in");
    }

//    window.setTimeout(function () {
//        showAlert();
//    }, 3000);

});
</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();



$( "#editbtn" ).click(function() {
    $(".modal-body #name").val( $(this).data('name') );
    $(".modal-body #description").val( $(this).data('desc')  );
});

});
</script>


</body>
</html>
