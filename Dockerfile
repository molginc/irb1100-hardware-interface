ARG FROM_IMAGE=osrf/ros:noetic-desktop
ARG OVERLAY_WS=/home/catkin_ws
ARG ROBOT_IP=<enter-robot-ip>

FROM $FROM_IMAGE

# clone workspace source
ARG OVERLAY_WS
WORKDIR $OVERLAY_WS/src
COPY ./tools/pckgs.rosinstall ../
RUN apt update 
RUN rosdep update
RUN apt install ros-$ROS_DISTRO-catkin python3-catkin-tools python3-osrf-pycommon -y
RUN apt install git -y
RUN wstool init . ../pckgs.rosinstall 
RUN wstool update -t . 

# Setup catkin workspace
WORKDIR $OVERLAY_WS
RUN rosdep update
RUN rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y
RUN rm -rf /var/lib/apt/lists/*  
RUN catkin config --extend /opt/ros/${ROS_DISTRO}
RUN catkin build
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo "source ${OVERLAY_WS}/devel/setup.bash" >> ~/.bashrc

# default launch command
CMD ["bash"]

# could be replaced with something like the example launch file below when the driver is working:
# CMD [ "roslaunch", "abb_robot_bringup_examples", "ex2_rws_and_egm_6axis_robot.launch"]