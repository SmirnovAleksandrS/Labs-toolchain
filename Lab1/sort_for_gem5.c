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

void mergeSort(int *a, int n)
{
  int step = 1;  // шаг разбиения последовательности
  int *temp = (int*)malloc(n * sizeof(int)); // дополнительный массив
  while (step < n)  // пока шаг меньше длины массива
  {
    int index = 0;    // индекс результирующего массива
    int l = 0;      // левая граница участка
    int m = l + step;  // середина участка
    int r = l + step * 2;  // правая граница участка
    do
    {
      m = m < n ? m : n;  // сортируемый участок не выходит за границы последовательности
      r = r < n ? r : n;
      int i1 = l, i2 = m; // индексы сравниваемых элементов
      for (; i1 < m && i2 < r; ) // пока i1 не дошёл до середины и i2 не дошёл до конца
      {
        if (a[i1] < a[i2]) { temp[index++] = a[i1++]; } // заполняем участок результирующей последовательности
        else { temp[index++] = a[i2++]; }
      }
      // Или i1 < m или i2 < r - только один из операторов while может выполниться
      while (i1 < m) temp[index++] = a[i1++]; // заносим оставшиеся элементы сортируемых участков
      while (i2 < r) temp[index++] = a[i2++]; // в результирующий массив
      l += step * 2; // перемещаемся на следующий сортируемый участок
      m += step * 2;
      r += step * 2;
    } while (l < n); // пока левая граница сортируемого участка - в пределах последоватльности
    for (int i = 0; i < n; i++) // переносим сформированный массив обратно в a
      a[i] = temp[i];
    step *= 2; // увеличиваем в 2 раза шаг разбиения
  }
}


#define test_ln 1000
#define trys 10
const int MIN_RND = 0;
const int MAX_RND = 10000;
int test_mas[test_ln];
double times[test_ln/5];

int main(){
    // ofstream f("bubble_gcc.csv", ios::out);
    FILE *fp = fopen("/home/necrosii/Programming/Risc-V/Labs-toolchain/Lab1/data/gem5/out.csv", "w");
    printf("Start bench\n");
    for (int ln = 10; ln <test_ln; ln +=10){
        for (int tr = 0; tr < trys; tr ++){
            for(int i =0; i < ln; i ++){
                test_mas[i] = rand_uns(MIN_RND, MAX_RND);
            }

            clock_t t;
            t = clock();
            mergeSort(test_mas, ln);
            t = clock() - t;

            double time_taken = ((double)t)/CLOCKS_PER_SEC;
            times[ln/10] += time_taken;
        }

        char message[100];
        sprintf(message, "%f\n", times[ln/10]/10);
        fputs(message, fp);
        if (ln % 100 == 0){
          printf("Done with %i\n", ln);
        }
    }
    fclose(fp);
    
}