package com.tourismbangla.tourbangla;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;

import java.util.ArrayList;

public class SpotReview extends AppCompatActivity implements ReviewListFragment.OnFragmentInteractionListener{

    AutoCompleteTextView searchSpot;
//    ArrayList<ReviewItem> reviewItemArrayList = new ArrayList<ReviewItem>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_spot_review);

        // Get a reference to the AutoCompleteTextView in the layout
        searchSpot = (AutoCompleteTextView) findViewById(R.id.searchSpot);
// Get the string array
        String[] countries = getResources().getStringArray(R.array.countries_array);
// Create the adapter and set it to the AutoCompleteTextView
        ArrayAdapter<String> adapter =
                new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, countries);
        searchSpot.setAdapter(adapter);

        addReviewListDataFragment();

        searchSpot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (v.getId() == R.id.searchSpot) {
                    searchSpot.setFocusable(true);
                    searchSpot.setFocusableInTouchMode(true);
                }
            }
        });

//        bringDownTheKeyBoard();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_spot_review, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }




    private void addReviewListDataFragment(){
        FragmentManager fragmentManager = getFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        ReviewListFragment updatesFragment = new ReviewListFragment();

        fragmentTransaction.add(R.id.reviewListFragmentContainer, updatesFragment,"REVIEW_LIST_FRAGMENT");
        fragmentTransaction.commit();
    }
}
