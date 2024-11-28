#include "kernel.h"

data_t A[I][K], B[J][K], C[I][J], C_golden[I][J];

int main(int argc, char **argv)
{

  for (int i = 0; i < I; i++)
    for (int k = 0; k < K; k++)
    {
      A[i][k] = (data_t)rand() / RAND_MAX;
    }

  for (int j = 0; j < J; j++)
    for (int k = 0; k < K; k++)
    {
      B[j][k] = (data_t)rand() / RAND_MAX;
    }

#pragma scop
  for (int i = 0; i < I; i++)
    for (int j = 0; j < J; j++)
    {
      // C[i][j] = 0;
      for (int k = 0; k < K; k += 8)
      {
        C[i][j] = C[i][j] + A[i][k] * B[j][k];
        C[i][j] = C[i][j] + A[i][k + 1] * B[j][k + 1];
        C[i][j] = C[i][j] + A[i][k + 2] * B[j][k + 2];
        C[i][j] = C[i][j] + A[i][k + 3] * B[j][k + 3];
        C[i][j] = C[i][j] + A[i][k + 4] * B[j][k + 4];
        C[i][j] = C[i][j] + A[i][k + 5] * B[j][k + 5];
        C[i][j] = C[i][j] + A[i][k + 6] * B[j][k + 6];
        C[i][j] = C[i][j] + A[i][k + 7] * B[j][k + 7];
      }
    }
#pragma endscop

  // for (int i = 0; i < I; i++)
  //   for (int j = 0; j < J; j++)
  //   {
  //     C_golden[i][j] = 0;
  //     for (int k = 0; k < K; k += 6)
  //     {
  //       C_golden[i][j] = C_golden[i][j] + A[i][k] * B[j][k];
  //       C_golden[i][j] = C_golden[i][j] + A[i][k + 1] * B[j][k + 1];
  //       C_golden[i][j] = C_golden[i][j] + A[i][k + 2] * B[j][k + 2];
  //       C_golden[i][j] = C_golden[i][j] + A[i][k + 3] * B[j][k + 3];
  //       C_golden[i][j] = C_golden[i][j] + A[i][k + 4] * B[j][k + 4];
  //       C_golden[i][j] = C_golden[i][j] + A[i][k + 5] * B[j][k + 5];
  //     }
  //   }

  // int err = 0;
  // for (int i = 0; i < I; i++)
  //   for (int j = 0; j < J; j++)
  //   {
  //     if (fabs((float)C_golden[i][j] - (float)C[i][j]) > 0.001)
  //       err++;
  //   }

  // if (err)
  //   printf("Failed with %d errors!\n", err);
  // else
  //   printf("Passed!\n");

  return 0;
}
