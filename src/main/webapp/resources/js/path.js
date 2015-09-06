try
{

	src="https://maps.googleapis.com/maps/api/js?v=3.exp"

	var mapView;
    var zPoints = [];
    var zShipRoute = [];
    
    google.maps.event.addDomListener(window, 'load', LoadMap); 
    
    function LoadMap() 
    {
        var gm_Container = document.getElementById('MapContainer');
        var gmpoint_Cordinates = new google.maps.LatLng(30.5403, 0.5463);
        var gm_MapOption = { 
                                center: gmpoint_Cordinates,
                                zoom: 2,
                                mapTypeId: google.maps.MapTypeId.TERRAIN,
                            }
        mapView = new google.maps.Map(gm_Container, gm_MapOption)
    }
    
    function AddPoint(iLat,iLong,sDescription,iID) 
    {
        mapPoint = new google.maps.LatLng(iLat, iLong);
        
        var marker = new google.maps.Marker(
                        {   
                            position: mapPoint,
                            //map: mapView,
                            ID:iID,
                            draggable:true,
                            animation: google.maps.Animation.DROP,
                        });
        
        var bAdded = false;
        for (var i = 0; i < zPoints.length; i++) 
        {
            if(zPoints[i]['ID'] == marker['ID'])
             {
                bAdded = true;
                zPoints[i].setMap(null);
                delete zPoints[i];
                zPoints[i] = marker;
             }
        }
        if(bAdded == false)
            zPoints.push(marker);
            
        //marker.setMap(mapView);
        
        if(sDescription.length > 0)
        {
            sDescription +=  "<p> Codinates : " + iLat + ":"+iLong + "</p>";
            var infowindow = new google.maps.InfoWindow({content: sDescription});
            google.maps.event.addListener(marker, 'click', function() {infowindow.open(mapView,marker);});
			google.maps.event.addListener(mapView, 'click', function() {infowindow.close();});
        }
        ClearAllPoints();
        SetMapForPoints(mapView);
    }
   
    function SetMapForPoints(map) 
    {
        for (var i = 0; i < zPoints.length; i++) 
        {
            zPoints[i].setMap(map);
        }
    }
    
    function ClearAllPoints()
    {
        SetMapForPoints(null);
    }
    
    function DeleteAllPoints()
    {
        ClearAllPoints();
        zPoints = [];
		
		ClearAllShipPaths();
		zShipRoute = [];
    }
    
    function AddShipRoute(ShipPlanCoordinates,color,iiD)
    {
        var ShipPath = new google.maps.Polyline({
                                                    ID:iiD,
                                                    path: ShipPlanCoordinates,
                                                    geodesic: true,
                                                    strokeColor:color,
                                                    strokeOpacity: 1.0,
                                                    strokeWeight: 2,
													simulateIndex: 0
                                                 });
                                                 
        var bAdded = false;
        for (var i = 0; i < zShipRoute.length; i++) 
        {
            if(zShipRoute[i]['ID'] == ShipPath['ID'])
            {
                bAdded = true;
                zShipRoute[i].setMap(null);
                delete zShipRoute[i];
                zShipRoute[i] = ShipPath;
            }
        }
        
		if(bAdded == false)
			zShipRoute.push(ShipPath);
        
		ShipPath.setMap(mapView);
	}
	
	function ClearAllShipPaths()
	{
		for (var i = 0; i < zShipRoute.length; i++) 
        {
			zShipRoute[i].setMap(null);
			delete zShipRoute[i];
		}
	}
	  
	function AnimateShipRoute() 
	{
		var count = 0;
		window.setInterval(function()	{ 	
											count = (count + 1) % 200;
											var icons = line.get('icons');
											icons[0].offset = (count / 2) + '%';
											line.set('icons', icons);
										}, 500);
	}
      
	  //++++++++++++++++++++++++++++++++++++ TEST Data ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      function PlotShipPaths()
      {
		var ShipPlanCoordinates = 	[	
										new google.maps.LatLng(-14.899738, 41.077590),
										new google.maps.LatLng(-14.814785, 41.297316),
										new google.maps.LatLng(-12.852042, 41.297316),
										new google.maps.LatLng(-11.175778, 41.824660),
										new google.maps.LatLng(-8.795583, 42.615676),
										new google.maps.LatLng(-7.446973, 43.802199),
										new google.maps.LatLng(-2.237968, 47.581496),
										new google.maps.LatLng(5.006058, 54.173293),
										new google.maps.LatLng(8.235883, 54.700636),
										new google.maps.LatLng(15.117134, 56.985792),
										new google.maps.LatLng(20.223475, 59.095167),
										new google.maps.LatLng(23.147459, 60.525981),
										new google.maps.LatLng(24.758218, 66.896005),
										new google.maps.LatLng(21.464738, 69.356942),
										new google.maps.LatLng(20.273959, 72.477059),
										new google.maps.LatLng(15.041795, 73.619637),
										new google.maps.LatLng(8.837092, 76.022186),
										new google.maps.LatLng( 7.840835, 77.233492),
										new google.maps.LatLng(6.946385, 79.839935) 
									];

            AddShipRoute(ShipPlanCoordinates,'#009900',1);
			
			ShipPlanCoordinates = [];
			ShipPlanCoordinates = 	[ 
											new google.maps.LatLng(69.416530, 35.739871),
											new google.maps.LatLng(70.364009, 33.925807),
											new google.maps.LatLng(72.240101, 22.594955),
											new google.maps.LatLng(65.218831, 2.285183),
											new google.maps.LatLng(61.909627, -8.008561),
											new google.maps.LatLng(56.309281, -11.914420),
											new google.maps.LatLng(50.745972, -14.259341),
											new google.maps.LatLng(47.686169, -6.447622),
											new google.maps.LatLng(44.435731, -11.524186),
											new google.maps.LatLng(36.736853, -10.353482),
											new google.maps.LatLng(33.543673, -10.353482)
										];
			
			AddShipRoute(ShipPlanCoordinates,'#FF0000',2);
			
			ShipPlanCoordinates = [];
			ShipPlanCoordinates = 		[ 
											new google.maps.LatLng(27.491215, -80.275747),
											new google.maps.LatLng(28.867092, -73.634732),
											new google.maps.LatLng(21.813464, -64.262075),
											new google.maps.LatLng(12.874457, -61.136685),
											new google.maps.LatLng(9.040582, -52.540983),
											new google.maps.LatLng(4.387702, -43.558560),
											new google.maps.LatLng(5.553988, -33.401925),
											new google.maps.LatLng(4.776694, -24.025749),
											new google.maps.LatLng(4.776694, -9.573020),
											new google.maps.LatLng(1.656610, 7.224635)
										];
			AddShipRoute(ShipPlanCoordinates,'#3366FF',3);
			
			/*var ShipeSymbol = 	{	path: google.maps.SymbolPath.CIRCLE,
									scale: 3,
									strokeColor: '#FF0000'
								};
			*/
			
			// Create the polyline and add the symbol to it via the 'icons' property.
			/*line = new google.maps.Polyline({	path: ShipPlanCoordinates,
												icons: [{ icon: ShipeSymbol, offset: '100%'	}],
												map: mapView,
											});*/
			//AnimateShipRoute();

		}
		
		function AddTestPoint()
		{
			sDescription =	'<div>'+
							'<table>'+
								'<tr>'+
									'<td>Ship Type:\n Cargo</td>'+
								'</tr>'+
								'<tr>'+
									'<td>Length x Breadth:\n 112m x 14m</td>'+
								'</tr>'+
								'<tr>'+
									'<td>Draught:\n6.5m</td>'+
								'</tr>'+
								'<td rowspan="3"><img src="ShipImg/ship1.jpg" style="width:100px;height:50px"/></td>'+
							'</table>'+
							'</div>';

			AddPoint(56.309281, -11.914420, sDescription, 1);
			
			sDescription =	'<div>'+
				'<table>'+
					'<tr>'+
						'<td>Name : </td>'+
						'<td>Contrabnd</td>'+
						'<td rowspan="3"><img src="ShipImg/ship2.jpg" style="width:100px;height:50px"/></td>'+
					'</tr>'+
					'<tr>'+
						'<td>Company : </td>'+
						'<td>LAX Shiping Company</td>'+
					'</tr>'+
					'<tr>'+
						'<td>Destination : </td>'+
						'<td>Colombo Fort</td>'+
					'</tr>'+
				'</table>'+
				'</div>';
			AddPoint(-12.852042, 41.297316, sDescription, 2);
			AddPoint(4.776694, -24.025749, sDescription, 3);
		}
		

	var iTimeOutVar;
	var s_Description;
	function SimulateSipPath()
	{
		s_Description =	'<div>'+
								'<table>'+
									'<tr>'+
										'<td>Ship Type:\n Cargo</td>'+
									'</tr>'+
									'<tr>'+
										'<td>Length x Breadth:\n 112m x 14m</td>'+
									'</tr>'+
									'<tr>'+
										'<td>Draught:\n6.5m</td>'+
									'</tr>'+
									'<td rowspan="3"><img src="ShipImg/ship1.jpg" style="width:100px;height:50px"/></td>'+
								'</table>'+
								'</div>';
		iTimeOutVar = setInterval(point1, 3000);
	}
	
	function point1()
	{
		AddPoint(-14.899738, 41.077590, s_Description, 3000);
		AddPoint(27.491215, -80.275747, s_Description, 2000);
		AddPoint(69.416530, 35.739871, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point2, 3000);
	}
	function point2()
	{
		AddPoint(-14.814785, 41.297316, s_Description, 3000);
		AddPoint(28.867092, -73.634732, s_Description, 2000);
		AddPoint(70.364009, 33.925807, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point3, 3000);
	}
	function point3()
	{
		AddPoint(-12.852042, 41.297316, s_Description, 3000);
		AddPoint(21.813464, -64.262075, s_Description, 2000);
		AddPoint(72.240101, 22.594955, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point4, 3000);
	}
	function point4()
	{
		AddPoint(-11.175778, 41.824660, s_Description, 3000);
		AddPoint(12.874457, -61.136685, s_Description, 2000);
		AddPoint(65.218831, 2.285183, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point5, 3000);
	}
	function point5()
	{
		AddPoint(-8.795583, 42.615676, s_Description, 3000);
		AddPoint(9.040582, -52.540983, s_Description, 2000);
		AddPoint(61.909627, -8.008561, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point6, 3000);
	}
	function point6()
	{
		AddPoint(-7.446973, 43.802199, s_Description, 3000);
		AddPoint(4.387702, -43.558560, s_Description, 2000);
		AddPoint(56.309281, -11.914420, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point7, 3000);
	}
	function point7()
	{
		AddPoint(-2.237968, 47.581496, s_Description, 3000);
		AddPoint(5.553988, -33.401925, s_Description, 2000);
		AddPoint(50.745972, -14.259341, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point8, 3000);
	}
	function point8()
	{
		AddPoint(21.464738, 69.356942, s_Description, 3000);
		AddPoint(4.776694, -24.025749, s_Description, 2000);
		AddPoint(47.686169, -6.447622, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point9, 3000);
	}
	function point9()
	{
		AddPoint(15.041795, 73.619637, s_Description, 3000);
		AddPoint(44.435731, -11.524186, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point10, 3000);
	}
	function point10()
	{
		AddPoint(8.837092, 76.022186, s_Description, 3000);
		AddPoint(4.776694, -9.573020, s_Description, 2000);
		AddPoint(36.736853, -10.353482, s_Description, 1000);
		clearTimeout(iTimeOutVar);
		iTimeOutVar = setInterval(point11, 3000);
	}
	function point11()
	{
		AddPoint(6.946385, 79.839935, s_Description, 3000); 
		AddPoint(1.656610, 7.224635, s_Description, 2000);
		AddPoint(33.543673, -10.353482, s_Description, 1000);
		clearTimeout(iTimeOutVar);
	}

	 
	onerror = OnError;
	var sErrStr = "";
	function OnError(sErroMsg, url, l) 
	{
		sErrStr = "There was an error on this page.\n\n";
		sErrStr += "Error: " + sErroMsg + "\n";
		sErrStr += "URL: " + url + "\n";
		sErrStr += "Line: " + l + "\n\n";
		sErrStr += "Click OK to continue.\n\n";
		alert(sErrStr);
		return true;
	}
}
catch(err) 
{
	console.log(err.message);
}