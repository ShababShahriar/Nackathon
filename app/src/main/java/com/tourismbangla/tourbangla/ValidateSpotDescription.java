package com.tourismbangla.tourbangla;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;

public class ValidateSpotDescription extends AppCompatActivity implements EditHistoryListFragment.OnFragmentInteractionListener{

    CheckBox chkbox;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_validate_spot_description);

        addEditHistoryDataFragment();

//        chkbox = (CheckBox)findViewById(R.id.chkboxValidation);
//        chkbox.setOnCheckedChangeListener(this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_validate_spot_description, menu);
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

    private void addEditHistoryDataFragment(){
        FragmentManager fragmentManager = getFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        EditHistoryListFragment updatesFragment = new EditHistoryListFragment();

        fragmentTransaction.add(R.id.editHistoryFragmentContainer, updatesFragment,"EDIT_HISTORY_LIST_FRAGMENT");
        fragmentTransaction.commit();
    }

    public void onSubmitButtonClick(View v) {
        if(v.getId() == R.id.btnSubmitDescValidation) {
            Intent intent = new Intent(ValidateSpotDescription.this, SpotDetails2.class);
            startActivity(intent);
        }
    }

    public void onSkipButtonClick(View v) {
        if(v.getId() == R.id.btnSkipDescValidation) {
            Intent intent = new Intent(ValidateSpotDescription.this, EditSpotDescription.class);
            startActivity(intent);
        }
    }

//    @Override
//    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
//        if(isChecked) {
//
//        }
//        else {
//
//        }
//
//    }
}
