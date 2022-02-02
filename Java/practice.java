package Java;

//File Name: practice.java
//
//Just messing around to get better at java again
//
//Author: Mj Burog

import java.util.Scanner;
import java.util.*;

public class practice{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        System.out.println("What's the password bitch");

        int password = input.nextInt();
        penis(password);
    }
    public static void penis(int inp){
        int password = inp;
        try{
            if(password == 12345){
                System.out.println("Good good you have big cock");
            }
            else{
                throw new SecurityException();
            }
        }
        catch(SecurityException exception){
            System.out.println(exception);
            System.out.println("Nah you ain't allowed in here...");
        }
    }
}