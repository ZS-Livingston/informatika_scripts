####################################
Informatika iCloud Classroom Scripts
####################################

This repository contains a series of scripts that allow for handing out assignments and checking homework in the structure of an improvised classroom using iCloud.

Forethought
===========

When students write code, it is impossible to use Google Classroom to correct their coding. As they also exclusively use iPads, I designed a directory structure on my work iCloud so that I share one dedicated directory with each student.

``surname_name\``

This directory is then shared with a student using icloud with teacher's managed AppleID.

The teacher sends assignment files into this directory and students use the files and create their own files in python.

Function
========

The teacher needs to copy homework assignements to the student directories and print the log of students' progress. 

print_homework.sh
-----------------

Serves to print a log file with each student text file (presumably in python) present in their directories so that the teacher can evaluate their daily or weekly progress.

copy_homework.sh
----------------

Serves to distribute files the students are to work with in their shared directories.

Final word
==========

This is a very crude improvised solution that I am developing on a whim. The scripts are not definitive and are not expected to work without tweaking them. 
