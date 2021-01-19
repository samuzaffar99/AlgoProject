// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
import 'dart:math';

int SCSLength(String X, String Y, int m, int n) {
// if we have reached the end of either sequence, return
// length of other sequence
  if (m == 0 || n == 0) return n + m;

// if last character of X and Y matches
  if (X[m - 1] == Y[n - 1])
    return SCSLength(X, Y, m - 1, n - 1) + 1;
  else
// else if last character of X and Y don't match
    return min(SCSLength(X, Y, m, n - 1) + 1, SCSLength(X, Y, m - 1, n) + 1);
}

int main() {
  String X = "ABCBDAB", Y = "BDCABA";
  int m = X.length, n = Y.length;

  print(
      "The length of shortest Common supersequence is  ${SCSLength(X, Y, m, n)}");
  print("The length of shortest Common supersequence is  ${SCSLengthDP(X, Y)}");
  return 0;
}

// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
int SCSLengthDP(String X, String Y) {
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
