from matplotlib import pyplot as plt
import numpy as np
ms_size = 0.1


print("Results on QEMU", file=open("result/qemu_result.txt", "w"))
gcc_x = [[],[],[],[]]
gcc_y = [[],[],[],[]]
for i in range(4):
    with open("data/qemu/gcc-O" + str(i) + ".csv", "r") as f:
        j = 1
        for ch in f:
            gcc_x[i].append(j*10)
            gcc_y[i].append(float(ch[:-1]))
            j += 1
plt.plot(gcc_x[0], gcc_y[0], color = "skyblue", marker="+", ms=ms_size, ls="", label="O0 GCC")
plt.plot(gcc_x[1], gcc_y[1], color = "dodgerblue", marker="+", ms=ms_size, ls="", label="O1 GCC")
plt.plot(gcc_x[2], gcc_y[2], color = "royalblue", marker="+", ms=ms_size, ls="", label="O2 GCC")
plt.plot(gcc_x[3], gcc_y[3], color = "navy", marker="+", ms=ms_size, ls="", label="O3 GCC")

coef_gcc = []

z = np.polyfit(gcc_x[0], gcc_y[0], 1)
p = np.poly1d (z)
plt.plot (gcc_x[0], p(gcc_x[0]), linewidth=0.2)
coef_gcc.append(round(z[0]*10**6,5))
print("qemu_gcc_O0 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(gcc_x[1], gcc_y[1], 1)
p = np.poly1d (z)
plt.plot (gcc_x[1], p(gcc_x[1]), linewidth=0.2)
coef_gcc.append(round(z[0]*10**6,5))
print("qemu_gcc_O1 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(gcc_x[2], gcc_y[2], 1)
p = np.poly1d (z)
plt.plot (gcc_x[2], p(gcc_x[2]), linewidth=0.2)
coef_gcc.append(round(z[0]*10**6,5))
print("qemu_gcc_O2 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(gcc_x[3], gcc_y[3], 1)
p = np.poly1d (z)
plt.plot (gcc_x[3], p(gcc_x[3]), linewidth=0.2)
coef_gcc.append(round(z[0]*10**6,5))
print("qemu_gcc_O3 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

plt.grid()
plt.xlim(0)
plt.ylim(0)
plt.legend(markerscale=30)
plt.title("All gcc optimizations")
plt.xlabel("Len of massive")
plt.ylabel("Time, s")
plt.savefig("result/qemu_gcc.png")

plt.clf()

llvm_x = [[],[],[],[]]
llvm_y = [[],[],[],[]]
for i in range(4):
    with open("data/qemu/llvm-O" + str(i) + ".csv", "r") as f:
        j = 1
        for ch in f:
            llvm_x[i].append(j*10)
            llvm_y[i].append(float(ch[:-1]))
            j += 1
plt.plot(llvm_x[0], llvm_y[0], color = "lightcoral", marker="+", ms=ms_size, ls="", label="O0 LLVM")
plt.plot(llvm_x[1], llvm_y[1], color = "firebrick", marker="+", ms=ms_size, ls="", label="O1 LLVM")
plt.plot(llvm_x[2], llvm_y[2], color = "red", marker="+", ms=ms_size, ls="", label="O2 LLVM")
plt.plot(llvm_x[3], llvm_y[3], color = "maroon", marker="+", ms=ms_size, ls="", label="O3 LLVM")

coef_llvm = []

z = np.polyfit(llvm_x[0], llvm_y[0], 1)
p = np.poly1d (z)
plt.plot (llvm_x[0], p(llvm_x[0]), linewidth=0.2)
coef_llvm.append(round(z[0]*10**6,5))
print("qemu_llvm_O0 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(llvm_x[1], llvm_y[1], 1)
p = np.poly1d (z)
plt.plot (llvm_x[1], p(llvm_x[1]), linewidth=0.2)
coef_llvm.append(round(z[0]*10**6,5))
print("qemu_llvm_O1 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(llvm_x[2], llvm_y[2], 1)
p = np.poly1d (z)
plt.plot (llvm_x[2], p(llvm_x[2]), linewidth=0.2)
coef_llvm.append(round(z[0]*10**6,5))
print("qemu_llvm_O2 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))

z = np.polyfit(llvm_x[3], llvm_y[3], 1)
p = np.poly1d (z)
plt.plot (llvm_x[3], p(llvm_x[3]), linewidth=0.2)
coef_llvm.append(round(z[0]*10**6,5))
print("qemu_llvm_O3 ",round(z[0]*10**6,5), " us/val", file=open("result/qemu_result.txt", "a"))


plt.grid()
plt.xlim(0)
plt.ylim(0)
plt.legend(markerscale=30)
plt.title("All llvm optimizations")
plt.xlabel("Len of massive")
plt.ylabel("Time, s")
plt.savefig("result/qemu_llvm.png")

plt.title("All gcc and llvm optimizations")
plt.xlabel("Len of massive")
plt.ylabel("Time, s")
plt.plot(gcc_x[0], gcc_y[0], color = "skyblue", marker="+", ms=ms_size, ls="", label="O0 GCC")
plt.plot(gcc_x[1], gcc_y[1], color = "dodgerblue", marker="+", ms=ms_size, ls="", label="O1 GCC")
plt.plot(gcc_x[2], gcc_y[2], color = "royalblue", marker="+", ms=ms_size, ls="", label="O2 GCC")
plt.plot(gcc_x[3], gcc_y[3], color = "navy", marker="+", ms=ms_size, ls="", label="O3 GCC")
plt.savefig("result/qemu_gcc_llvm.png")

#qemu analyzes
print("\nQEMU results analysis: ", file=open("result/qemu_result.txt", "a"))
gcc_best = min(coef_gcc)
i = 0
while gcc_best != coef_gcc[i]:
    i += 1
print("Best GCC result - " + str(gcc_best) + " us/val - in O" + str(i), file=open("result/qemu_result.txt", "a"))
llvm_best = min(coef_llvm)
i = 0
while llvm_best != coef_llvm[i]:
    i += 1
print("Best LLVM result - " + str(llvm_best) + " us/val - in O" + str(i), file=open("result/qemu_result.txt", "a"))

print("Percentage for the best result", file=open("result/qemu_result.txt", "a"))
print("GCC", file=open("result/qemu_result.txt", "a"))
print("O0", str(round(coef_gcc[0]/gcc_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O1", str(round(coef_gcc[1]/gcc_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O2", str(round(coef_gcc[2]/gcc_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O3", str(round(coef_gcc[3]/gcc_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))

print("LLVM", file=open("result/qemu_result.txt", "a"))
print("O0", str(round(coef_llvm[0]/llvm_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O1", str(round(coef_llvm[1]/llvm_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O2", str(round(coef_llvm[2]/llvm_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))
print("O3", str(round(coef_llvm[3]/llvm_best*100, 1))+ "%", file=open("result/qemu_result.txt", "a"))






# plt.show()