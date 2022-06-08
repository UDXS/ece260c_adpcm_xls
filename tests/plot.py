import numpy as np
import matplotlib.pyplot as plt

def s16(value):
    return -(value & 0x8000) | (value & 0x7fff)

lines_s = open("wave.dat").readlines()
data_s = [s16(int(s, 16) << 8) for s in lines_s]

lines_p = open("out.dat").readlines()
data_p = [s16(int(s, 16)) for s in lines_p]


plt.rcParams["figure.figsize"] = [256, 256]
plt.rcParams["figure.autolayout"] = True


x = np.array(range(0, 256))
ys = np.array(data_s)
yp = np.array(data_p)
plt.plot(x,ys, color="blue", label="Sample (in)")
plt.plot(x,yp, color="orange", label="Prediction (out)")

plt.legend()
plt.tight_layout()
plt.show()