#include <iostream>
#include <vector>

using namespace std;

void matrix_vector_multiply(const vector<vector<float>> &matrix1, const vector<float> &vec1,
                            const vector<vector<float>> &matrix2, const vector<float> &vec2,
                            vector<float> &result) {
    int rows = matrix1.size();
    int cols = matrix1[0].size();
    for (int i = 0; i < rows; ++i) {
        result[i] = 0;
        for (int j = 0; j < cols; ++j) {
            result[i] += matrix1[i][j] * vec1[j];
            result[i] += matrix2[i][j] * vec2[j];
            result[i] += matrix1[i][j] + matrix2[i][j]; // Additional operation
        }
    }
}

// void benchmark1() {
//     vector<vector<float>> matrix1 = {{1, 2}, {3, 4}};
//     vector<vector<float>> matrix2 = {{2, 0}, {0, 2}};
//     vector<float> vec1 = {1, 1};
//     vector<float> vec2 = {1, 2};
//     vector<float> result(2);

//     matrix_vector_multiply(matrix1, vec1, matrix2, vec2, result);

//     for (float val : result) {
//         cout << val << " ";
//     }
//     cout << endl;
// }

// void benchmark2() {
//     vector<vector<float>> matrix1 = {{1, 3, 5}, {2, 4, 6}};
//     vector<vector<float>> matrix2 = {{7, 8, 9}, {10, 11, 12}};
//     vector<float> vec1 = {1, 1, 1};
//     vector<float> vec2 = {2, 2, 2};
//     vector<float> result(2);

//     matrix_vector_multiply(matrix1, vec1, matrix2, vec2, result);

//     for (float val : result) {
//         cout << val << " ";
//     }
//     cout << endl;
// }

// void benchmark3() {
//     vector<vector<float>> matrix1 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
//     vector<vector<float>> matrix2 = {{9, 8, 7}, {6, 5, 4}, {3, 2, 1}};
//     vector<float> vec1 = {1, 0, 1};
//     vector<float> vec2 = {0, 1, 0};
//     vector<float> result(3);

//     matrix_vector_multiply(matrix1, vec1, matrix2, vec2, result);

//     for (float val : result) {
//         cout << val << " ";
//     }
//     cout << endl;
// }

// int main() {
//     benchmark1();
//     benchmark2();
//     benchmark3();
//     return 0;
// }
