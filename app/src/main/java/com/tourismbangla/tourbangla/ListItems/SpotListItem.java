package com.tourismbangla.tourbangla.ListItems;

public class SpotListItem {
    String title;
    String catagory, description;
    float rating;

    public SpotListItem(String title, String catagory, String description, float rating) {
        this.title = title;
        this.catagory = catagory;
        this.description = description;
        this.rating = rating;
    }

    public String getTitle() {
        return title;
    }

    public String getCatagory() {
        return catagory;
    }

    public String getDescription() {
        return description;
    }

    public float getRating() {
        return rating;
    }
}