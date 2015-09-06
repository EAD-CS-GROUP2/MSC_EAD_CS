<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FMS</title>

    <script src="${pageContext.request.contextPath}/resources/js/cdnjquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cdnbootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cdnbootstrap-theme.min.css">

    <!-- create schedule -->

    <meta name="generator" content="Bootply"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/resources/datepicker/css/datepicker.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/Admin.min.css" rel="stylesheet"/>


    <style>
        /* Sticky footer styles
-------------------------------------------------- */
        html,
        body {
            height: 100%;
            /* The html and body elements cannot have any padding or margin. */
        }

            /* Wrapper for page content to push down footer */
        #wrap {
            min-height: 100%;
            height: auto !important;
            height: 100%;
            /* Negative indent footer by its height */
            margin: 0 auto -60px;
            /* Pad bottom by footer height */
            padding: 0 0 60px;
        }

        /* Set the fixed height of the footer here */
        #footer {
            height: 60px;
            background-color: #f5f5f5;
        }

        /* Custom page CSS
        -------------------------------------------------- */
        /* Not required for template or sticky footer method. */

        #wrap > .container {
            padding: 60px 15px 0;
        }

        .container .credit {
            margin: 20px 0;
        }

        #footer > .container {
            padding-left: 15px;
            padding-right: 15px;
        }

        code {
            font-size: 80%;
        }
    </style>
</head>

<body>
<spring:htmlEscape defaultHtmlEscape="true"/>

<!-- Wrap all page content here -->
<div id="wrap">

    <!-- Button trigger modal -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">About FMS.</h4>
                </div>
                <div class="modal-body">
                    <p>MSc. EAD - Case Studies - Group 2</p>
                </div>
                <div class="modal-footer">
                    <p class="text-muted credit">All Rights Reserved 2015</p>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



	




    <!-- Modal -->
    
     
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add New User</h4>
                </div>

                <c:if test="${not empty successMsg}">
                    <c:choose>
                        <c:when test="${successMsg=='Record saved Successfully!'}">
                            <div class="alert alert-success">${successMsg}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-danger"></div>
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <div id="bs-example23" class="bs-example" style="display: none;">
                    <div class="alert alert-block alert-success fade in">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4>User saved successfully!</h4>
                    </div>
                </div><!-- /example -->

                <form id="myForm" method="POST" commandName="register">
                <div class="modal-body">

                                <table border="0">
                                    <tr>
                                        <td>Username</td>
                                        <td><input name="username" type="text" class="form-control" placeholder="" autofocus ></td>
                                    </tr>
                                    <tr>
                                        <td>Role</td>
                                        <td>
                                            <select class="form-control" id="role" name="role">
                                                <option value="2">Back-office Staff</option>
                                                <option value="1">Authorized Customer</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><input name="password" type="password" class="form-control" placeholder="" ></td>
                                    </tr>
                                    <%--<tr>--%>
                                        <%--<td>Confirm Pass</td>--%>
                                        <%--<td><input name="pass2" type="text" class="form-control" placeholder="" ></td>--%>
                                    <%--</tr>--%>
                                </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button id="myFormSubmit" type="button" class="btn btn-primary">Save changes</button>


                </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/FMS/main"">FMS</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vessel Management<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/FMS/backend/create-vessel">Add Vessel</a></li>
                            <li><a href="/FMS/backend/display-vessels">Edit Vessel Info</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Schedule Management<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/FMS/backend/create-schedule">Create Schedules</a></li>
                            <li><a href="/FMS/backend/display-schedule">Edit Schedules</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shipment Management<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/FMS/backend/manage-vessel">One Time Shipment</a></li>
                            <li><a href="/FMS/backend/manage-vessel">Registered User Shipment</a></li>
                            <li><a href="/FMS/backend/edit-shipment">Edit Shipment</a></li>
                            <li><a href="/FMS/clearence/custom-clearence">Clearence</a></li>
                        </ul>
                    </li>
                    <li><a href="/FMS/backend/bill-of-lading">Generate Bill of Lading</a></li>
                    <li><a href="/FMS/tracking">Tracking</a></li>
                    <li><a href="/FMS/report/report">Reports</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a data-toggle="modal" href="#myModal">Create New User</a></li>
                            <li class="divider"></li>
                            <li><a data-toggle="modal" href="#myModal2">About.</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-tree-deciduous"></span>
                        Logged as : <b>${sessionScope.loggedUser}</b></a></li>
                    <li class="active"><a href="<c:url value="${pageContext.request.contextPath}/j_spring_security_logout" />" > Logout</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function() {

            <%--function getParameterByName(name) {--%>
                <%--name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");--%>
                <%--var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),--%>
                        <%--results = regex.exec(location.search);--%>
                <%--return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));--%>
            <%--}--%>

            <%--var loginSuccess = '${success_reg}';--%>
            <%--console.log(loginSuccess);--%>
            <%--if (loginSuccess == "true"){--%>
                <%--showAlert();--%>
                <%--console.log(loginSuccess);--%>
            <%--} else{--%>
                <%--$('#myAlert').hide();--%>
            <%--}--%>

            <%--function showAlert() {--%>
                <%--$("#myAlert").addClass("in");--%>

            <%--}--%>

            var url = window.location;
            $('ul.nav a[href="'+ url +'"]').parent().addClass('active');

            $('ul.nav a').filter(function() {
                return this.href == url;
            }).parent().addClass('active');

            $(".only-text").on('keyup', function(e) {
                var val = $(this).val();
                if (val.match(/[^a-zA-Z ]/g)) {
                    $(this).val(val.replace(/[^a-zA-Z]/g, ''));
                }
            });


        });
    </script>