<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ include file="/WEB-INF/template/header.jsp"%>

        
        <div class="container">
        <div class="panel panel-primary">
			<div class="panel-heading">Add Schedule</div>
        <div class="panel-body">
            
                        <form class="form-horizontal" role="form" method="post">
                            <div class="form-group">
                                <label for="ship" class="col-sm-2 control-label">Select Vessel</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="ship" name="ship.id">
                                        <c:forEach var="ship" items="${shipList}">
                                            <option value="${ship.id}">${ship.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="departurePort" class="col-sm-2 control-label">Port of Departure</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="departurePort" name="departurePort" placeholder="Port of Departure">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="arrivalPort" class="col-sm-2 control-label">Port of Arrival</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="arrivalPort" name="arrivalPort" placeholder="Port of Arrival">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="deDate" class="col-sm-2 control-label">Departure Date</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control datefield bfh-datepicker" id="deDate" name="deDate" placeholder="Departure Date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="arDate" class="col-sm-2 control-label">Arrival Date</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control datefield bfh-datepicker" id="arDate" name="arDate" placeholder="Arrival Date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="distance" class="col-sm-2 control-label">Distance</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="distance" name="distance" placeholder="Distance (km)">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Create</button>
                                </div>
                            </div>
                        </form>
                        <div id="myAlert" class="alert alert-success fade" role="alert" data-alert="alert">Schedule Created Successfully !</div>
                       </div>
                   </div>
                   </div>
        
 <script type="text/javascript" src="<c:url value="/resources/js/jquery.autocomplete.min.js"/>"/></script>       
<!-- auto complete -->
<script type="text/javascript">

$(document).ready(function() {
	
	$('#departurePort').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/ajax/getPorts',
		paramName: "arrivalPort",
		delimiter: ",",
	   transformResult: function(response) {
 
		return {      	
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {
 
		      return { value: item, data: item};
		   })
 
		 };
 
            }
 
	 });
	
});

</script>
<script type="text/javascript">

$(document).ready(function() {
	
	$('#arrivalPort').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/ajax/getPorts',
		paramName: "arrivalPort",
		delimiter: ",",
	   transformResult: function(response) {
 
		return {      	
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {
 
		      return { value: item, data: item};
		   })
 
		 };
 
            }
 
	 });
	
});

</script>

<script type="text/javascript">
    $(document).ready(function () {

        
        var loginSuccess = '${success}';
        console.log(loginSuccess);
        if (loginSuccess == "true") {
            showAlert();
            console.log(loginSuccess);
        } else {
            $('#myAlert').hide();
        }

        function showAlert() {
            $("#myAlert").addClass("in");

        }

    });
</script>
    
<%@ include file="/WEB-INF/template/footer.jsp"%>

