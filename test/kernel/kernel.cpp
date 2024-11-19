#define NTAPS 32

float input[NTAPS];
float output[NTAPS];
float temp[NTAPS];
float coefficients[NTAPS] = {0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25};

void kernel(float input[], float output[], float coefficient[]);

int main()
{

  //  input_dsp (input, NTAPS, 0);

  kernel(input, output, coefficients);

  //  output_dsp (input, NTAPS, 0);
  //  output_dsp (coefficients, NTAPS, 0);
  //  output_dsp (output, NTAPS, 0);
  return 0;
}

void kernel()
/*   input :           input sample array */
/*   output:           output sample array */
/*   coefficient:      coefficient array */
{
  int i;
  int j = 0;

  // for (j = 0; j < NTAPS; ++j)
  // {
  for (i = 0; i < NTAPS; ++i)
  {
    // out1 += input1[i] * coefficient1[i];
    // out2 += input2[i] + coefficient2[i];
    // *output += out1 + out2;

    output[j] += coefficients[i] * input[i];
  }
  // }
}