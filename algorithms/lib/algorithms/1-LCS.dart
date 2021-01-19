import 'dart:math';

// Function to find length of Longest Common Subsequence of substring
// X[0..m-1] and Y[0..n-1]

int LCSLength(String X, String Y) {
  int m = X.length, n = Y.length;

  // lookup table stores solution to already computed sub-problems
  // i.e. lookup[i][j] stores the length of LCS of substring
  // X[0..i-1] and Y[0..j-1]
  var lookup = List.generate(m + 1, (i) => List<int>(n + 1), growable: false);

  // first column of the lookup table will be all 0
  for (int i = 0; i <= m; i++) {
    lookup[i][0] = 0;
  }

  // first row of the lookup table will be all 0
  for (int j = 0; j <= n; j++) {
    lookup[0][j] = 0;
  }

  // fill the lookup table in bottom-up manner
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      // if current character of X and Y matches
      if (X[i - 1] == Y[j - 1]) {
        lookup[i][j] = lookup[i - 1][j - 1] + 1;
      } else {
        lookup[i][j] = max(lookup[i - 1][j], lookup[i][j - 1]);
      }
    }
  }

  // LCS will be last entry in the lookup table
  return lookup[m][n];
}

// Longest Common Subsequence
int main() {
  String X = "XMJYAUZ", Y = "MZJAWXU";
  print("The length of LCS is ${LCSLength(X, Y)}");

  return 0;
}
