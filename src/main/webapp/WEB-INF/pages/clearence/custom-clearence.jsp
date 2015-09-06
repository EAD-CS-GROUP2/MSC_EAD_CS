<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="container">

 <div class="panel panel-primary">
	<div class="panel-heading">Shipments</div>
	
	
	<div class="table-responsive">
		  <table id="mytable" class="table table-bordred table-striped">
		  	<thead>
		  			<tr>
		  			<th><input type="checkbox" id="checkall" /></th>
		  			<th class="hidden-phone">Shipment ID</th>
		  			<th>Item Name</th>
		  			<th>Item Description</th>
		  			<th>Shipment Status</th>
		  			<th>Clear Item</th>                      
                    
                    </tr>
		  		
		  	</thead>
		  	
		  	<tbody>
		  			<c:forEach var="shipment" items="${shipments}">
		  				<tr>
		  					<td><input type="checkbox" class="checkthis" /></td>
		  					<td class="hidden-phone">${shipment.shipmentid}</td>
		  					<td> ${shipment.item.itemName}</td>
		  					<td> ${shipment.item.itemDescription}</td>
		  					<td> ${shipment.status}</td>
		  					<td><p data-placement="top"  title="Edit"><button data-id="${shipment.shipmentid}" data-item="${shipment.item.itemName}" data-desc="${shipment.item.itemDescription}" data-status="${shipment.status}" class="editbtn btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-ok-sign"></span></button></p></td>
    						
		  				</tr>
		  			</c:forEach>
		  	</tbody>
		  
		  </table>
		  
		  

		</div>
		
		
		<!-- Edit model -->

		<div class="modal fade editmodel" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
			
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Clear Shipment</h4>
					</div>
					<div class="modal-body">
					<form class="form-horizontal" role="form" method="post" action="/FMS/clearence/item-clearence">
						<div class="form-group">
							Reference #
							<input class="form-control " type="text" placeholder="id" name="id"	id="id" readonly="readonly">
						</div>				
						
						<div class="form-group">
							 Bill of Lading<br/>
							<input required type="radio" name="bol" value="available" checked>Available&nbsp;&nbsp; 
							<input type="radio" name="bol" value="notavai" checked>Not Available						
						</div>
						<div class="form-group">
							Customer Identity<br/>
							<input required type="radio" name="cus" value="available" checked>Available&nbsp;&nbsp; 
							<input type="radio" name="cus" value="notavai" checked>Not Available						
						</div>
						<div class="form-group">
							 Tax Paid<br/>
							 <input required type="radio" name="tax" value="available" checked>Yes&nbsp;&nbsp; 
							<input type="radio" name="tax" value="notavai" checked>No							
						</div>
						
						<div class="form-group">
                                <label for="ship" class="col-sm-2 control-label">Status</label>
                                <div class="col-sm-10">
                                    <select required class="form-control" id="status" name="status">
                                    	<option value=""></option>                                        
                                       <option value="clear">Clear</option>
                                        <option value="reject">Reject</option> 
                                    </select>
                                </div>
                            </div>
						
						<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
                            <button id="updatebtn" type="submit" class="btn btn-default">Submit</button>
                        </div>
						</div>
						
					</form>
					</div>
				</div>
				
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		
		<!-- end of edit model -->
	
	
	

</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){

		$( ".editbtn" ).click(function() {
			$(".editmodel .modal-body #name").val( $(this).data('name') );
			$(".editmodel .modal-body #description").val( $(this).data('desc')  );
			$(".editmodel .modal-body #id").val( $(this).data('id')  );
		});

	});
</script>

<%@ include file="/WEB-INF/template/footer.jsp"%>