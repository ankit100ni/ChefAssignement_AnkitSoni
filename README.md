# Assingment Soutions for Chef SA Workshops

## Reference document for Assignment overview

This github repository contains the solution for assignment Chef SA Workshop

It has three cookbooks named as :
* MongoDB
* Tomcat
* Windows

### MongoDB
This repository is intend to install the MongoDB application via Installation file and installing it.

* Approach:
    This cookbook contains single recipe file i.e. default.rb
    Attributes are written to attain the reusability of this cookbook with values generally used
    A installation file is created using the temaplate on expected location
    Few test cases are written to perform the sanity checs for the repository

### Tomcat

This repository peforms following actions:
* Creates a user with name Tomcat
* Creates a group with name Tomcat
* Downloads the installation file from the tomcat binary repository
* Archive the file and generate the install file
* 


