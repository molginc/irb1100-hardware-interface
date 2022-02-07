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
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

A ros-melodic docker file with the abb_hardware_interface driver installed for the IRB1100 with the Omnicore controller.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Docker should be installed on the system.

### Installation

1. Clone the repo
    ```sh
    git clone https://github.com/Amin173/irb1100-hardware-interface.git
    ```
2. In the Dockerfile, update the ROBOT_IP argument.
3. After cloning the repository, run the following command from the project directory:
    ```sh
    docker build . [--options: e.g. -t irb1100_driver:latest]
    ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

After building the docker container, run the following command in the terminal:
   ```sh
   docker run -it  <container_name>:<container_tag>
   ```
or, if built with docker-compose, you can run:
   ```sh
   docker-compose -it  <container_name>:<container_tag>
   ```
See the [docker run](https://docs.docker.com/engine/reference/run/) refernce for more options. 

To stop the containers from running, run the following command:
   ```sh
   docker stop [OPTIONS] CONTAINER
   ```
<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [x] Replace incoompatible RWS service with manual robot descritption publisher to run EGM (see more details from [here](https://githubmemory.com/repo/ros-industrial/abb_robot_driver/issues/33?page=2)).
- [x] Install the drivers
- [] Test the driver with RobotStudio
- [] Test the driver on the IRB1100 robot
- [] Transfer the packages to a ROS2 environment
- [] Modify the [abb_rws](https://github.com/ros-industrial/abb_librws) driver to become compatible with the OmniController (this enables using the full capadbilities of the [abb_robot_driver](https://github.com/ros-industrial/abb_robot_driver) package)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

