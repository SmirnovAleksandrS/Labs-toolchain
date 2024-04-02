from matplotlib import pyplot as plt
import numpy as np

ms_size = 0.1

gcc_x =[[], []]
gcc_y =[[], []]
with open("data/qemu/gcc-O1.csv", "r") as f:
    j = 1
    for ch in f:
        gcc_x[0].append(j*10)
        gcc_y[0].append(float(ch[:-1]))
        j += 1

with open("data/LicheePi4A/gcc-O1.csv", "r") as f:
    j = 1
    for ch in f:
        gcc_x[1].append(j*10)
        gcc_y[1].append(float(ch[:-1]))
        j += 1

llvm_x =[[], []]
llvm_y =[[], []]
with open("data/qemu/llvm-O3.csv", "r") as f:
    j = 1
    for ch in f:
        llvm_x[0].append(j*10)
        llvm_y[0].append(float(ch[:-1]))
        j += 1

with open("data/LicheePi4A/llvm-O3.csv", "r") as f:
    j = 1
    for ch in f:
        llvm_x[1].append(j*10)
        llvm_y[1].append(float(ch[:-1]))
        j += 1

plt.plot(gcc_x[0], gcc_y[0], color = "b", marker="+", ms=ms_size, ls="", label="O1 QEMU GCC")
plt.plot(gcc_x[1], gcc_y[1], color = "navy", marker="+", ms=ms_size, ls="", label="O1 LicheePi4A GCC")
plt.plot(llvm_x[0], llvm_y[0], color = "r", marker="+", ms=ms_size, ls="", label="O3 QEMU llvm")
plt.plot(llvm_x[1], llvm_y[1], color = "maroon", marker="+", ms=ms_size, ls="", label="O3 Licheepi4A llvm")

z = np.polyfit(gcc_x[0], gcc_y[0], 1)
p = np.poly1d (z)
plt.plot (gcc_x[0], p(gcc_x[0]), linewidth=0.5)

z = np.polyfit(gcc_x[1], gcc_y[1], 1)
p = np.poly1d (z)
plt.plot (gcc_x[1], p(gcc_x[1]), linewidth=0.5)

z = np.polyfit(llvm_x[0], llvm_y[0], 1)
p = np.poly1d (z)
plt.plot (llvm_x[0], p(llvm_x[0]), linewidth=0.5)

z = np.polyfit(llvm_x[1], llvm_y[1], 1)
p = np.poly1d (z)
plt.plot (llvm_x[1], p(llvm_x[1]), linewidth=0.5)

plt.grid()
plt.xlim(0)
plt.ylim(0)
plt.legend(markerscale=30)
plt.title("All gcc optimizations")
plt.xlabel("Len of massive")
plt.ylabel("Time, s")
plt.savefig("result/qemu_and_licheepi.png")