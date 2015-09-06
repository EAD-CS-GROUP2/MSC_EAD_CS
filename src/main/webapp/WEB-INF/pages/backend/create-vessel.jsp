<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Begin page content -->
<div class="container">
  
    <div class="panel panel-primary">
        <div class="panel-heading">Add Vessel</div>
        <div class="panel-body">

           


                <form class="form-horizontal" role="form" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="name" name="name" placeholder="Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="description" name="description" placeholder="Description">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Add</button>
                        </div>
                    </div>
                </form>
			<div id="myAlert" class="alert alert-success fade" role="alert" data-alert="alert">Vessel Details Saved Successfully !</div>
        </div>
    </div>


</div>
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




