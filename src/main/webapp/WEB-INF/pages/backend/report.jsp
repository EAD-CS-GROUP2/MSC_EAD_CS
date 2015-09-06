<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="edu.msc.fts.model.Status" %>
<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- Begin page content -->
    <div class="container">
        <div class="page-header">
            <br>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Latest Shipments</h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table no-margin">
                                <thead>
                                <tr>
                                    <th>Shipment ID</th>
                                    <th>Ship Name</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="shipment" items="${lastfiveshipmentlist}">
                                    <tr>
                                        <td class="hidden-phone">${shipment.shipmentid}</td>
                                        <td> ${shipment.vesselSchedule.ship.name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${shipment.status == 'Pending dispatch customs'}">
                                                    <span class="label label-info">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Pending receiving customs'}">
                                                    <span class="label label-info">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Customs rejected'}">
                                                    <span class="label label-danger">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Pending shipping'}">
                                                    <span class="label label-info">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Shipment on time'}">
                                                    <span class="label label-success">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Shipment delayed'}">
                                                    <span class="label label-warning">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Ready for pickup'}">
                                                    <span class="label label-success">${shipment.status}</span>
                                                </c:when>
                                                <c:when test="${shipment.status == 'Delivered'}">
                                                    <span class="label label-success">${shipment.status}</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                    </div><!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <a href="/FMS/backend/manage-vessel" class="btn btn-sm btn-info btn-flat pull-left">Place New Shipment</a>
                    </div><!-- /.box-footer -->
                </div><!-- /.box -->
            </div>

            <div class="col-md-6">
                <div class="box box-info">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Top Shipment Ports</h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="chart-responsive">
                                        <canvas id="pieChart" height="150"></canvas>
                                    </div><!-- ./chart-responsive -->
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.box -->
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Monthly Shipment Recap Report</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-8">
                                <p class="text-center">
                                    <strong>01-01-2015 -
                                        <%= new SimpleDateFormat("MM-dd-yyyy").format(new Date()) %>
                                    </strong>
                                </p>
                                <div class="chart">
                                    <!-- Sales Chart Canvas -->
                                    <canvas id="salesChart" style="height: 180px;"></canvas>
                                </div><!-- /.chart-responsive -->
                            </div><!-- /.col -->
                            <div class="col-md-4">
                                <p class="text-center">
                                    <strong>Shipment Status (Status/Total)</strong>
                                </p>
                                <div class="progress-group">
                                    <span class="progress-text">Delivered</span>
                                    <span class="progress-number"><b>200</b>/500</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
                                    </div>
                                </div><!-- /.progress-group -->
                                <div class="progress-group">
                                    <span class="progress-text">Pending</span>
                                    <span class="progress-number"><b>50</b>/500</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-red" style="width: 80%"></div>
                                    </div>
                                </div><!-- /.progress-group -->
                                <div class="progress-group">
                                    <span class="progress-text">Shipped</span>
                                    <span class="progress-number"><b>200</b>/500</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-green" style="width: 80%"></div>
                                    </div>
                                </div><!-- /.progress-group -->
                                <div class="progress-group">
                                    <span class="progress-text">Clearance</span>
                                    <span class="progress-number"><b>50</b>/500</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-yellow" style="width: 80%"></div>
                                    </div>
                                </div><!-- /.progress-group -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- ./box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Chart-fts.js"></script>
<%@ include file="/WEB-INF/template/footer.jsp"%>