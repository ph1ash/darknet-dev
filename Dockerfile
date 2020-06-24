FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt install -y --no-install-recommends \
                     git \
                     pkg-config \
                     build-essential \
                     cmake \
                     autoconf \
                     automake \
                     libtool \
                     libopencv-dev \
                     curl \
                     wget \
                     unzip

RUN git clone https://github.com/AlexeyAB/darknet.git /app/darknet
WORKDIR /app/darknet

RUN make GPU=1 CUDNN=1 OPENCV=1 LIBSO=1

COPY yolov4.weights /app/darknet/weights/yolov4.weights
COPY output.mp4 /data/output.mp4

#RUN wget -P /data http://images.cocodataset.org/zips/test2017.zip && unzip /data/test2017.zip
#RUN wget -P /data https://raw.githubusercontent.com/AlexeyAB/darknet/master/scripts/testdev2017.txt

CMD /bin/bash
