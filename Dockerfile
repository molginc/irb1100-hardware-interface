ARG FROM_IMAGE=osrf/ros:noetic-desktop
ARG OVERLAY_WS=/home/carkin_ws

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
RUN rosdep install --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y
RUN rm -rf /var/lib/apt/lists/* 

WORKDIR $OVERLAY_WS
RUN catkin config --extend /opt/ros/${ROS_DISTRO} --cmake-args -DCMAKE_BUILD_TYPE=Release && \
    catkin build 

# source entrypoint setup
ENV OVERLAY_WS $OVERLAY_WS

RUN sed --in-place --expression \
      '$isource "$OVERLAY_WS/install/setup.bash"' \
      /ros_entrypoint.sh

# run launch file
CMD [ "roslaunch", "abb_robot_bringup_examples", "ex2_rws_and_egm_6axis_robot.launch"]