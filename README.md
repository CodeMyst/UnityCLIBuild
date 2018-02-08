# UnityCLIBuild
Build a Unity project in CLI so you can keep on working while it builds in the background.

Place these files at the root of your project.

#### NOTE: Make sure to rename the paths in the Build.bat and Excludes.bat files according to your own folder structure / folder names.

## How to use

To use the build command simply cd to your project directory and use the build command like so:
```bat
build os version
```

Where os can be: windows, linux, macos
And version can be any string to indicate the version of the build. You cannot build a version if the version already exist for the specified OS. If you want to rebuild a version you have to delete the folder for that version build.

To check the latest version number you can do:
```bat
build os -l
```

## TODO:

* More user friendly way of setting the paths
