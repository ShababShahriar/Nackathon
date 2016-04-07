package com.tourisimbangla.tourbangla.ListItems;

/**
 * Created by Anik on 4/6/2016.
 */
public class GuideListItem {
    String name;
    String contact;
    String description;
    Boolean knows_english;
    float rating;

    public String getName() {
        return name;
    }

    public String getContact() {
        return contact;
    }

    public String getDescription() {
        return description;
    }

    public Boolean getKnows_english() {
        return knows_english;
    }

    public float getRating() {
        return rating;
    }

    public GuideListItem(String name, String contact, String description, Boolean knows_english, float rating) {

        this.name = name;
        this.contact = contact;
        this.description = description;
        this.knows_english = knows_english;
        this.rating = rating;
    }
}
