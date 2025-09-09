#define BATCH_SIZE 1
#define HEAD_SIZE 4
#define SEQ_LEN 16
#define FEATURE_SIZE 16

float input[BATCH_SIZE][HEAD_SIZE][SEQ_LEN]
           [FEATURE_SIZE];                    // corresponds to %114 in MLIR
float output[BATCH_SIZE][HEAD_SIZE][SEQ_LEN]; // corresponds to %alloc in MLIR

void gpt2_reduction_sum() {
  int batch, head, seq, feature;

#pragma scop
  for (batch = 0; batch < BATCH_SIZE; batch++) {
    for (head = 0; head < HEAD_SIZE; head++) {
      for (seq = 0; seq < SEQ_LEN; seq++) {
        for (feature = 0; feature < FEATURE_SIZE; feature++) {
          float val_input = input[batch][head][seq][feature];
          float val_output = output[batch][head][seq];
          float sum = val_input + val_output;
          output[batch][head][seq] = sum;
        }
      }
    }
  }
#pragma endscop
}