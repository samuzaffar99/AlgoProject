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
      c[i][j] = 9223372036854775807 ; //maxInt64

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
int main() {
// Matrix M[i] has dimension dims[i-1] x dims[i] for i = 1..n
// input is 10 x 30 matrix, 30 x 5 matrix, 5 x 60 matrix
  List<int> dims = [10, 30, 5, 60];
  int n = dims.length;

  print("Minimum cost is ${MatrixChainMultiplication(dims, n)}");

  return 0;
}
