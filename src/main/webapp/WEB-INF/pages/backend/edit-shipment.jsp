<%@ include file="/WEB-INF/template/header.jsp" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- Begin page content -->
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">Vessels Table</div>
        <div class="table-responsive">
            <table id="mytable" class="table table-bordred table-striped">
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkall"/></th>
                    <th class="hidden-phone">Shipment ID</th>
                    <th>Ship Name</th>
                    <th>Status</th>
                    <th>Delete</th>
                </tr>

                </thead>

                <tbody>

                <c:forEach var="shipment" items="${shipmentList}">
                    <tr>
                        <td><input type="checkbox" class="checkthis"/></td>
                        <td class="hidden-phone">${shipment.shipmentid}</td>
                        <td> ${shipment.vesselSchedule.ship.name}</td>
                        <td> ${shipment.status}</td>
                        <td>
                            <p data-placement="top" data-toggle="tooltip" title="Delete">
                                <button data-id="${shipment.id}" class="btn btn-danger btn-xs delbtn"
                                        data-title="Delete" data-toggle="modal" data-target="#delete"><span
                                        class="glyphicon glyphicon-trash"></span></button>
                            </p>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

        </div>
    </div>

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

                        <form class="form-horizontal" role="form" method="post" action="/FMS/backend/delete-shipment">
                            <div class="form-group">
                                <input class="form-control" id="id" type="hidden" placeholder="id" name="id"
                                       readonly="readonly">
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

            </div>
            <!-- /.modal-content -->
        </div>
    </div>
    <!-- end of del model -->

</div>

<script type="text/javascript">
    $(document).ready(function () {

        $(".editbtn").click(function () {
            $(".modal-body #name").val($(this).data('name'));
            $(".modal-body #description").val($(this).data('desc'));
        });

        $(".delbtn").click(function () {
            console.log($(this).data('id'));
            $(".deletemodel .modal-body #id").val($(this).data('id'));
        });

    });
</script>


<%@ include file="/WEB-INF/template/footer.jsp" %>