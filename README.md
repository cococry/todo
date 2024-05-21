# todo

<img src=https://github.com/cococry/todo/blob/main/branding/todo-showcase.png alt="Todo Showcase">

## Overview
*todo* is a GUI task management that does one job, which is managing & storing your tasks. The app is written completly in C in under 800 lines of code. 

It supports serialization & deserialization of tasks. Furthmore, the app implements a priority system for your tasks and the displayed tasks are sorted from high to low priority.
There is also a filtering system that filters tasks after different critia (eg. completed, high priority,in progress). 

The application is designed with configuration in mind and editing the config.h file will let you configure everything very easily. The source code is also very extensible and it is easy to add or change features if you have some knowledge of C.

## UI

The UI of the applicaton is written entirely with the [leif](https://github.com/cococry/leif) UI library which is a small immediate mode UI framework that i've written. The rendering is done with modern OpenGL by utilising a batch rendering system under the hood. As *todo* using any big UI framework like QT or GTK, it can be considered as very [suckless](https://suckless.org/philosophy).

## Quick Start

On Linux:
```console
git clone https://github.com/cococry/todo
cd todo
./setup.sh
```

On Windows:

You would need to manually create a build script for leif and
build a static library and then link that library with the todo app and compile the app.
That would be a bit of a challange, but possible :)
