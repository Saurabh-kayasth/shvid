# shvid


## To run locally 
Run these commands in root dir of this project

Note: Change the ffmpeg path in the CMakeLists.txt before running these commands
```sh
cmake .
make
build/shvid -m
```

### To run it on a custom shell
From:
```c
handle_command_args(argv);

// to use custom shell
// loop();
```
Example: ``build/shvid -m``

---

To
```c
// handle_command_args(argv);

// to use custom shell
loop();
```
Example: ``shvid -m``

## Build the Docker Image:
```sh
docker build -t shvid:latest . 
```

## Run the Docker Container
```sh
docker run --rm --name shvid -it shvid:latest
```

## To install it on your system
```sh
sudo make install
```

### Usages
```sh
shvid --tool=ss input.mp4 3
```