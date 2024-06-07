package com.asmkbw.service;

import org.springframework.web.client.RestTemplate;

public class GeocodingService {

	private static final String NOMINATIM_API_URL = "https://nominatim.openstreetmap.org/search";

	// Haversine formula to calculate distance between two points given their
	// latitude and longitude
	public static double haversine(double lat1, double lon1, double lat2, double lon2) {
		final int R = 6371; // Radius of the earth in kilometers
		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
				* Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = R * c; // Distance in kilometers
		return distance;
	}

	public static GeoCoordinates getCoordinates(String address) {
		RestTemplate restTemplate = new RestTemplate();
		String requestUrl = NOMINATIM_API_URL + "?q=" + address + "&format=json";
		NominatimResult[] results = restTemplate.getForObject(requestUrl, NominatimResult[].class);

		if (results != null && results.length > 0) {
			// Assuming the first result is accurate
			double latitude = Double.parseDouble(results[0].getLat());
			double longitude = Double.parseDouble(results[0].getLon());
			return new GeoCoordinates(latitude, longitude);
		} else {
			throw new RuntimeException("Error retrieving coordinates for the address: " + address);
		}
	}

	public static double getDistance(String address) {
		String defaultAddress = "Phường Trung Mỹ Tây ,Quận 12, Thành phố Hồ Chí Minh";
		GeoCoordinates coordinates1 = getCoordinates(defaultAddress);
		GeoCoordinates coordinates2 = getCoordinates(address);

		double distance = haversine(coordinates1.getLatitude(), coordinates1.getLongitude(), coordinates2.getLatitude(),
				coordinates2.getLongitude());
		return distance;
	}

//    public static void main(String[] args) {
//        String address1 = "Quận 1, Thành Phố Hồ Chí Minh";
//        String address2 = "Đồng Nai";
//
//        GeoCoordinates coordinates1 = getCoordinates(address1);
//        GeoCoordinates coordinates2 = getCoordinates(address2);
//
//        double distance = haversine(coordinates1.getLatitude(), coordinates1.getLongitude(),
//                                    coordinates2.getLatitude(), coordinates2.getLongitude());
//        
//        System.out.println("Distance between " + address1 + " and " + address2 + " is: " + distance + " kilometers");
//    }
}

class GeoCoordinates {
	private double latitude;
	private double longitude;

	public GeoCoordinates(double latitude, double longitude) {
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public double getLongitude() {
		return longitude;
	}
}

class NominatimResult {
	private String lat;
	private String lon;

	public String getLat() {
		return lat;
	}

	public String getLon() {
		return lon;
	}
}
