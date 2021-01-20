// Iterative function to find longest increasing subsequence
// of given array
void findLIS(List<int> arr, int n) {
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

// uncomment below lines to print contents of vector LIS
/* for (int i = 0; i < n; i++)
    {
        cout << "LIS[" << i << "] - ";
        for (int j : LIS[i])
            cout << j << " ";
        cout << endl;
    } */

// j will contain index of LIS

  int j=0;
  for (int i = 0; i < n; i++) {
    if (LIS[j].length < LIS[i].length) {
      j = i;
    }
  }

// print LIS
// for (int i : LIS[j]) {
//   print("$i ");
// }
  print(LIS[j]);
}

String callLIS(List<int> arr) {
  int n = arr.length;
  findLIS(arr, n);
  return "LIS";
}



//MCM

// Function to find the most efficient way to multiply
// given sequence of matrices
int MatrixChainMultiplication(List<int> dims, int n) {
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
  print("Minimum cost is ${MatrixChainMultiplication(dims, n)}");
  return "Minimum cost is ${MatrixChainMultiplication(dims, n)}";
}
