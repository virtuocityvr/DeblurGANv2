FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
RUN apt-get update

# Install c++/python dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y libsparsehash-dev
RUN apt-get install -y libopenblas-dev
RUN apt-get install -y libopenexr-dev
RUN apt-get install -y python3-distutils
RUN apt-get install -y python3-dev
RUN apt-get install -y libpython3-dev
RUN apt-get install -y curl
RUN apt-get install -y git

# Open3D dependencies (all needed?)
RUN apt-get install -y xorg-dev libglu1-mesa-dev libgl1-mesa-glx
RUN apt-get install -y libglew-dev
RUN apt-get install -y libglfw3-dev
RUN apt-get install -y libjsoncpp-dev
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libsdl2-dev
RUN apt-get install -y python-dev python-tk
RUN apt-get install -y python3-dev python3-tk
RUN apt-get install -y libglu1-mesa-dev
RUN apt-get install -y libc++-7-dev
RUN apt-get install -y libc++abi-7-dev
RUN apt-get install -y ninja-build
RUN apt-get install -y libxi-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libjpeg-dev

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py

RUN pip install numpy
RUN pip install torch==1.5.0
RUN pip install torchvision==0.6.0
RUN pip install pretrainedmodels
RUN pip install opencv-python-headless
RUN pip install joblib
RUN pip install boto3
RUN pip install Pillow
RUN pip install google-cloud-storage
RUN pip install xmltodict
RUN pip install scikit-image
RUN pip install tqdm
RUN pip install glog
RUN pip install albumentations
RUN pip install pyssim
RUN pip install fire
RUN pip install tensorboard
RUN pip install tensorboardx
RUN pip install torchsummary
RUN pip install spotty
RUN pip install future

# create and copy source
RUN mkdir deblur-gan-v2

# copy source
COPY checkpoints deblur-gan-v2/checkpoints
COPY config deblur-gan-v2/config
COPY models deblur-gan-v2/models
COPY util deblur-gan-v2/util

COPY adversarial_trainer.py deblur-gan-v2/adversarial_trainer.py
COPY aug.py deblur-gan-v2/aug.py
COPY dataset.py deblur-gan-v2/dataset.py
COPY LICENSE deblur-gan-v2/LICENSE
COPY schedulers.py deblur-gan-v2/schedulers.py
COPY metric_counter.py deblur-gan-v2/metric_counter.py
COPY predict.py deblur-gan-v2/predict.py
COPY train.py deblur-gan-v2/train.py

WORKDIR ./deblur-gan-v2
# ENTRYPOINT ["python", "-m", "plan_view.train"]