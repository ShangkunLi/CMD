#include <string.h>
#include <stdio.h>

#define SIZE 20
#define N 20
int A[SIZE], B[SIZE], C[SIZE], D[SIZE];
int E[SIZE][SIZE], F[SIZE][SIZE], G[SIZE][SIZE], H[SIZE][SIZE];

void kernel()
{
   for (int k = 0; k < SIZE; k++)
   {
      for (int j = 0; j < SIZE; j++)
      {
         for (int i = 0; i < SIZE; i++)
         {

            C[i] = A[i] + B[i];
            E[i][j] = C[i];

            if (k == 0)
               F[j][i] = E[i][j];
            else
               F[j][i] = F[j][i] + E[i][j];

            if (j == k)
            {
               D[i] = F[j][i];
               E[i][j] = A[i] + B[j];
            }
            else
            {
               D[i] = D[i] + F[j][i];
               E[i][j] = E[i][j] + A[i] + B[j];
            }
         }
      }
   }
}

int main()
{

   int i, j;

   for (i = 0; i < SIZE; i++)
   {
      A[i] = i * 2 + 5;
      B[i] = i * 3;
      C[i] = 0;
   }

   kernel();

   for (i = 0; i < SIZE; i++)
      printf("%d\n", C[i]);

   return 0;
}
