package com.tourisimbangla.tourbangla;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.tourisimbangla.tourbangla.ListItems.OfferListItem;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link SpotOffers.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link SpotOffers#newInstance} factory method to
 * create an instance of this fragment.
 */
public class SpotOffers extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    public View currV;
    public ArrayList<OfferListItem> offerItemArrayList = new ArrayList<OfferListItem>();

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    private OnFragmentInteractionListener mListener;

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment SpotOffers.
     */
    // TODO: Rename and change types and number of parameters
    public static SpotOffers newInstance(String param1, String param2) {
        SpotOffers fragment = new SpotOffers();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    public SpotOffers() {
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
        View v = inflater.inflate(R.layout.fragment_spot_offers, container, false);

        ArrayAdapter<OfferListItem> adapter = new MyListAdapter();
        popularOfferList();
        ListView list=(ListView) v.findViewById(R.id.lvwSpotOffers);
        list.setAdapter(adapter);
        return v;

    }


    private class MyListAdapter extends ArrayAdapter<OfferListItem> {
        public MyListAdapter(){

            super(getActivity(), R.layout.fragment_spot_offers, offerItemArrayList);
        }


        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            View itemView = convertView;
            if (itemView == null) {
                itemView = getActivity().getLayoutInflater().inflate(R.layout.offer_item, parent, false);
            }


            final OfferListItem currentOffer = offerItemArrayList.get(position);

            final TextView agencyName = (TextView) itemView.findViewById(R.id.lblOfferItemAgencyName);
            agencyName.setText(currentOffer.getAgencyName());

            TextView offerDesc = (TextView) itemView.findViewById(R.id.lblOfferItemDesc);
            offerDesc.setText(currentOffer.getDescription());

            TextView validTil = (TextView) itemView.findViewById(R.id.lblOfferItemValidTil);
            validTil.setText(currentOffer.getValid_Til());

            ImageButton btnContact = (ImageButton) itemView.findViewById(R.id.btnOfferItemContact);
            btnContact.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //agencyName.setText(currentOffer.getContact());
                    Toast.makeText(getActivity().getApplicationContext(),"Calling " + currentOffer.getContact(), Toast.LENGTH_SHORT ).show();
                }
            });



//            TextView problemType = (TextView) itemView.findViewById(R.id.lblPostProblemType);
//            problemType.setText(Utility.HazardTags.getHazardTags()[currentPost.getCategory()]);

            return itemView;
        }
    }

    public void popularOfferList() {
        offerItemArrayList.clear();

        offerItemArrayList.add(new OfferListItem("Company A", "Very Good, go for it", "31 Dec, 2016", "0171..."));
        offerItemArrayList.add(new OfferListItem("Company B", "Not so good, they didn't pay much", "29 Feb, 1997", "0181..."));
        offerItemArrayList.add(new OfferListItem("Company C", "Good, go for it", "31 Dec, 2016", "0171..."));

    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
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

}
