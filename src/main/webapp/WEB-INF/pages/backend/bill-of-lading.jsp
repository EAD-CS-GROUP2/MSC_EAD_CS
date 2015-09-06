<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ include file="/WEB-INF/template/header.jsp"%>

<div class="container">
<div class="panel panel-primary">

			<div class="panel-heading">Generate Bill of Lading</div>
			
        <div class="panel-body">
        
        <form class="form-horizontal" role="form" method="post">
        
        	<div class="form-group">
                                <label for="departurePort" class="col-sm-2 control-label">Shipment Reference</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="referenceid" name="referenceid" placeholder="Reference ID">
                                </div>
            </div>
            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">Generate</button>
                                </div>
             </div>
        
        
        </form>
        
        
        </div>

</div>
</div>

<%@ include file="/WEB-INF/template/footer.jsp"%>