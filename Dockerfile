ARG FROM_IMAGE=osrf/ros:noetic-desktop
ARG OVERLAY_WS=/carkin_ws

# multi-stage for caching
FROM $FROM_IMAGE

# clone and copy overlay sources
ARG OVERLAY_WS
WORKDIR $OVERLAY_WS/src
COPY ./tools/pckgs.repos ../
RUN vcs import ./ < ../pckgs.repos &&\
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    apt-get update && rosdep update &&\
    rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO &&\
    && rm -rf /var/lib/apt/lists/* &&\
    catkin build &&\
    source $HOME/catkin_ws/devel/setup.bash

# source entrypoint setup
ENV OVERLAY_WS $OVERLAY_WS
RUN sed --in-place --expression \
      '$isource "$OVERLAY_WS/install/setup.bash"' \
      /ros_entrypoint.sh

# run launch file
CMD [ "roslaunch", "abb_robot_bringup_examples", "ex2_rws_and_egm_6axis_robot.launch"]