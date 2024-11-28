#include <string.h>
#include <stdio.h>

#define SIZE 20
#define N 20
int A[SIZE], B[SIZE], C[SIZE], D[SIZE];
int E[SIZE][SIZE], F[SIZE][SIZE], G[SIZE][SIZE], H[SIZE][SIZE];

void kernel()
{
   for (int j = 0; j < SIZE; j++)
   {
      for (int i = 0; i < SIZE; i++)
      {

         C[i] = A[i] + B[i];
         D[i] = A[i] * B[i];
         E[i][j] += C[i];
         F[i][j] += D[i];
         G[i][j] += E[i][j];
         H[i][j] += F[i][j];
      }
   }
}
