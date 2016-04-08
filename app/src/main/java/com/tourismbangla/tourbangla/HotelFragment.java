package com.tourismbangla.tourbangla;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link HotelFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link HotelFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class HotelFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    private ArrayList<HotelItem> hotelItemArrayList = new ArrayList<HotelItem>();
    TextView hotelSpotName;

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
    public static HotelFragment newInstance(String param1, String param2) {
        HotelFragment fragment = new HotelFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    public HotelFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v = inflater.inflate(R.layout.fragment_hotel, container, false);

        hotelSpotName = (TextView)v.findViewById(R.id.hotelSpotName);

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

        hotelSpotName.setText("Hotels Near Omiakhum ");
        testHotelList();
    }

    private void populateHotelListView(){
        ArrayAdapter<HotelItem> adapter = new MyListAdapter();

        ListView list=(ListView)getView().findViewById(R.id.lvwHotels);
        list.setAdapter(adapter);
    }

    private class MyListAdapter extends ArrayAdapter<HotelItem> {
        public MyListAdapter(){

            super(getActivity(), R.layout.fragment_hotel_item, hotelItemArrayList);
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            View itemView = convertView;
            if (itemView == null) {
                itemView = getActivity().getLayoutInflater().inflate(R.layout.fragment_hotel_item, parent, false);
            }

//            Voter curVoter = new Voter(Utility.CurrentUser.getId());


            HotelItem currentHotel = hotelItemArrayList.get(position);


            //fill the view

            TextView hotelName = (TextView) itemView.findViewById(R.id.lblHotelName);
            hotelName.setText(currentHotel.getHotelName());

            TextView hotelAddress = (TextView) itemView.findViewById(R.id.lblHotelAddress);
            hotelAddress.setText(currentHotel.getLocationDesc());

            TextView hotelContact = (TextView) itemView.findViewById(R.id.lblHotelContact);
            hotelContact.setText(currentHotel.getContactNo() + currentHotel.getEmail());

            RatingBar hotelRating = (RatingBar) itemView.findViewById(R.id.hotelRatingBar);
            hotelRating.setRating(currentHotel.getRating());

//            TextView problemType = (TextView) itemView.findViewById(R.id.lblPostProblemType);
//            problemType.setText(Utility.HazardTags.getHazardTags()[currentPost.getCategory()]);

            return itemView;
        }
    }

    public void testHotelList() {
        hotelItemArrayList.clear();

        HotelItem h1 = new HotelItem(1, "Hotel Hilton", 1, ((float) 3.5), "Just behind the Police Convention Center", "0167", null, 1.1, 2.2);
        hotelItemArrayList.add(h1);

        HotelItem h2 = new HotelItem(2, "Hotel Khan", 1, 3, "Just in front of Mirpur Stadium", "01959", "khan@email.com", 1.1, 2.2);
        hotelItemArrayList.add(h2);

        HotelItem h3 = new HotelItem(3, "Hotel Continental", 1, 5, "koi je ase eta", null, "conti@email.com", 1.1, 2.2);
        hotelItemArrayList.add(h3);

        populateHotelListView();
    }
}
