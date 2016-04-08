package com.tourismbangla.tourbangla;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import com.tourismbangla.tourbangla.ListItems.SpotListItem;

import java.util.ArrayList;


public class Spotlisting extends AppCompatActivity {

    public ArrayList<SpotListItem> spotArrayList = new ArrayList<SpotListItem>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.spot_list);
        ArrayAdapter<SpotListItem> adapter = new MyListAdapter();
        populateSpotList();
        ListView list=(ListView) findViewById(R.id.lvwSpotList);
        list.setAdapter(adapter);
    }



    private class MyListAdapter extends ArrayAdapter<SpotListItem> {
        public MyListAdapter(){
            super(getApplicationContext(), R.layout.spot_list, spotArrayList);
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            View itemView = convertView;
            if (itemView == null) {
                itemView = getLayoutInflater().inflate(R.layout.spot_list_row, parent, false);
            }

            final SpotListItem spotlist = spotArrayList.get(position);

            final TextView name = (TextView) itemView.findViewById(R.id.lblSpotTitle);
            name.setText(spotlist.getTitle());

            TextView catagory = (TextView) itemView.findViewById(R.id.lblSpotCatagory);
            catagory.setText(spotlist.getCatagory());

            TextView desc = (TextView) itemView.findViewById(R.id.lblSpotDesc);
            desc.setText(spotlist.getDescription());

            RatingBar rtb = (RatingBar) itemView.findViewById(R.id.ratingSpot);
            rtb.setRating(spotlist.getRating());

            Button btnMore = (Button) itemView.findViewById(R.id.btnSpotMore);
            btnMore.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //agencyName.setText(currentOffer.getContact());
                    Toast.makeText(getApplicationContext(), "Show more info", Toast.LENGTH_SHORT).show();
                }
            });

            return itemView;
        }
    }

    public void populateSpotList() {
        spotArrayList.clear();

        spotArrayList.add(new SpotListItem("Sajek Valley", "Hill", "It's a great place specially in winter time", (float) 3.5));
        spotArrayList.add(new SpotListItem("Nilgiri", "Mountain", "It's also great, but a bit more expensive", (float)2.0));
    }
}
