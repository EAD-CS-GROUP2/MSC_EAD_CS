<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/template/header.jsp" %>


<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">Manage Shipment</div>
        <div class="panel-body">

            <form class="form-horizontal" role="form" method="post">

                <fieldset class="shipment-border">
                    <legend class="shipment-border">Shipment Details</legend>
                    <div class="form-group">
                        <label for="shipId" class="col-sm-2 control-label">Select Vessel</label>


                        <div class="col-sm-10">
                            <select required class="form-control" id="shipId" name="shipId">
                                <option value="">Select the Ship</option>
                                <c:forEach var="ship" items="${shipList}">
                                    <option value="${ship.id}">${ship.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ShipmentType" class="col-sm-2 control-label">Shipment Type</label>

                        <div class="col-sm-10">
                            <select required class="form-control" name="ShipmentType" id="ShipmentType">
                                <option value="">Select the Shipment Type</option>
                                <option value="Vehicle">Vehicle</option>
                                <option value="Food">Food</option>
                                <option value="Apparel">Apparel</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="itemName" class="col-sm-2 control-label">Item Name</label>

                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="itemName" name="item.itemName"
                                   placeholder="Item Name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="itemDescription" class="col-sm-2 control-label">Item Description</label>

                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="itemDescription"
                                   name="item.itemDescription"
                                   placeholder="itemDescription">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="grossweight" class="col-sm-2 control-label">Gross Weight</label>

                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="grossWeight" name="item.grossWeight"
                                   placeholder="Gross Weight">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="charges" class="col-sm-2 control-label">Shipping Charges (LKR)</label>

                        <div class="col-sm-10">
                            <input readonly type="text" class="form-control" id="charges" name="item.charges"
                                   placeholder="0">
                        </div>
                    </div>
                </fieldset>
                <div class="col-sm-6">
                    <fieldset class="consignee-border">
                        <legend class="consignee-border">Consignee Details</legend>
                        <div class="form-group">
                            <label for="consignee.name" class="col-sm-2 control-label">Consignee Name</label>

                            <div class="col-sm-10">
                                <input required type="text" class="only-text form-control" id="consignee.name"
                                       name="consignee.name"
                                       placeholder="First Name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.address" class="col-sm-2 control-label">Consignee Address</label>

                            <div class="col-sm-10">
                                <input required type="text" class="form-control" id="consignee.address"
                                       name="consignee.address"
                                       placeholder="Address">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.mobilePhone" class="col-sm-2 control-label">Consignee Mobile</label>

                            <div class="col-sm-10">
                                <input pattern="[0-9]{10}" required type="text" class="form-control" id="consignee.mobilePhone"
                                       name="consignee.mobilePhone"
                                       placeholder="Mobile">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.email" class="col-sm-2 control-label">Consignee email</label>

                            <div class="col-sm-10">
                                <input required type="email" class="form-control" id="consignee.email"
                                       name="consignee.email"
                                       placeholder="email">
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="col-sm-6">
                    <fieldset class="consignor-border">
                        <legend class="consignor-border">Consignor Details</legend>
                        <div class="form-group">
                            <label for="consignor.name" class="col-sm-2 control-label">Consignor Name</label>

                            <div class="col-sm-10">
                                <input required type="text" class="only-text form-control" id="consignor.name"
                                       name="consignor.name"
                                       placeholder="First Name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignor.address" class="col-sm-2 control-label">Consignor Address</label>

                            <div class="col-sm-10">
                                <input required type="text" class="form-control" id="consignor.address"
                                       name="consignor.address"
                                       placeholder="Address">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignor.mobilePhone" class="col-sm-2 control-label">Consignor Mobile</label>

                            <div class="col-sm-10">
                                <input pattern="[0-9]{10}" required type="text" class="form-control" id="consignor.mobilePhone"
                                       name="consignor.mobilePhone"
                                       placeholder="Mobile">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignor.email" class="col-sm-2 control-label">Consignor email</label>

                            <div class="col-sm-10">
                                <input required type="email" class="form-control" id="consignor.email"
                                       name="consignor.email"
                                       placeholder="email">
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-10">
                        <button type="submit" class="btn btn-default">Add Shipment</button>
                    </div>
                </div>
            </form>

            <div id="myAlert" class="alert alert-success fade" role="alert" data-alert="alert">Saved! You Shipment ID is
                : ${shipmentid}</div>

        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {

        $('#grossWeight').on('input', function() {
            var calcCharges = $('#grossWeight').val() * 137 ;
            $('#charges').val(calcCharges);
        });


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

<%@ include file="/WEB-INF/template/footer.jsp" %>

