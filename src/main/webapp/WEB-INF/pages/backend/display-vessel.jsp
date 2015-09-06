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
	<div class="panel-heading">Vessels Table</div>
		  <div class="table-responsive">
		  <table id="mytable" class="table table-bordred table-striped">
		  	<thead>
		  			<tr>
		  			<th><input type="checkbox" id="checkall" /></th>
		  			<th class="hidden-phone">Vessel ID</th>
		  			<th>Vessel Name</th>
		  			<th>Vessel Description</th>
		  			<th>Edit</th>                      
                    <th>Delete</th>
                    </tr>
		  		
		  	</thead>
		  	
		  	<tbody>
		  			<c:forEach var="ship" items="${shipList}">
		  				<tr>
		  					<td><input type="checkbox" class="checkthis" /></td>
		  					<td class="hidden-phone">${ship.id}</td>
		  					<td> ${ship.name}</td>
		  					<td> ${ship.description}</td>
		  					<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button data-id="${ship.id}" data-desc="${ship.description}" data-name="${ship.name}" class="editbtn btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    						<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button data-id="${ship.id}" class="delbtn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
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
						<h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
					</div>
					<div class="modal-body">
					<form class="form-horizontal" role="form" method="post" action="/FMS/backend/edit-vessel">
						<div class="form-group">
							<input class="form-control " type="text" placeholder="id" name="id"	id="id" readonly="readonly">
						</div>
					
						<div class="form-group">
							<input class="form-control " type="text" placeholder="name" name="name"	id="name">
						</div>
						<div class="form-group">
							<input id="description" class="form-control " type="text" name="description" placeholder="description">
						</div>
						<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
                            <button id="updatebtn" type="submit" class="btn btn-default">Update</button>
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

						<form class="form-horizontal" role="form" method="post" action="/FMS/backend/delete-vessel">
							<div class="form-group">
							<input class="form-control" type="hidden" placeholder="id" name="id" id="id" readonly="readonly">
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
			$(".editmodel .modal-body #description").val( $(this).data('desc')  );
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
