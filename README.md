<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
# YOLOv4 Dev
Dockerfile + supporting resources for developing & training with YOLOv4 

## Prerequisites
- [ ] Host machine has Docker 19.03> installed and is capable of Docker GPU access
- [ ] NVIDIA driver version 440.59> installed on host
- [ ] CUDA driver version 10.0> installed on host
- [ ] `nvidia-container-toolkit` installed on host

## How to use
### Build from Dockerfile
Before building, ensure that all the resources have been pulled down with git LFS
```bash
git lfs pull
```

To build a new YOLOv4-dev Docker image, run the following command in the same location as the Dockerfile
```bash
docker build -t <IMAGE_NAME> .
```

### Creating a new container
To create a new container to run YOLOv4 within, run
```bash
docker run -it --gpus all <IMAGE_NAME>
```
or if you wish to have local storage attached for a bit of persistence, run
```bash
docker run -it --gpus all -v <HOST_PATH>:<CONTAINER_PATH> <IMAGE_NAME>
```

### Running YOLOv4 - Detection on .mp4
Once connected to a container, run the following command to generate a video with labeled detections
```bash
cd /app/darknet
./darknet detector demo cfg/coco.data cfg/yolov4.cfg weights/yolov4.weights /data/output.mp4 -dont_show -out_filename test.mp4
```
