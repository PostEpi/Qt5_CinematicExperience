cmake_minimum_required(VERSION 3.16)

project(Qt5_CinematicExperience VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Gui Qml Quick QUIET)
if(Qt6_FOUND)
    set(QT_VERSION_MAJOR 6)
else()
    find_package(Qt5 REQUIRED COMPONENTS Core Gui Qml Quick)
    set(QT_VERSION_MAJOR 5)
endif()

message(STATUS "Building with Qt ${QT_VERSION_MAJOR}")

add_executable(Qt5_CinematicExperience
    main.cpp
    rc.qrc
)

target_link_libraries(Qt5_CinematicExperience
    PRIVATE
        Qt${QT_VERSION_MAJOR}::Core
        Qt${QT_VERSION_MAJOR}::Gui
        Qt${QT_VERSION_MAJOR}::Qml
        Qt${QT_VERSION_MAJOR}::Quick
)

set(INSTALL_AUTORUN_DIR "/home/mts/autorun" CACHE PATH "Runtime install directory")

install(TARGETS Qt5_CinematicExperience
    RUNTIME DESTINATION "${INSTALL_AUTORUN_DIR}"
)
