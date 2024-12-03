#include <string.h>
#include <stdio.h>

#define SIZE 32
#define N 32
int A[SIZE], B[SIZE], C[SIZE], D[SIZE];
// // int E[SIZE], F[SIZE], G[SIZE], H[SIZE];
// int E[SIZE][SIZE], F[SIZE][SIZE], G[SIZE][SIZE], H[SIZE][SIZE];

// int A[SIZE][SIZE], B[SIZE][SIZE], C[SIZE][SIZE];

void kernel()
{
   for (int i = 0; i < SIZE; i++)
   {
      // for (int j = 0; j < SIZE; j++)
      // {
      // for (int k = 0; k < SIZE; k++)
      // {
      //    C[i][j] += A[i][k] * B[k][j];
      // }

      // C[i] = A[i] + B[i];
      // D[i] = A[i] * B[i];
      // G[i][j] = E[i][j] + F[i][j];
      // H[i][j] = E[i][j] * F[i][j];
      // }
      C[i] = A[i] + B[i];
      D[i] = A[i] * B[i];
   }
}
