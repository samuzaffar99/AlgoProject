import 'dart:math';

//0/1 Knapsack Problem
// Input:
// Values (stored in array v)
// Weights (stored in array w)
// Number of distinct items (n)
// Knapsack capacity W
int knapSack(List<int> v, List<int> w, int n, int W) {
// T[i][j] stores the maximum value that can be attained with
// weight less than or equal to j using items up to first i items
  var T = List.generate(n + 1, (i) => List<int>(W + 1), growable: false);
//int T[n+1][W+1];

  for (int j = 0; j <= W; j++) {
    T[0][j] = 0;
  }

// memset (T[0], 0, sizeof T[0]);

// do for ith item
  for (int i = 1; i <= n; i++) {
// consider all weights from 0 to maximum capacity W
    for (int j = 0; j <= W; j++) {
// don't include ith element if j-w[i-1] is negative
      if (w[i - 1] > j)
        T[i][j] = T[i - 1][j];
      else
// find max value by excluding or including the ith item
        T[i][j] = max(T[i - 1][j], T[i - 1][j - w[i - 1]] + v[i - 1]);
    }
  }

// return maximum value
  return T[n][W];
}

// 0-1 Knapsack problem
String call01KP(List<int> v,List<int> w,int W) {
// Input: set of items each with a weight and a value

// Knapsack capacity
//  int W = 10;

// number of items
  int n = v.length;
  print("Knapsack value is ${knapSack(v, w, n, W)}");
  return "Knapsack value is ${knapSack(v, w, n, W)}";
}


//Rod Cutting
// Function to find best way to cut a rod of length n
// where rod of length i has a cost price[i-1]

int rodCut(List<int> price, int n) {
// T[i] stores maximum profit achieved from rod of length i
  List<int> T = new List<int>.filled(n + 1,0);

// initialize maximum profit to 0
//   for (int i = 0; i <= n; i++) {
//     T[i] = 0;
//   }

// consider rod of length i
  for (int i = 1; i <= n; i++) {
// divide the rod of length i into two rods of length j
// and i-j each and take maximum
    for (int j = 1; j <= i; j++) T[i] = max(T[i], price[j - 1] + T[i - j]);
  }

// T[n] stores maximum profit achieved from rod of length n
  return T[n];
}

String callRodC(List<int> price,List<int> length,int n) {
  //price.sort();
  n=4;
  //print("Profit is ${rodCut(price, n)}");
  return "Profit is ${rodCut(price, n)}";
}
