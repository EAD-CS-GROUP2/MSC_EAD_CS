package com.colomboyard.ships;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;

public class ColomboRider {

	public static final String VESSEL_NAME = "Colombo Rider";

	private static class ShipInfo {
		public Coordinates cordinate;
		public String status;

		public ShipInfo(Coordinates cordinate, String status) {
			super();
			this.cordinate = cordinate;
			this.status = status;
		}
	}

	private static class DemoWorker extends Thread {

		private List<ShipInfo> shipInfoList = new ArrayList<ShipInfo>();
		private int index = 0;

		public DemoWorker() {
			super();
			shipInfoList.add(new ShipInfo(new Coordinates(6.946484, 79.832692),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(new Coordinates(6.963317, 79.833812),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(new Coordinates(7.002513, 79.623758),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(new Coordinates(7.089913, 79.292821),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(new Coordinates(7.075286, 76.966201),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(new Coordinates(9.057253, 71.768208),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(12.018789, 67.911851),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(16.344919, 62.859214),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(17.509698, 60.322590),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(18.516431, 59.036622),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(19.634521, 58.412005),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(20.475372, 58.159513),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(19.971093, 59.136098),
					Status.SHIPPING_ON_TIME));
			shipInfoList.add(new ShipInfo(
					new Coordinates(22.183154, 62.551673),
					Status.SHIPPING_DELAY));
			shipInfoList.add(new ShipInfo(
					new Coordinates(23.318169, 64.487837),
					Status.SHIPPING_DELAY));
			shipInfoList.add(new ShipInfo(
					new Coordinates(24.212429, 65.860444),
					Status.SHIPPING_DELAY));
			shipInfoList.add(new ShipInfo(
					new Coordinates(24.703213, 66.873781),
					Status.SHIPPING_DELAY));
			shipInfoList.add(new ShipInfo(
					new Coordinates(24.797615, 66.984364),
					Status.SHIPPING_DELAY));
		}

		@Override
		public void run() {
			super.run();
			while (index != shipInfoList.size()) {
				try {
					Thread.sleep(10000);
					System.out.println("Pushing new location update : "
							+ shipInfoList.get(index).cordinate.latitude
							+ " : "
							+ shipInfoList.get(index).cordinate.longitude);
					String req = "http://localhost:8080/FMS/ajax/updateVesselLocation?vesselId=%s&status=%s&latitude=%s&longitude=%s";

					HttpGet request = new HttpGet(String.format(req,
							URLEncoder.encode(VESSEL_NAME), URLEncoder.encode(shipInfoList.get(index).status),
							shipInfoList.get(index).cordinate.getLatitude()
									.toString(),
							shipInfoList.get(index++).cordinate.getLongitude()
									.toString()));

					System.out.println(request);
					try {
						HttpClient client = new DefaultHttpClient();
						HttpResponse result = client.execute(request);
						System.out.println(result);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} catch (InterruptedException e) {

				}
			}
		}
	}

	public static void main(String[] args) {
		DemoWorker mThread = new DemoWorker();
		mThread.start();
	}

}
