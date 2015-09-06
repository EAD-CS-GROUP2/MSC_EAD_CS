<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/template/header.jsp" %>

<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">Bill of Lading</div>

        <div class="panel-body">


			<c:if test="${not empty shipmentwrap}">	
			
					
				<fieldset class="shipment-border">			
				<div class="col-sm-10">
				<h3>Vessel Info</h3>
				</div>				
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Vessel:</label>
					<p>${shipmentwrap.vesselSchedule.ship.name}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Vessel-Description:</label>
					<p>${shipmentwrap.vesselSchedule.ship.description}</p>
				</div>
				</fieldset>
			
			
			
				<fieldset class="shipment-border">
				<div class="col-sm-10">
				<h3>Route Info</h3>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Departure Date:</label>
					<p>${shipmentwrap.vesselSchedule.deDate}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Arrival Date:</label>
					<p>${shipmentwrap.vesselSchedule.arDate}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Departure Port:</label>
					<p>${shipmentwrap.vesselSchedule.departurePort}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Arrival Port:</label>
					<p>${shipmentwrap.vesselSchedule.arrivalPort}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Status:</label>
					<p>${shipmentwrap.status}</p>
				</div>
				</fieldset>
				
				
				<fieldset class="shipment-border">
				<div class="col-sm-10">
				<h3>Item Info</h3>
				</div>
				
				
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Item Name:</label>
					<p>${shipmentwrap.item.itemName}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Item Description:</label>
					<p>${shipmentwrap.item.itemDescription}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Gross Weight(kg):</label>
					<p>${shipmentwrap.item.grossWeight}</p>
				</div>
				</fieldset>
				
				<div class="col-sm-6">	
				<fieldset class="consignee-border">
				<div class="col-sm-10">
				<h3>Consignee Details</h3>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Consignee Name:&nbsp;</label>
					<br/><p>${shipmentwrap.consignee.name}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Address:&nbsp;</label>
					<br/><p>${shipmentwrap.consignee.address}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Email:&nbsp;</label>
					<br/><p>${shipmentwrap.consignee.email}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Phone:&nbsp;</label>
					<br/><p>${shipmentwrap.consignee.mobilePhone}</p>
				</div>
				</fieldset>
				</div>
				
				<div class="col-sm-6">
				<fieldset class="consignor-border">
				<div class="col-sm-10">
				<h3>Consignor Details</h3>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Consignor Name:&nbsp;</label>
					<br/><p>${shipmentwrap.consignor.name}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Address:&nbsp;</label>
					<br/><p>${shipmentwrap.consignor.address}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Email:&nbsp;</label>
					<br/><p>${shipmentwrap.consignor.email}</p>
				</div>
				<div class="col-sm-10">
					<label for="name" class="col-sm-2 control-label">Phone:&nbsp;</label>
					<br/><p>${shipmentwrap.consignor.mobilePhone}</p>
				</div>
				</fieldset>
				</div>
								
				<div class="col-sm-10"></div>
				<div class="col-sm-10"></div>				
				
					 <div class="print_btn_holder">   
					      <button class="print_btn" type="button" onclick="window.print()" value="Print" class="btn btn-default"><span class="glyphicon glyphicon-print"></span>&nbsp;Print</button>
					</div>
            </c:if>

        </div>

    </div>
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
