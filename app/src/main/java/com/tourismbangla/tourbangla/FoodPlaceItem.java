package com.tourismbangla.tourbangla;


public class FoodPlaceItem {

    private int hotelId;
    private String FoodPlaceName;
    private int locationId;

    private float rating;
    private String locationDesc;
    private String contactNo;
    private String email;
    private double lat, lon;


    public FoodPlaceItem(int hotelId, String FoodPlaceName, int locationId, float rating, String locationDesc, String contactNo, String email, double lat, double lon) {
        this.hotelId = hotelId;
        this.FoodPlaceName = FoodPlaceName;
        this.locationId = locationId;
        this.rating = rating;
        this.locationDesc = locationDesc;

        if (contactNo == null) this.contactNo = "";
        else this.contactNo = "Contact Number:  " + contactNo;

        if (email == null) this.email = "";
        else if(email == null && contactNo == null) this.email = "Email:  " + email;
        else this.email = "\n" + "Email:  " + email;

        this.lat = lat;
        this.lon = lon;
    }


    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getFoodPlaceName() {
        return FoodPlaceName;
    }

    public void setFoodPlaceName(String foodPlaceName) {
        this.FoodPlaceName = foodPlaceName;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public String getLocationDesc() {
        return locationDesc;
    }

    public void setLocationDesc(String locationDesc) {
        this.locationDesc = locationDesc;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

}
