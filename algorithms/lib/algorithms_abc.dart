import 'dart:math';

//LCS

// Function to find length of Longest Common Subsequence of substring
// X[0..m-1] and Y[0..n-1]
int funLCSLength(String X, String Y) {
  int m = X.length, n = Y.length;

  // lookup table stores solution to already computed sub-problems
  // i.e. lookup[i][j] stores the length of LCS of substring
  // X[0..i-1] and Y[0..j-1]
  var lookup =
      List.generate(m + 1, (i) => List<int>.filled(n + 1, 0), growable: false);

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
String callLCS(String X, String Y) {
  //print("The length of LCS is ${LCSLength(X, Y)}");
  return "Longest Common Subsequence Length is:\n ${funLCSLength(X, Y)}";
}

//SCS
// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
String callSCS(String X, String Y) {
  print(
      "The length of shortest Common supersequence is  ${funSCSLength(X, Y)}");
  return "Shortest Common Supersequence Length is:\n  ${funSCSLength(X, Y)}";
}

// Function to find length of shortest Common supersequence of
// sequences X[0..m-1] and Y[0..n-1]
int funSCSLength(String X, String Y) {
  int m = X.length, n = Y.length;

  // lookup table stores solution to already computed sub-problems
  // i.e. lookup[i][j] stores the length of SCS of substring
  // X[0..i-1] and Y[0..j-1]
  var lookup =
      List.generate(m + 1, (i) => List<int>.filled(n + 1, 0), growable: false);

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

//levenD

// Function to find Levenshtein Distance between string X and Y
// m and n are the number of characters in X and Y respectively
int dist(String X, int m, String Y, int n) {
// for all i and j, T[i,j] will hold the Levenshtein distance between
// the first i characters of X and the first j characters of Y
// note that T has (m+1)*(n+1) values
  var T =
      List.generate(m + 1, (i) => List<int>.filled(n + 1, 0), growable: false);
//int T[m + 1][n + 1] = { 0 };

// source prefixes can be transformed into empty string by
// dropping all characters

  for (int i = 1; i <= m; i++) {
    T[i][0] = i;
  } // (case 1)

// target prefixes can be reached from empty source prefix
// by inserting every character

  for (int j = 1; j <= n; j++) {
    T[0][j] = j;
  } // (case 1)

  int substitutionCost;

// fill the lookup table in bottom-up manner
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (X[i - 1] == Y[j - 1]) {
        substitutionCost = 0;
      } else {
        substitutionCost = 1;
      } // (case 3c)

      T[i][j] = min(
          min(
              T[i - 1][j] + 1, // deletion (case 3b)
              T[i][j - 1] + 1), // insertion (case 3a)
          T[i - 1][j - 1] + substitutionCost); // replace (case 2 & 3c)
    }
  }

  return T[m][n];
}

String callLevenD(String X, String Y) {
  print("The Levenshtein Distance is ${dist(X, X.length, Y, Y.length)}");
  return "The Levenshtein Distance is ${dist(X, X.length, Y, Y.length)}";
}
