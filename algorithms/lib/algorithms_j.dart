// Function to determine if string can be segmented into a space-separated
// sequence of one or more dictionary words
int wordBreak(List<String> dict, String str, List<int> lookup) {
// n stores length of current substring
  int n = str.length;

// return true if we have reached the end of the string
  if (n == 0) {
    return 1;
  }

// if sub-problem is seen for the first time
  if (lookup[n] == -1) {
// mark sub-problem as seen (0 initially assuming string
// can't be segmented)
    lookup[n] = 0;
    for (int i = 1; i <= n; i++) {
// consider all prefixes of current string
      String prefix = str.substring(0, i);

// if prefix is found in dictionary, then recur for suffix
      //(find(dict.first, dict.last, prefix) != dict.last)
      if (dict.contains(prefix) &&
          wordBreak(dict, str.substring(i), lookup) == 1) {
// return true if the string can be segmented
        return lookup[n] = 1;
      }
    }
  }

// return solution to current sub-problem
  return lookup[n];
}

// Word Break Problem
String callWordBreak(List<String> dict, String str) {
// vector of strings to represent dictionary
// we can also use trie or std::set to store dictionary
// input string
// look-up array to store solutions to sub-problems
// lookup[i] stores if substring str[n-i..n) can be segmented or not
  List<int> lookup = new List<int>.filled(str.length + 1, -1);
  int result = wordBreak(dict, str, lookup);
  print(result);
  if (result == 1) {
    print("String can be segmented");
    return "String can be segmented";
  } else if (result == 0) {
    print("String can't be segmented");
    return "String can't be segmented";
  } else {
    print("Error in input");
    return "Error in input";
  }
}
