#Sofar
2D SLAM in cartographer with the current lidar is finished.
New rosbag with imu data coming in, fixed the robot model so the direction is right, now the params need to be adjust so the right trajectory can be set.
#Existing problem:
rotation and translation is both odd, along with the pointcloud of Toposens is very few.
The main problem is presumably the drifting in movement, whether the imu data is wrong or the cartographer's global SLAM is not working haven't been decieded but the chance is they both have problems.
