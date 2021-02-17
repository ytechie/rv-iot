# rv-iot

To build the container:
`docker build -t rvnodered`

To run the container:
`docker run -it -p 1880:1880 -v node_red_data:/data --privileged rvnodered`