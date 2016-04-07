package com.tourisimbangla.tourbangla;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import com.tourisimbangla.tourbangla.ListItems.GuideListItem;
import com.tourisimbangla.tourbangla.ListItems.OfferListItem;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link spotContacts.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link spotContacts#newInstance} factory method to
 * create an instance of this fragment.
 */
public class spotContacts extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    public ArrayList<GuideListItem> guideArrayList = new ArrayList<GuideListItem>();
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
     * @return A new instance of fragment spotContacts.
     */
    // TODO: Rename and change types and number of parameters
    public static spotContacts newInstance(String param1, String param2) {
        spotContacts fragment = new spotContacts();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    public spotContacts() {
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
        View v = inflater.inflate(R.layout.fragment_spot_contacts, container, false);

        ArrayAdapter<GuideListItem> adapter = new MyListAdapter();
        popularGuideList();
        ListView list=(ListView) v.findViewById(R.id.lvwSpotContactsGuide);
        list.setAdapter(adapter);

        return v;
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }




    private class MyListAdapter extends ArrayAdapter<GuideListItem> {
        public MyListAdapter(){
            super(getActivity(), R.layout.fragment_spot_contacts, guideArrayList);
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            View itemView = convertView;
            if (itemView == null) {
                itemView = getActivity().getLayoutInflater().inflate(R.layout.guide_item, parent, false);
            }

            final GuideListItem guidelist = guideArrayList.get(position);

            final TextView name = (TextView) itemView.findViewById(R.id.lblGuideItemName);
            name.setText(guidelist.getName());

            TextView contact = (TextView) itemView.findViewById(R.id.lblGuideItemContact);
            contact.setText(guidelist.getContact());

            TextView desc = (TextView) itemView.findViewById(R.id.lblGuideItemDesc);
            desc.setText(guidelist.getDescription());

            CheckBox chkEnglish = (CheckBox) itemView.findViewById(R.id.chkGuideItemEnglish);

            if(guidelist.getKnows_english() == false)
                chkEnglish.setVisibility(View.INVISIBLE);
            else
                chkEnglish.setVisibility(View.VISIBLE);

            RatingBar rtb = (RatingBar) itemView.findViewById(R.id.ratingGuide);
            rtb.setRating(guidelist.getRating());

            ImageButton btnMore = (ImageButton) itemView.findViewById(R.id.btnGuideItemEdit);
            btnMore.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //agencyName.setText(currentOffer.getContact());
                    Toast.makeText(getActivity().getApplicationContext(), "Call/Edit", Toast.LENGTH_SHORT).show();
                }
            });

            return itemView;
        }
    }
    public void popularGuideList() {
        guideArrayList.clear();

        guideArrayList.add(new GuideListItem("Aminul Islam", "017131234568", "He helped me a lot", false, (float) 3.0));
        guideArrayList.add(new GuideListItem("Badrul Islam", "017131234568", "Not very helpful", true, (float)3.0));
        guideArrayList.add(new GuideListItem("Amin Miya", "017131234568", "He helped me a lot, He helped me a lot, very good boy, very good boy. He helped me a lot, very good boy", false, (float)3.0));

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
