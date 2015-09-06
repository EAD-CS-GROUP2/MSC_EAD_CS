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
	<div class="panel-heading">Schedule Table</div>
		  <div class="table-responsive">
		  <table id="mytable" class="table table-bordred table-striped">		  
		  <thead>
		  			<tr>
		  			<th><input type="checkbox" id="checkall" /></th>
		  			<th class="hidden-phone">Schedule ID</th>
		  			<th>VesselName</th>
		  			<th>DepartureDate</th>
		  			<th>ArrivalDate</th>
		  			<th>DeparturePort</th>
		  			<th>ArrivalPort</th>
		  			<th>Distance(km)</th>
		  			<th>Edit</th>                      
                    <th>Delete</th>
                    </tr>
		  		
		  	</thead>
		  		<tbody>		  	
		  		
		  			<c:forEach var="schedule" items="${scheduleList}">
		  				<tr>
		  					<td><input type="checkbox" class="checkthis" /></td>
		  					<td class="hidden-phone">${schedule.id}</td>
		  					<td>${schedule.ship.name}</td>
		  					<td> ${schedule.deDate}</td>
		  					<td> ${schedule.arDate}</td>
		  					<td> ${schedule.departurePort}</td>
		  					<td> ${schedule.arrivalPort}</td>		  					
		  					<td> ${schedule.distance}</td>		  					
		  					<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button 
		  					data-id="${schedule.id}" data-ddate="${schedule.deDate}" data-adate="${schedule.arDate}" data-aport="${schedule.arrivalPort}" data-dport="${schedule.departurePort}" data-distance="${schedule.distance}"
		  					data-name="${schedule.ship.name}" class="editbtn btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    						<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button data-id="${schedule.id}" class="delbtn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
		  				</tr>
		  			</c:forEach>
		  		
		  	
		  	</tbody>
		  
		  </table>
</div>
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
						<h4 class="modal-title custom_align" id="Heading">Edit Your
							Detail</h4>
					</div>
					<div class="modal-body">
					<form class="form-horizontal" role="form" method="post" action="/FMS/backend/edit-schedule">
						<div class="form-group">
							<input class="form-control " type="text" placeholder="id" name="id"	id="id" readonly="readonly">
						</div>
					
						<div class="form-group">
							<input class="form-control " type="text" placeholder="name" name="name"	id="name" readonly="readonly">
						</div>
						<div class="form-group">
							<input id="dport" class="form-control " type="text" name="departurePort">
						</div>
						<div class="form-group">
							<input id="aport" class="form-control " type="text" name="arrivalPort">
						</div>
						<div class="form-group">
							<input id="ddate" class="form-control " type="text" name="deDate">
						</div>
						<div class="form-group">
							<input id="adate" class="form-control " type="text" name="arDate">
						</div>
						<div class="form-group">
							<input id="distance" class="form-control " type="text" name="distance">
						</div>
						<div class="form-group">						
						<div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Update</button>
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

<!-- Delete model -->
		<div class="modal fade deletemodel" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">
					
						<div class="alert alert-danger">
							
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?

						<form class="form-horizontal" role="form" method="post" action="/FMS/backend/delete-schedule">
						
							<div class="form-group">
							<input class="form-control " type="hidden" placeholder="id" name="id"	id="id" readonly="readonly">
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">								
									

									<button type="submit" class="btn btn-success">
										<span class="glyphicon glyphicon-ok-sign"></span>Yes
									</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">
										<span class="glyphicon glyphicon-remove"></span>No
									</button>

								</div>
							</div>

						</form>
											</div>

					</div>
					<div class="modal-footer ">
						
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
</div>
			<!-- end of del model -->

</div>

<script type="text/javascript">
	$(document).ready(function(){
		 
		$( ".editbtn" ).click(function() {
			$(".editmodel .modal-body #name").val( $(this).data('name') );
			$(".editmodel .modal-body #ddate").val( $(this).data('ddate')  );
			$(".editmodel .modal-body #adate").val( $(this).data('adate')  );
			$(".editmodel .modal-body #aport").val( $(this).data('aport')  );
			$(".editmodel .modal-body #dport").val( $(this).data('dport')  );
			$(".editmodel .modal-body #distance").val( $(this).data('distance')  );
			$(".editmodel .modal-body #id").val( $(this).data('id')  );
		});

	});
</script>

<script type="text/javascript">
	$(document).ready(function(){

		$( ".delbtn" ).click(function() {			
			$(".deletemodel .modal-body #id").val( $(this).data('id')  );
		});

	});
</script>


<%@ include file="/WEB-INF/template/footer.jsp"%>