package com.tourisimbangla.tourbangla.ListItems;

/**
 * Created by Anik on 4/6/2016.
 */
public class OfferListItem {
    String agencyName;
    String description;
    String valid_Til;
    String contact;

    public String getAgencyName() {
        return agencyName;
    }

    public String getDescription() {
        return description;
    }

    public String getValid_Til() {
        return valid_Til;
    }

    public String getContact() {
        return contact;
    }

    public OfferListItem(String agencyName, String description, String valid_Til, String contact) {
        this.agencyName = agencyName;
        this.description = description;
        this.valid_Til = "Valid Til " + valid_Til;
        this.contact = contact;

    }
}
