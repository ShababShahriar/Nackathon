package com.tourismbangla.tourbangla;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

public class EditSpotDescription extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_spot_description);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_edit_spot_description, menu);
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

//    public void onBackButtonClick(View v) {
//        if(v.getId() == R.id.btnSkipDescValidation) {
//
//        }
//    }
    public void onCancelButtonClick(View v) {
        if(v.getId() == R.id.btnCancelDescEdit) {

        }
    }

    public void onSubmitButtonClick(View v) {
        if(v.getId() == R.id.btnSubmitDescEdit) {
//            Intent intent = new Intent(EditSpotDescription.this, SpotD);
        }
    }

}
