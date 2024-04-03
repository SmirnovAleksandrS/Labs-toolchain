# Исследование компиляторов GCC и LLVM

## Ход исследования

Для проверки производительности кода, полученного от GCC и LLVM измеряли скорость сортировки массива случайных чисел. В качестве алгоритма сортировки использовали сортировку слиянием (O(nLog(n))) с постоянным переопределением вспомогательного массива на куче. Использовался массив длинной 50000 чисел, замеры проводились с шагом 10 чисел, по 10 замеров на одной длине массива, при этом сначала снимался 1 массив целиком, потом 2, 3 и т.д. и после результат усреднялся. 

Для проведения тестов было написано несколько баш скриптов для компилирования всех тестов `build_all.sh`, запуска всех тестов на qemu `start_all.sh` и запуска всех тестов на плате (но он остался на плате).

### QEMU

Результаты всех замеров лежат в `data/qemu`. Поведение оптимизаций обоих компиляторов полностью совпадают с предыдущим исследованием, сейчас так же лучшими оказались O1 для gcc и O3 для llvm.

Старые результаты:

![Старые результаты](./Old/all_grath.png)

Новые результаты:

![Новые результаты](./qemu_gcc_llvm.png)

В этот раз графики получились линейными, так что можно провести анализ скорости выполнения программы в мкс на 1 дополнительное значение в массиве.

```
Results on QEMU
qemu_gcc_O0  0.22551  us/val
qemu_gcc_O1  0.12927  us/val
qemu_gcc_O2  0.15098  us/val
qemu_gcc_O3  0.14963  us/val
qemu_llvm_O0  0.25394  us/val
qemu_llvm_O1  0.19039  us/val
qemu_llvm_O2  0.17955  us/val
qemu_llvm_O3  0.17429  us/val
```

Для сравнения переведем эти данные в относительный вид:

```
GCC
O0 174.4%
O1 100.0%
O2 116.8%
O3 115.7%
LLVM
O0 145.7%
O1 109.2%
O2 103.0%
O3 100.0%
```

Как видно из результатов, скорость работы программы при O2 и O3 оптимизации gcc одинакова до погрешности.

### LicheePi4A

Результаты всех замеров лежат в `data/LicheePi4A`. В этот раз удалось провести бенчмарк также и на реальном процессоре Risc-V на плате LicheePi4A.

![Результаты LicheePi4A](./licheepi_gcc_llvm.png)

Относительно qemu, результат во многом схожий, поведение оптимизаций совпадает, тут также лучший результат gcc это O1, а llvm это O3 оптимизация.

```
Results on Licheepi4a 
licheepi_gcc_O0  0.48739  us/val
licheepi_gcc_O1  0.13798  us/val
licheepi_gcc_O2  0.15011  us/val
licheepi_gcc_O3  0.14966  us/val
licheepi_llvm_O0  0.37996  us/val
licheepi_llvm_O1  0.18363  us/val
licheepi_llvm_O2  0.18048  us/val
licheepi_llvm_O3  0.17706  us/val
```

Относительные результаты также похожи:

```
GCC
O0 353.2%
O1 100.0%
O2 108.8%
O3 108.5%
LLVM
O0 214.6%
O1 103.7%
O2 101.9%
O3 100.0%
```

### Сравнение результатов с платы и эмулятора

Сведем относительные данные в таблицу.

| Gcc | qemu | LichePi4A |
|-----|------|-----------|
| O0  | 174%   | 353% |
| O1  | 100%   | 100% |
| O2  | 116,8%   | 108.8% |
| O3  | 115,7%   | 108.5% |

Как видно из таблицы, любая оптимизация плате принесла вдвое большие результаты чем на qemu. При этом отрыв O1 оптимизации от остальных вдвое сократился.

| LLVM | qemu | LichePi4A |
|-----|------|-----------|
| O0  | 145.7%   | 214% |
| O1  | 109.2%   | 103.7% |
| O2  | 103%   | 101.9% |
| O3  | 100%   | 100% |

Результаты поведения llvm похожи на поведение gcc, наличие любой оптимизации также вдвое лучше ее отсутствия, при этом различия между скоростями оптимизаций вдвое уменьшились.

Единственным крупным отличием между поведением кодов на плате и эмуляторе это скорость выполнения O0 оптимизаций. На плате код от llvm оказался быстрей чем код от gcc.