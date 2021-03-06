/*
   You are given an array of stock prices representing the value of some stock over time.
   Assuming that you are allowed to buy the stock exactly once and sell the stock exactly once,
   what is the maximum profit you can make?
*/

import java.util.ArrayList;
import java.util.Arrays;

public class StockPrice {

    /* Linear traversal */
    public static double maxProfitLinear(ArrayList<Double> priceList) {
        double profit = 0.0;
        if (priceList == null) return profit;

        double lowestPrice = Double.MAX_VALUE;
        for (double price : priceList) {
            profit = Math.max(profit, price - lowestPrice);
            lowestPrice = Math.min(price, lowestPrice);
        }

        return profit;
    }

    /* Divide and Conquer */
    public static double maxProfitDC(ArrayList<Double> priceList) {
        return maxProfitDCHelper(priceList, 0, priceList.size()-1)[0];
    }

    /* Helper method for Divide and Conquer */
    public static double[] maxProfitDCHelper(ArrayList<Double> prices, int start, int end) {

        if (start == end) {
            double[] temp = { 0.0, prices.get(start), prices.get(end) };
            return temp;
        }

       int mid =  (start+end)/2;
       double[] left = maxProfitDCHelper(prices, start, mid);
       double[] right = maxProfitDCHelper(prices, mid+1, end);

       return merge(left, right);
    }

    /* Merge step in Divide and Conquer */
    public static double[] merge(double[] left, double[] right) {
        double[] temp = { Math.max(left[0], right[0]), Math.min(left[1], right[1]), Math.max(left[2], right[2]) };

        if (right[2] - left[1] > temp[0]) {
            temp[0] = right[2] - left[1];
        }

        return temp;
    }

    public static void main(String[] args) {
        ArrayList<Double> prices = new ArrayList<>(Arrays.asList(6.0, 13.9, 2.1, 3.7, 8.9, 4.8, 7.5, 9.8));
        System.out.println(StockPrice.maxProfitLinear(prices));
        System.out.println(StockPrice.maxProfitDC(prices));
    }
}
