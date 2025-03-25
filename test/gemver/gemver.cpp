//------------------------------------------------------------------------
// gemver
//------------------------------------------------------------------------

#include "gemver.h"
#include <stdlib.h>

inout_float_t A[256 * 2];
in_float_t u1[256];
in_float_t v1[256];
in_float_t u2[256];
in_float_t v2[256];
inout_float_t w[256];
inout_float_t x[256];
in_float_t y[256];
in_float_t z[256];

void gemver()
{
  float alpha = 0.73f, beta = 0.69f;
  int ii = 0;
  for (int i = 0; i < N; i++)
  {
    float u11 = u1[i];
    float u22 = u2[i];
  loop_2:
    for (int j = 0; j < N; j += 6)
    {
      A[ii + j] += u11 * v1[j] + u22 * v2[j];
      A[ii + j + 1] += u11 * v1[j + 1] + u22 * v2[j + 1];
      A[ii + j + 2] += u11 * v1[j + 2] + u22 * v2[j + 2];
      A[ii + j + 3] += u11 * v1[j + 3] + u22 * v2[j + 3];
      A[ii + j + 4] += u11 * v1[j + 4] + u22 * v2[j + 4];
      A[ii + j + 5] += u11 * v1[j + 5] + u22 * v2[j + 5];
    }
    ii += N;
  }

  for (int i = 0; i < N; i++)
  {
    float tmp = x[i];
    int jj = 0;
  loop_3:
    for (int j = 0; j < N; j += 6, jj += N)
    {
      tmp += beta * A[jj + i] * y[j];
      tmp += beta * A[jj + i] * y[j + 1];
      tmp += beta * A[jj + i] * y[j + 2];
      tmp += beta * A[jj + i] * y[j + 3];
      tmp += beta * A[jj + i] * y[j + 4];
      tmp += beta * A[jj + i] * y[j + 5];
    }
    x[i] = tmp + z[i];
  }

  int kk = 0;
  for (int i = 0; i < N; i++)
  {
    float tmp = w[i];
  loop_4:
    for (int j = 0; j < N; j += 6)
    {
      tmp = tmp + alpha * A[kk + j] * x[j];
      tmp = tmp + alpha * A[kk + j + 1] * x[j + 1];
      tmp = tmp + alpha * A[kk + j + 2] * x[j + 2];
      tmp = tmp + alpha * A[kk + j + 3] * x[j + 3];
      tmp = tmp + alpha * A[kk + j + 4] * x[j + 4];
      tmp = tmp + alpha * A[kk + j + 5] * x[j + 5];
    }
    w[i] = tmp;
    kk += N;
  }
}

int main(void)
{
  inout_float_t A[65536], A_[65536];
  in_float_t u1[256];
  in_float_t v1[256];
  in_float_t u2[256];
  in_float_t v2[256];
  inout_float_t w[256], w_[256];
  inout_float_t x[256], x_[256];
  in_float_t y[256];
  in_float_t z[256];

  for (int yy = 0; yy < N; ++yy)
  {
    u1[yy] = 0.1f;
    v1[yy] = 0.1f;
    u2[yy] = 0.1f;
    v2[yy] = 0.1f;
    w[yy] = 0.1f;
    x[yy] = 0.1f;
    w_[yy] = 0.1f;
    x_[yy] = 0.1f;
    y[yy] = 0.1f;
    z[yy] = 0.1f;
    for (int x = 0; x < N; ++x)
    {
      A[yy * N + x] = 0.2f;
      A_[yy * N + x] = 0.2f;
    }
  }

  {
    float alpha = 0.73f, beta = 0.69f;
    int ii = 0;
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
        A_[ii + j] += u1[i] * v1[j] + u2[i] * v2[j];
      ii += N;
    }

    for (int i = 0; i < N; i++)
    {
      float tmp = x_[i];
      int jj = 0;
      for (int j = 0; j < N; j++)
      {
        tmp += beta * A_[jj + i] * y[j];
        jj += N;
      }
      x_[i] = tmp + z[i];
    }

    int kk = 0;
    for (int i = 0; i < N; i++)
    {
      float tmp = w_[i];
      for (int j = 0; j < N; j++)
        tmp = tmp + alpha * A_[kk + j] * x_[j];
      w_[i] = tmp;
      kk += N;
    }
  }

  gemver(A, u1, v1, u2, v2, w, x, y, z);

  int res = 0;
  for (int j = 0; j < N; j++)
    res += (w[j] == w_[j]);

  if (res == N)
    return 0;
  else
    return -1;
}
