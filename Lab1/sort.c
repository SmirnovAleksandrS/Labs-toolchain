// #include <iostream>
// #include <chrono>
#include <time.h>
// #include <random>
#include <stdlib.h>
#include <stdio.h>
// #include <fstream>

int rand_uns(int min, int max) {
    // unsigned seed = std::chrono::steady_clock::now().time_since_epoch().count();
    // static std::default_random_engine e(seed);
    // std::uniform_int_distribution<int> d(min, max);
    return min + rand()%max;
}

// using namespace std;

void bubbleSort(int* mas, int len_mas){
    int flag = 1;
    while (flag){
        flag = 0;
        for (int i = 1; i < len_mas; i ++){
            if (mas[i-1] > mas[i]){
                int tm_pr = mas[i-1];
                mas[i-1] = mas[i];
                mas[i] = tm_pr;
                flag = 1;
            }
        }
    }
}

// void gnomeSort(int* mas, int len_mas){
//     int i = 1;
//     int j = 2;
//     while (i < len_mas){
//         if(mas[i-1] < mas[i]){
//             i = j;
//             j ++;
//         } else {
//             int tm_pr = mas[i-1];
//             mas[i-1] = mas[i];
//             mas[i] = tm_pr;
//             i --;
//             if (i == 0){
//                 i = j;
//                 j ++;
//             }
//         }
//     }
// }

// void insertSort(int* mas, int len_mas){
//     for(int i=1; i < len_mas; i++){
//         for(int j=i; j>0 && mas[j-1] > mas[j]; j--){
//             int tm_pr = mas[j-1];
//             mas[j-1] = mas[j];
//             mas[j] = tm_pr;
//         }
//     }   
// }

// void hoarasort(int* a, int first, int last){
//     int i = first, j = last;
//     double tmp, x = a[(first + last) / 2];
//     do {
//         while (a[i] < x)
//             i++;
//         while (a[j] > x)
//             j--;
        
//         if (i <= j) {
//             if (i < j){
//                 tmp=a[i];
//                 a[i]=a[j];
//                 a[j]=tmp;
//             }
//             i++;
//             j--;
//         }
//     } while (i <= j);
    
//     if (i < last)
//         hoarasort(a, i, last);
//     if (first < j)
//         hoarasort(a, first,j);
// }

// void heapify(int arr[], int n, int i){
//     int largest = i;   
//     int l = 2*i + 1;
//     int r = 2*i + 2; 
//     if (l < n && arr[l] > arr[largest])
//         largest = l;
//     if (r < n && arr[r] > arr[largest])
//         largest = r;
//     if (largest != i){
//         swap(arr[i], arr[largest]);
//         heapify(arr, n, largest);
//     }
// }

// void heapSort(int arr[], int n){
//     for (int i = n / 2 - 1; i >= 0; i--)
//         heapify(arr, n, i);
//     for (int i=n-1; i>=0; i--){
//         swap(arr[0], arr[i]);
//         heapify(arr, i, 0);
//     }
// }

// void merge(int arr[], int p, int q, int r) {
//     int n1 = q - p + 1;
//     int n2 = r - q;
//     int L[n1], M[n2];

//     for (int i = 0; i < n1; i++)
//         L[i] = arr[p + i];
//     for (int j = 0; j < n2; j++)
//         M[j] = arr[q + 1 + j];
//     int i, j, k;
//     i = 0;
//     j = 0;
//     k = p;
//     while (i < n1 && j < n2) {
//         if (L[i] <= M[j]) {
//             arr[k] = L[i];
//             i++;
//         } else {
//             arr[k] = M[j];
//             j++;
//         }
//         k++;
//     }
//     while (i < n1) {
//         arr[k] = L[i];
//         i++;
//         k++;
//     }
//     while (j < n2) {
//         arr[k] = M[j];
//         j++;
//         k++;
//     }
// }

// void mergeSort(int arr[], int l, int r) {
//     if (l < r) {
//         int m = l + (r - l) / 2;
//         mergeSort(arr, l, m);
//         mergeSort(arr, m + 1, r);
//         merge(arr, l, m, r);
//   }
// }

#define test_ln 10000
const int MIN_RND = 0;
const int MAX_RND = 10000;
int test_mas[test_ln];

int main(){
    // ofstream f("bubble_gcc.csv", ios::out);
    FILE *fp = fopen("bubble_gcc.csv", "w");
    for (int ln = 10; ln < 10000; ln +=10){
        for(int i =0; i < ln; i ++){
            test_mas[i] = rand_uns(MIN_RND, MAX_RND);
        }
        // heapSort(test_mas, ln);
        // for(int i = ln-1; i > ln / 2; i --){
        //     swap(test_mas[i], test_mas[ln-i+1]);
        // }
        clock_t t;
        t = clock();
        bubbleSort(test_mas, ln);
        t = clock() - t;
        double time_taken = ((double)t)/CLOCKS_PER_SEC;
        // printf("%f\n", time_taken);
        char message[100];
        sprintf(message, "%f\n", time_taken);
        fputs(message, fp);
    }
    fclose(fp);
    
}