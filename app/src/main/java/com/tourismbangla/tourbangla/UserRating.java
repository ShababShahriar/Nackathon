package com.tourismbangla.tourbangla;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class UserRating extends AppCompatActivity {

    public static ProgressDialog pd;
    private static ListView lv;
//    private ResultListAdaptor rla;
    private List<YourPosts> lst = new ArrayList<YourPosts>();
    private List<YourPosts> lst_online;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_home);

        TextView lblGreeting = (TextView) findViewById(R.id.lblDashboardHello);
        lblGreeting.setText("Hello Onix" + "!");
//        if(DashboardFragment.jsonPosts != null)
//            DashboardFragment.populateRatingGraph(DashboardFragment.jsonPosts);
        Line l = new Line();
        LinePoint p = new LinePoint();
        p.setX(1);
        p.setY(5);
        p.setLabel_string("23 December, 2014");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(2);
        p.setY(8);
        p.setLabel_string("1 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(3);
        p.setY(4);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(4);
        p.setY(20);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(5);
        p.setY(7);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(6);
        p.setY(45);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(7);
        p.setY(25);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(8);
        p.setY(15);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);
        p = new LinePoint();
        p.setX(9);
        p.setY(48);
        p.setLabel_string("6 January, 2015");
        l.addPoint(p);

        l.setColor(Color.parseColor("#FFBB33"));

        LineGraph li = (LineGraph)findViewById(R.id.graph);

        li.addLine(l);

        li.setRangeY(0, 50);
        li.setLineToFill(0);
    }

    @Override
    public View onCreateView(String name, Context context, AttributeSet attrs) {



        return super.onCreateView(name, context, attrs);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_user_rating, menu);
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
}
