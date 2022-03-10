<div id="top"></div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

A ROS docker file containing the [abb_robot_driver](https://github.com/Amin173/abb_robot_driver/tree/add_omnicore_support) driver with support for the Omnicore controller.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Docker should be installed on the system.

### Installation

1. Clone the repo
    ```sh
    git clone https://github.com/Amin173/irb1100-hardware-interface.git -b rws2_with_egm
    ```
2. After cloning the repository, run the following command from the project directory:
    ```sh
    docker build . [--options: e.g. -t irb1100_driver:latest]
    ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

After building the docker container, run the following command in the terminal:
   ```sh
   docker run -it  -d -p <port_no>:<port_no?/udp <container_name>:<container_tag>
   ```
Replace <port_no> with the port that you specify for the UdpUc device in RobotStudio. The default port number is currently 6511.
See the [docker run](https://docs.docker.com/engine/reference/run/) refernce for more options. 

Follow the [abb_robot_bringup_examples](https://github.com/Amin173/abb_robot_driver/tree/add_omnicore_support/abb_robot_bringup_examples) instructions to launch the driver and communicate with the robot.
   
To stop the containers from running, run the following command:
   ```sh
   docker stop [OPTIONS] CONTAINER
   ```
<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap
<div id="roadmap"></div>

- [x] Replace OmniCore Controller (RobotWare 7.0+) incompatible RWS services with RWS.
- [x] Install the drivers
- [x] Test the driver with RobotStudio
- [x] Test the driver on the IRB1100 robot
- [] Integrate the hardware interface with MoveIt! to use the moveit commander for controlling the arm.
- [] Transfer the packages to a ROS2 environment

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

