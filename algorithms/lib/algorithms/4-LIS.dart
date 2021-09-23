// Iterative function to find longest increasing subsequence
// of given array
void findLIS(List<int> arr, int n) {
// matLIS[i] stores the longest increasing subsequence of subarray
// arr[0..i] that ends with arr[i]
  //var matLIS =new List<List<int>>(n);
  var matLIS = List.generate(n, (i) => <int>[], growable: false);

// matLIS[0] denotes longest increasing subsequence ending with arr[0]
  matLIS[0].add(arr[0]);

// start from second element in the array
  for (int i = 1; i < n; i++) {
// do for each element in subarray arr[0..i-1]
    for (int j = 0; j < i; j++) {
// find longest increasing subsequence that ends with arr[j]
// where arr[j] is less than the current element arr[i]

      if (arr[j] < arr[i] && matLIS[j].length > matLIS[i].length) {
        matLIS[i] = List.from(matLIS[j]);
      }
    }

// include arr[i] in matLIS[i]
    matLIS[i].add(arr[i]);
  }

// uncomment below lines to print contents of vector matLIS
/* for (int i = 0; i < n; i++)
    {
        cout << "matLIS[" << i << "] - ";
        for (int j : matLIS[i])
            cout << j << " ";
        cout << endl;
    } */

// j will contain index of matLIS

  int j = 0;
  for (int i = 0; i < n; i++) {
    if (matLIS[j].length < matLIS[i].length) {
      j = i;
    }
  }

// print matLIS
// for (int i : matLIS[j]) {
//   print("$i ");
// }
  print(matLIS[j]);
}

int main() {
  List<int> arr = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15];
  int n = arr.length;

  findLIS(arr, n);

  return 0;
}
