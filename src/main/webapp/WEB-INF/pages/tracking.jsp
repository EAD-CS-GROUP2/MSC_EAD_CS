<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${sessionScope.loggedUser != null}">
        <%@ include file="/WEB-INF/template/header.jsp" %>
    </c:when>
    <c:otherwise>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>FMS</title>

            <script src="${pageContext.request.contextPath}/resources/js/cdnjquery.min.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cdnbootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cdnbootstrap-theme.min.css">


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


    </c:otherwise>
</c:choose>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">

    var iconHarbour = 'resources/images/harbour.png';
    var iconShip = 'resources/images/ship.gif';
    status = '';
    var vesselId_;
    var shipmentId_;
	var shipMarker;
	var map;
    var markers = [
        {
            "title": 'Colombo Harbour',
            "lat": '6.9503763',
            "lng": '79.8476515',
            "icon": iconHarbour,
            "description": 'Colombo Harbour Port.'
        },
        {
            "title": 'Oman Harbour',
            "lat": '20.475372',
            "lng": '58.159513',
            "icon": iconHarbour,
            "description": 'Oman Harbour port.'
        },
        {
            "title": 'Karachchi Harbour',
            "lat": '24.797615',
            "lng": '66.984364',
            "icon": iconHarbour,
            "description": 'Karachchi Harbour port.'
        }
    ];
    window.onload = function () {
    	var found = '${found}';
		if (found === 'true'){
			vesselId_ = '${vessel.id}';
			shipmentId_ = '${shipmentId}';
	        var mapOptions = {
	            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
	            zoom: 10,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
	        map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
	        var infoWindow = new google.maps.InfoWindow();
	        var lat_lng = new Array();
	        var latlngbounds = new google.maps.LatLngBounds();
	        
	        addShipMarker(map);
	        
	        for (i = 0; i < markers.length; i++) {
	            var data = markers[i]
	            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
	            lat_lng.push(myLatlng);
	            var marker = new google.maps.Marker({
	                position: myLatlng,
	                map: map,
	                title: data.title,
	                icon: data.icon
	            });
	            latlngbounds.extend(marker.position);
	            (function (marker, data) {
	                google.maps.event.addListener(marker, "click", function (e) {
	                    infoWindow.setContent(data.description);
	                    infoWindow.open(map, marker);
	                });
	            })(marker, data);
	        }
	        map.setCenter(latlngbounds.getCenter());
	        map.fitBounds(latlngbounds);
		
		}
		status = '${status}';
		
    }
    
    function addShipMarker(map){
    	shipMarker = new google.maps.Marker({
            position: new google.maps.LatLng('${vessel.location.latitude}', '${vessel.location.longitude}'),
            map: map,
            title: '${vessel.name}',
            icon: iconShip
        });
    	checkShipUpdates();
    }
    
    function updateShipMarker(lat,lon){
    	shipMarker.setMap(null);
    	shipMarker = new google.maps.Marker({
            position: new google.maps.LatLng(lat,lon),
            map: map,
            title: shipmentId_,
            icon: iconShip
        });
    }
    function checkShipUpdates(){
    	setInterval(function(){
    	$.ajax({
	    	type: 'GET',
	    	url: 'vessel_status',
	    	data:{vesselId:vesselId_,pre_status: status , shipmentId:shipmentId_},
	    	success: function(data) {
	    		status = data.status;
	    	    updateShipMarker(data.location.latitude, data.location.longitude);
	    	    },
	    	error: function(){
	    	    console.write("Error in getting vessel location");
	    	}
	    	});
    	},10000);
    }
</script>

<!-- Begin page content -->
<div class="container">


    <div class="panel panel-primary">
        <div class="panel-heading">Tracking</div>
        <div class="panel-body">

            <form class="form-horizontal" role="form" method="post">
                <div class="form-group">
                    <label for="booking_id" class="col-sm-2 control-label">Booking ID</label>

                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="booking_id" name="booking_id"
                               placeholder="Enter booking id">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </div>
            </form>

            <div id="dvMap" style="width: 100%; height:100%"/>
        </div>
    </div>


</div>
<%----%>


<%@ include file="/WEB-INF/template/footer.jsp" %>


