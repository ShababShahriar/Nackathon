package com.tourismbangla.tourbangla;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.app.Fragment;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.LayoutInflater;
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

public class ReviewListFragment extends Fragment {

    AutoCompleteTextView searchSpot;
    ArrayList<ReviewItem> reviewItemArrayList = new ArrayList<ReviewItem>();


    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

//    private ArrayList<HotelItem> hotelItemArrayList = new ArrayList<HotelItem>();
//    TextView hotelSpotName;

    private OnFragmentInteractionListener mListener;

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment HotelFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static ReviewListFragment newInstance(String param1, String param2) {
        ReviewListFragment fragment = new ReviewListFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    public ReviewListFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

//        bringDownTheKeyBoard();
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v = inflater.inflate(R.layout.fragment_review_list, container, false);

//        hotelSpotName = (TextView)v.findViewById(R.id.hotelSpotName);

        return v;
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p/>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        public void onFragmentInteraction(Uri uri);
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

//        hotelSpotName.setText("Hotels Near ");
        testReviewList();
    }

//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.menu_spot_review, menu);
//        return true;
//    }

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

    private void populateReviewListView(){
        ArrayAdapter<ReviewItem> adapter = new MyListAdapter();

        ListView list=(ListView)getView().findViewById(R.id.lvwReviews);
        list.setAdapter(adapter);
    }

    private class MyListAdapter extends ArrayAdapter<ReviewItem> {
        public MyListAdapter(){

            super(getActivity(), R.layout.fragment_review_item, reviewItemArrayList);
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            View itemView = convertView;
            if (itemView == null) {
                itemView = getActivity().getLayoutInflater().inflate(R.layout.fragment_review_item, parent, false);
            }

//            Voter curVoter = new Voter(Utility.CurrentUser.getId());


            ReviewItem currentHotel = reviewItemArrayList.get(position);


            //fill the view

            TextView hotelName = (TextView) itemView.findViewById(R.id.lblUserName);
            hotelName.setText(currentHotel.getUserName());

            TextView hotelAddress = (TextView) itemView.findViewById(R.id.lblReviewText);
            hotelAddress.setText(currentHotel.getReviewText());


            RatingBar hotelRating = (RatingBar) itemView.findViewById(R.id.reviewRatingBar);
            hotelRating.setRating(currentHotel.getRating());

//            TextView problemType = (TextView) itemView.findViewById(R.id.lblPostProblemType);
//            problemType.setText(Utility.HazardTags.getHazardTags()[currentPost.getCategory()]);

            return itemView;
        }
    }

    public void testReviewList() {
        reviewItemArrayList.clear();

        ReviewItem h1 = new ReviewItem(((float) 3.5), "Should be a huge text.\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\n", "Onix Hoque  ");
        reviewItemArrayList.add(h1);

        ReviewItem h2 = new ReviewItem(((float) 2.5), "Should be a huge text but it's not.\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\n", "Wasif Khan  ");
        reviewItemArrayList.add(h2);

        ReviewItem h3 = new ReviewItem(((float) 5), "Should be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\nShould be a huge text but it's not. Or is it?\n", "Neamul Kabir  ");
        reviewItemArrayList.add(h3);

        populateReviewListView();
    }
}
