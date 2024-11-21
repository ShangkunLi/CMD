#define NTAPS 32

float input[NTAPS];
float output[NTAPS];
float coefficients[NTAPS] = {0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25,
                             0.25, 1.50, 3.75, -2.25, 0.50, 0.75, -3.00, 1.25};

void kernel()
/*   input :           input sample array */
/*   output:           output sample array */
/*   coefficient:      coefficient array */
{
    int i;
    int j = 0;

    // for (j = 0; j < NTAPS; ++j)
    // {
    for (i = 0; i < NTAPS - 1; ++i)
    {
        // out1 += input1[i] * coefficient1[i];
        // out2 += input2[i] + coefficient2[i];
        // *output += out1 + out2;

        input[i + 1] += coefficients[i] * input[i];
    }
    // }
}