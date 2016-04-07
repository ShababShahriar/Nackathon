package com.tourismbangla.tourbangla;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

public class ReviewItem {
    private String userName;
    private float rating;
    private String reviewText;

    public ReviewItem(float rating, String reviewText, String userName) {
        this.rating = rating;
        this.reviewText = reviewText;
        this.userName = userName;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}