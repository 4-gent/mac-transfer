package MacScripts;

//This file will run an internet connection test
//
//@author Mj Burog
//

import java.net.URL;
import java.net.URLConnection;
//import java.util.*;

public class internet
{
    public static void main(String[] args)
    {
        try
        {
            URL url = new URL("https://google.com");
            URLConnection con = url.openConnection();
            con.connect();
            System.out.println("Internet Connection Available");
        }
        catch(Exception e)
        {
            System.out.println("No Internet Connection");
        }
    }
}