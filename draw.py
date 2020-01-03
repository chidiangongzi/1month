# import necessary module
from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import numpy as np
first_2000=np.empty([150,64],dtype=float)
second_2000=np.empty([150,64],dtype=float)
third_2000=np.empty([150,64],dtype=float)
# load data from file
# you replace this using with open
data1 = np.loadtxt("./Trajectory.txt")
first_2000[:,0:63] = data1[:,0:63]/2
second_2000[:,0:63] = data1[:,64:127]/2
third_2000[:,0:63] = data1[:,128:191]/2
# new a figure and set it into 3d
fig = plt.figure()
ax = fig.gca(projection='3d')
# set figure information
ax.set_title("3D_Traj")
ax.set_xlabel("x(km)")
ax.set_ylabel("y(km)")
ax.set_zlabel("z(km)")
print(first_2000)
# draw the figure, the color is r = read
i=0
while (i <63):
  figure1 = ax.plot(first_2000[:,i],second_2000[:,i],third_2000[:,i], c='r')
  i +=1
plt.show()

