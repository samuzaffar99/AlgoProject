import 'dart:math';

// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
int main() {
  String X = "ABCBDAB", Y = "BDCABA";
  print("The length of shortest Common supersequence is  ${SCSLength(X, Y)}");
  return 0;
}

// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
int SCSLength(String X, String Y) {
  int m = X.length, n = Y.length;

  // lookup table stores solution to already computed sub-problems
  // i.e. lookup[i][j] stores the length of SCS of substring
  // X[0..i-1] and Y[0..j-1]
  var lookup = List.generate(m + 1, (i) => List<int>(n + 1), growable: false);

  // initialize first column of the lookup table
  for (int i = 0; i <= m; i++) lookup[i][0] = i;

  // initialize first row of the lookup table
  for (int j = 0; j <= n; j++) lookup[0][j] = j;

  // fill the lookup table in bottom-up manner
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      // if current character of X and Y matches
      if (X[i - 1] == Y[j - 1]) {
        lookup[i][j] = lookup[i - 1][j - 1] + 1;
      } else {
        lookup[i][j] = min(lookup[i - 1][j] + 1, lookup[i][j - 1] + 1);
      }
    }
  }

  // SCS will be last entry in the lookup table
  return lookup[m][n];
}
