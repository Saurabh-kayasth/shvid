# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sportvot/Desktop/MY-PROJECTS/LIL-FFMPEG

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sportvot/Desktop/MY-PROJECTS/LIL-FFMPEG

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake cache editor..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components
.PHONY : list_install_components/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Install the project..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Install the project..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing only the local directory..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing only the local directory..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing the project stripped..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Installing the project stripped..."
	/opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/sportvot/Desktop/MY-PROJECTS/LIL-FFMPEG/CMakeFiles /Users/sportvot/Desktop/MY-PROJECTS/LIL-FFMPEG//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/sportvot/Desktop/MY-PROJECTS/LIL-FFMPEG/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named shvid

# Build rule for target.
shvid: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 shvid
.PHONY : shvid

# fast build rule for target.
shvid/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/build
.PHONY : shvid/fast

core/filters.o: core/filters.c.o
.PHONY : core/filters.o

# target to build an object file
core/filters.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/filters.c.o
.PHONY : core/filters.c.o

core/filters.i: core/filters.c.i
.PHONY : core/filters.i

# target to preprocess a source file
core/filters.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/filters.c.i
.PHONY : core/filters.c.i

core/filters.s: core/filters.c.s
.PHONY : core/filters.s

# target to generate assembly for a file
core/filters.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/filters.c.s
.PHONY : core/filters.c.s

core/info.o: core/info.c.o
.PHONY : core/info.o

# target to build an object file
core/info.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/info.c.o
.PHONY : core/info.c.o

core/info.i: core/info.c.i
.PHONY : core/info.i

# target to preprocess a source file
core/info.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/info.c.i
.PHONY : core/info.c.i

core/info.s: core/info.c.s
.PHONY : core/info.s

# target to generate assembly for a file
core/info.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/info.c.s
.PHONY : core/info.c.s

core/tools.o: core/tools.c.o
.PHONY : core/tools.o

# target to build an object file
core/tools.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/tools.c.o
.PHONY : core/tools.c.o

core/tools.i: core/tools.c.i
.PHONY : core/tools.i

# target to preprocess a source file
core/tools.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/tools.c.i
.PHONY : core/tools.c.i

core/tools.s: core/tools.c.s
.PHONY : core/tools.s

# target to generate assembly for a file
core/tools.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/core/tools.c.s
.PHONY : core/tools.c.s

helpers/cmd_helpers.o: helpers/cmd_helpers.c.o
.PHONY : helpers/cmd_helpers.o

# target to build an object file
helpers/cmd_helpers.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/cmd_helpers.c.o
.PHONY : helpers/cmd_helpers.c.o

helpers/cmd_helpers.i: helpers/cmd_helpers.c.i
.PHONY : helpers/cmd_helpers.i

# target to preprocess a source file
helpers/cmd_helpers.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/cmd_helpers.c.i
.PHONY : helpers/cmd_helpers.c.i

helpers/cmd_helpers.s: helpers/cmd_helpers.c.s
.PHONY : helpers/cmd_helpers.s

# target to generate assembly for a file
helpers/cmd_helpers.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/cmd_helpers.c.s
.PHONY : helpers/cmd_helpers.c.s

helpers/file_helpers.o: helpers/file_helpers.c.o
.PHONY : helpers/file_helpers.o

# target to build an object file
helpers/file_helpers.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/file_helpers.c.o
.PHONY : helpers/file_helpers.c.o

helpers/file_helpers.i: helpers/file_helpers.c.i
.PHONY : helpers/file_helpers.i

# target to preprocess a source file
helpers/file_helpers.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/file_helpers.c.i
.PHONY : helpers/file_helpers.c.i

helpers/file_helpers.s: helpers/file_helpers.c.s
.PHONY : helpers/file_helpers.s

# target to generate assembly for a file
helpers/file_helpers.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/helpers/file_helpers.c.s
.PHONY : helpers/file_helpers.c.s

main.o: main.c.o
.PHONY : main.o

# target to build an object file
main.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/main.c.o
.PHONY : main.c.o

main.i: main.c.i
.PHONY : main.i

# target to preprocess a source file
main.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/main.c.i
.PHONY : main.c.i

main.s: main.c.s
.PHONY : main.s

# target to generate assembly for a file
main.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/main.c.s
.PHONY : main.c.s

shell/args.o: shell/args.c.o
.PHONY : shell/args.o

# target to build an object file
shell/args.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/args.c.o
.PHONY : shell/args.c.o

shell/args.i: shell/args.c.i
.PHONY : shell/args.i

# target to preprocess a source file
shell/args.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/args.c.i
.PHONY : shell/args.c.i

shell/args.s: shell/args.c.s
.PHONY : shell/args.s

# target to generate assembly for a file
shell/args.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/args.c.s
.PHONY : shell/args.c.s

shell/shell.o: shell/shell.c.o
.PHONY : shell/shell.o

# target to build an object file
shell/shell.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/shell.c.o
.PHONY : shell/shell.c.o

shell/shell.i: shell/shell.c.i
.PHONY : shell/shell.i

# target to preprocess a source file
shell/shell.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/shell.c.i
.PHONY : shell/shell.c.i

shell/shell.s: shell/shell.c.s
.PHONY : shell/shell.s

# target to generate assembly for a file
shell/shell.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/shvid.dir/build.make CMakeFiles/shvid.dir/shell/shell.c.s
.PHONY : shell/shell.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... install"
	@echo "... install/local"
	@echo "... install/strip"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... shvid"
	@echo "... core/filters.o"
	@echo "... core/filters.i"
	@echo "... core/filters.s"
	@echo "... core/info.o"
	@echo "... core/info.i"
	@echo "... core/info.s"
	@echo "... core/tools.o"
	@echo "... core/tools.i"
	@echo "... core/tools.s"
	@echo "... helpers/cmd_helpers.o"
	@echo "... helpers/cmd_helpers.i"
	@echo "... helpers/cmd_helpers.s"
	@echo "... helpers/file_helpers.o"
	@echo "... helpers/file_helpers.i"
	@echo "... helpers/file_helpers.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
	@echo "... shell/args.o"
	@echo "... shell/args.i"
	@echo "... shell/args.s"
	@echo "... shell/shell.o"
	@echo "... shell/shell.i"
	@echo "... shell/shell.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

