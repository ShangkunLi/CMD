#define SIZE 1000

// conpress
int row0[300];
int col0[300];
int value0[300];
int matrix0[50][50];
void kernel()
{
    /*
    for (i = 0; i < nnz; ++i) {
      for (j = 0; j < size; ++j) {
        temp = val[i] * feature[ col[i] ][ j ];
        output[ row[i] ][ j ] += temp;
      }
    }
    */
    int maxNodeCount = 50;
    int index = 0;
    int total = maxNodeCount * maxNodeCount;
    for (int x = 0; x < total; ++x)
    {
        int i = x / maxNodeCount;
        int j = x % maxNodeCount;
        value0[index] = matrix0[i][j];
        row0[index] = i;
        col0[index] = j;
        if (matrix0[i][j] != 0)
        {
            index++;
        }
    }
}

// aggregate1
int nnz = 100;
float val[SIZE];
int col[SIZE];
int row[SIZE];
float **feature1;
float **output1;

void kernel1()
{
    int i = 0;
    int j = 0;
    float temp;
    int size = 50;

    /*
    for (i = 0; i < nnz; ++i) {
      for (j = 0; j < size; ++j) {
        temp = val[i] * feature[ col[i] ][ j ];
        output[ row[i] ][ j ] += temp;
      }
    }
    */
    int X = nnz * size;
    int x = 0;
    for (x = 0; x < X; ++x)
    {
        i = x / size;
        j = x % size;
        temp = val[i] * feature1[col[i]][j];
        output1[row[i]][j] += temp;
    }
}

// aggregate2
// int nnz2 = 100;
// float val2[SIZE];
// int col2[SIZE];
// int row2[SIZE];
float **feature2;
float **output2;
void kernel2()
{
    int i = 0;
    int j = 0;
    float temp;
    int size = 50;

    /*
    for (i = 0; i < nnz; ++i) {
      for (j = 0; j < size; ++j) {
        temp = val[i] * feature[ col[i] ][ j ];
        output[ row[i] ][ j ] += temp;
      }
    }
    */
    int X = nnz * size;
    int x = 0;
    for (x = 0; x < X; ++x)
    {
        i = x / size;
        j = x % size;
        temp = val[i] * feature2[col[i]][j];
        output2[row[i]][j] += temp;
    }
}

// combine & Relu
float A[50][50];
float B[50][50];
float output[50][50];
int I = 5, J = 6, K = 7;
void combine()
{
    int i = 0;
    int j = 0;
    int k = 0;

    /*
    for (i = 0; i < I; ++i) {
      for (j = 0; j < J; ++j) {
        for (k = 0; k < K; ++k) {
          output[i][j] += A[i][k] * B[k][j];
        }
      }
    }
    */

    int X = I * J * K;
    int x = 0;
    for (x = 0; x < X; ++x)
    {
        i = x / (J * K);
        k = (x / J) % K;
        j = x % J;
        output[i][j] += A[i][k] * B[k][j];
        if (k == K - 1 && output[i][j] < 0)
        {
            output[i][j] = 0;
        }
    }
}

// combineRelu
void combineRelu()
{
    int i = 0;
    int j = 0;
    int k = 0;

    /*
    for (i = 0; i < I; ++i) {
      for (j = 0; j < J; ++j) {
        for (k = 0; k < K; ++k) {
          output[i][j] += A[i][k] * B[k][j];
        }
      }
    }
    */

    int X = I * J * K;
    int x = 0;
    for (x = 0; x < X; ++x)
    {
        i = x / (J * K);
        k = (x / J) % K;
        j = x % J;
        output[i][j] += A[i][k] * B[k][j];
        if (k == K - 1 && output[i][j] < 0)
        {
            output[i][j] = 0;
        }
    }
}

// pooling
float output3[30];
void pooling()
{
  int i = 0;
  int j = 0;

  /*
  for (i = 0; i < I; ++i) {
    for (j = 0; j < J; ++j) {
      output[j] += A[i][j];
    }
  }
  */

  int X = I*J;
  int x = 0;
  for (x = 0; x < X; ++x) {
    i = x / J;
    j = x % J;
    output3[j] += A[i][j];
  }

}

int main()
{
    kernel();
    kernel1();
    // kernel2();
    combine();
    pooling();
    return 0;
}