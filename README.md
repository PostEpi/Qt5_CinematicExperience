# Qt5_CinematicExperience

To run a Qt application, you must install the package as follows.

## qt5.sh
sudo apt-get install -y build-essential mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev

sudo apt install -y gnustep gnustep-devel qtbase5-dev cmake 
sudo apt install -y qt5-qmltooling-plugins 
sudo apt install -y qtdeclarative5-dev 
sudo apt install -y qtdeclarative5-examples qtbase5-examples 
sudo apt install -y qml-module-qtquick-controls 
sudo apt install -y qtmultimedia5-dev 
sudo apt install -y libqt5multimedia5-plugins 
sudo apt install -y libqt5serialport5 
sudo apt install -y libqt5serialport5-dev 
sudo apt install -y clang 
sudo apt install -y libc++-dev libc++abi-dev 
sudo apt install -y imagemagick 
sudo apt install -y qml-module-qtmultimedia 
sudo apt install -y qml-module-qtquick-controls2

sudo apt install -y gstreamer1.0-plugins-base gstreamer1.0-plugins-good
gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
gstreamer1.0-libav

## qt6.sh
sudo apt install -y qt6-base-dev qt6-declarative-dev qt6-tools-dev qt6-tools-dev-tools 
sudo apt install -y qmake6 
sudo apt install -y qml6-module-qtquick qml6-module-qtquick-window qml6-module-qtquick-particles qml6-module-qtquick-dialogs 
sudo apt install -y qt6-wayland 
sudo apt install -y gnustep gnustep-devel cmake \
qml6-module-qtquick-controls \
qml6-module-qtquick-templates \
qml6-module-qtquick-layouts \
qt6-multimedia-dev \
libqt6multimedia6-plugins \
libqt6serialport6-dev 
sudo apt install -y libqt6sql6-sqlite
sudo apt install -y qt6-serialport-dev qt6-multimedia-dev

sudo apt install -y gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
gstreamer1.0-libav

sudo apt install -y pavucontrol 
sudo apt install -y fonts-nanum 
sudo apt install -y fonts-noto-cjk

## how to build
1. nexell
source /opt/poky/2.5.1/environment-setup-aarch64-poky-linux
qmake
make

2. CM5 or Ubuntu  (QT 5.15.15)
qmake
make

3. CM5 or Ubuntu (QT 6.8)
* Work on it after changing to the Qt6 branch.
qmake6
make

or

cmake -S . -B build-qt -DCMAKE_BUILD_TYPE=Release
cmake --build build-qt -j$(nproc)

4. NXP 8mplus (QT 6.8)
* Work on it after changing to the Qt6 branch.
source /opt/fsl-imx-wayland/6.6-scarthgap/environment-setup-armv8a-poky-linux 
cmake -S . -B build-qt -DCMAKE_BUILD_TYPE=Release
cmake --build build-qt -j$(nproc)
