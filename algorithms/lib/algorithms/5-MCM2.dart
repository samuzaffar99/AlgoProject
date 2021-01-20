
const int INT_MAX = 99999;


var  m;// = List.generate(4, (i) => List(4), growable: false);
var s;// = List.generate(4, (i) => List(4), growable: false);
var p;// = new List<int>();//[10, 30, 5, 60];

int i=0,j=0,n=0;

String getOptimal(int i, int j) {
  String Parenth="";
  if (i == j)
    Parenth+=" A$i ";
  else {
    Parenth+="( ";
    Parenth+=getOptimal(i, s[i][j]);
    Parenth+=getOptimal(s[i][j] + 1, j);
    Parenth+=" )";
  }
  return Parenth;
}

void matmultiply() {
  num q = 0;
  int k = 0;
  for (i = n; i > 0; i--) {
    for (j = i; j <= n; j++) {
      if (i == j)
        m[i][j] = 0;
      else {
        for (k = i; k < j; k++) {
          q = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
          if (q < m[i][j]) {
            m[i][j] = q;
            s[i][j] = k;
          }
        }
      }
    }
  }
}

int MatrixChainOrder(var p, int i, int j) {
  if (i == j) return 0;
  int k = 0;
  int min = INT_MAX;
  int count;

  for (k = i; k < j; k++) {
    count = MatrixChainOrder(p, i, k) +
        MatrixChainOrder(p, k + 1, j) +
        p[i - 1] * p[k] * p[j];

    if (count < min) {
      min = count;
    }
  }
  // Return minimum count
  return min;
}

String callMCM(List<int> input) {
  i = j = n = 0;
  p= List.from(input);
  s = List.from(List.generate(p.length, (i) => List<int>.filled(p.length,0), growable: false));
  m = List.from(List.generate(p.length, (i) => List<int>.filled(p.length,0), growable: false));
  n = p.length - 1;
  for (i = 1; i <= n; i++) {
    for (j = i + 1; j <= n; j++) {
      m[i][i] = 0;
      m[i][j] = INT_MAX;
      s[i][j] = 0;
    }
  }

  matmultiply();
  i = 1;
  j = n;
  var res = MatrixChainOrder(p, 1, n);
  print("here");
  return "Parenthesization : ${getOptimal(i, j)}\nMinimum Cost of Multiplication : $res";
}

int main(){
  print(callMCM([10, 20, 80,50]));
  return 0;
}