# Learning linkers

## Task 3.1

readelf returns:

```
Заголовок ELF:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 
  Класс:                             ELF64
  Данные:                            дополнение до 2, от младшего к старшему
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  Версия ABI:                        0
  Тип:                               REL (Перемещаемый файл)
  Машина:                            Advanced Micro Devices X86-64
  Версия:                            0x1
  Адрес точки входа:                 0x0
  Начало заголовков программы:       0 (байт в файле)
  Начало заголовков раздела:         680 (байт в файле)
  Флаги:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           64 (bytes)
  Number of section headers:         14
  Section header string table index: 13
  ```


+ What is the type of the file? - ELF
+ How many sections are there? - 14
+ List all entries in the same format readelf prints it
  
  fact.o
```
Таблица символов «.symtab» содержит 7 элементов:
   Чис:    Знач           Разм Тип     Связ   Vis      Индекс имени
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS main.c
     2: 0000000000000000     0 SECTION LOCAL  DEFAULT    1 .text
     3: 0000000000000000     0 SECTION LOCAL  DEFAULT    5 .rodata
     4: 0000000000000000    58 FUNC    GLOBAL DEFAULT    1 main
     5: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND fact
     6: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND printf
```
+ Why does entries for print and fact functions have NOTYPE type?
  На этом этапе они еще не скомпилированы и не подключены
+ Modify the following example so executable is produced correctly.
  Можно добавить include "fact.c" в main.c, но это не по правилам языка.

```
Таблица символов «.symtab» содержит 8 элементов:
Чис:    Знач           Разм Тип     Связ   Vis      Индекс имени
    0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
    1: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS main.c
    2: 0000000000000000     0 SECTION LOCAL  DEFAULT    1 .text
    3: 0000000000000000     0 SECTION LOCAL  DEFAULT    5 .rodata
    4: 0000000000000000     4 OBJECT  GLOBAL DEFAULT    4 counter
    5: 0000000000000000    43 FUNC    GLOBAL DEFAULT    1 fact
    6: 000000000000002b    53 FUNC    GLOBAL DEFAULT    1 main
    7: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND printf
```

## Task 3.2