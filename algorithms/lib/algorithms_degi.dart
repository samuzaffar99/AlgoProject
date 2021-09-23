import 'dart:math';

// Iterative function to find longest increasing subsequence
// of given array
List<int> findLIS(List<int> arr, int n) {
// LIS[i] stores the longest increasing subsequence of subarray
// arr[0..i] that ends with arr[i]
  //var LIS =new List<List<int>>(n);
  var LIS = List.generate(n, (i) => List<int>(), growable: false);

// LIS[0] denotes longest increasing subsequence ending with arr[0]
  LIS[0].add(arr[0]);

// start from second element in the array
  for (int i = 1; i < n; i++) {
// do for each element in subarray arr[0..i-1]
    for (int j = 0; j < i; j++) {
// find longest increasing subsequence that ends with arr[j]
// where arr[j] is less than the current element arr[i]

      if (arr[j] < arr[i] && LIS[j].length > LIS[i].length) {
        LIS[i] = List.from(LIS[j]);
      }
    }

// include arr[i] in LIS[i]
    LIS[i].add(arr[i]);
  }

// j will contain index of LIS

  int j=0;
  for (int i = 0; i < n; i++) {
    if (LIS[j].length < LIS[i].length) {
      j = i;
    }
  }

  return LIS[j];
}

String callLIS(List<int> arr) {
  int n = arr.length;

  return "Longest Increasing Subsequence is:\n ${findLIS(arr, n)}";
}



//MCM

// Function to find the most efficient way to multiply
// given sequence of matrices
int matrixChainMultiplication(List<int> dims, int n) {
// c[i,j] = Minimum number of scalar multiplications (i.e., cost)
// needed to compute the matrix M[i]M[i+1]...M[j] = M[i..j]
// The cost is zero when multiplying one matrix
  var c = List.generate(n + 1, (i) => List<int>(n + 1), growable: false);

  for (int i = 1; i <= n; i++) {
    c[i][i] = 0;
  }

  for (int len = 2; len <= n; len++) // Subsequence lengths
      {
    for (int i = 1; i <= n - len + 1; i++) {
      int j = i + len - 1;
      c[i][j] = 9223372036854775807; //maxInt64

      for (int k = i; j < n && k <= j - 1; k++) {
        int cost = c[i][k] + c[k + 1][j] + dims[i - 1] * dims[k] * dims[j];

        if (cost < c[i][j]) {
          c[i][j] = cost;
        }
      }
    }
  }
  return c[1][n - 1];
}

// Matrix Chain Multiplication Problem
String callMCM(List<int> dims) {
// Matrix M[i] has dimension dims[i-1] x dims[i] for i = 1..n
// input is 10 x 30 matrix, 30 x 5 matrix, 5 x 60 matrix
  int n = dims.length;
  print("Minimum cost is ${matrixChainMultiplication(dims, n)}");
  return "Minimum cost is ${matrixChainMultiplication(dims, n)}";
}


//Partition Problem
// Return true if there exists a subset of array[0..n) with given sum
bool subsetSum(List<int> arr, int n, int sum) {
// T[i][j] stores true if subset with sum j can be attained with
// using items up to first i items
  var T = List.generate(n + 1, (i) => List<bool>(sum + 1), growable: false);

//bool T[n + 1][sum + 1];

// if 0 items in the list and sum is non-zero
  for (int j = 1; j <= sum; j++) {
    T[0][j] = false;
  }

// if sum is zero
  for (int i = 0; i <= n; i++) {
    T[i][0] = true;
  }

// do for ith item
  for (int i = 1; i <= n; i++) {
// consider all sum from 1 to sum
    for (int j = 1; j <= sum; j++) {
// don't include ith element if j-arr[i-1] is negative
      if (arr[i - 1] > j) {
        T[i][j] = T[i - 1][j];
      } else
// find subset with sum j by excluding or including the ith item
        T[i][j] = T[i - 1][j] || T[i - 1][j - arr[i - 1]];
    }
  }

// return maximum value
  return T[n][sum];
}

// Partition problem - Return true if given array arr[0..n-1] can
// be divided into two subsets with equal sum
bool partition(List<int> arr, int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    sum += arr[i];
  }

// return true if sum is even and array can can be divided into
// two subsets with equal sum
  return (sum%2==0) && subsetSum(arr, n, sum ~/ 2);
}

// main function to solve partition problem
String callPartP(List<int> arr) {
// number of items
  int n = arr.length;

  if (partition(arr, n)) {
    //print("Yes");
    return "Can be Partitioned";
  } else {
    //print("No");
    return "Cannot be Partitioned";
  }
}





//Coin Change Problem
const INT_MAX = 9223372036854775807;
// Function to find the minimum number of coins required
// to get total of N from set S
int findMinCoins(List<int> S, int n, int N) {
// T[i] stores minimum number of coins needed to get total of i
  List<int> T = new List<int>(N + 1);
//int T[N + 1];
  T[0] = 0; // 0 coins are needed to get total of i

  for (int i = 1; i <= N; i++) {
// initialize minimum number of coins needed to infinity
    T[i] = INT_MAX;
    int res = INT_MAX;

// do for each coin
    for (int c = 0; c < n; c++) {
// check if index doesn't become negative by including
// current coin c
      if (i - S[c] >= 0) {
        res = T[i - S[c]];
      }

// if total can be reached by including current coin c,
// update minimum number of coins needed T[i]
      if (res != INT_MAX) {
        T[i] = min(T[i], res + 1);
      }
    }
  }

// T[N] stores the minimum number of coins needed to get total of N
  return T[N];
}

String callCoinChangeP(List<int> S,int N) {
// n coins of given denominations
  int n = S.length;

// Total Change required int N

  int coins = findMinCoins(S, n, N);

  if (coins != INT_MAX) {
    print("Minimum number of coins required to get desired change is $coins");
    return "Minimum number of coins required to get desired change is $coins";
  }
  return "";
}
