appdynamics-python Cookbook
===========================
This cookbook install the AppDynamics Python Agent

Requirements
------------
Python and PIP installed

Attributes
------------
Currently these are the defined defaults:

``` 
default['appdynamics']['controller']['host'] = "172.16.10.81"
default['appdynamics']['controller']['port'] = "8090"
default['appdynamics']['application'] = "App123"
default['appdynamics']['tier'] = "Tier123"
default['appdynamics']['node'] = "Node123"
default['appdynamics']['configfile'] = "/etc/appdynamics.cfg"
```

Usage
----------

This Chef Cookbook support AppDynamics agent installation for the main python and python virtual environment. Also support installation with remote file, local file and PIP repository file (I know that this last option is not available during the BETA, but when become available the chef script will work fine). All is configurable by attributes in JSON file.

#### OPTION 1: Install with Remote file URL

Download the Python Agent from AppDynamics and put the file in a local Web Server. Set the attributes AppDremoteURL with the URL and also the AppDremoteFileName with the original file name.

Sample of JSON file:
```
{
  "AppDremoteURL" : "http://10.0.0.1/appdynamics-4.0.0.0-py2-none-any.whl",
  "AppDremoteFileName" : "appdynamics-4.0.0.0-py2-none-any.whl",
  "appdynamics": {
    "application": "App789",
    "tier": "Tier789",
    "node": "Node789",
    "configfile": "/etc/appdynamics-App789.cfg",
    "controller": {
      "host": "10.0.0.1"
    }
  },
"run_list": [ "recipe[appdynamics-python::install]" ]
}
```

### OPTION 2: Install with Local file

Download the Python Agent from AppDynamics and copy it to the node. Set the full file path in the attribute AppDlocal.

Sample of JSON file:

```
{
"virtualenv" : "/python/virt/abc" ,
"AppDlocal" : "/tmp/appdynamics-4.0.0.0-py2-none-any.whl",
"run_list": [ "recipe[appdynamics-python::install]" ]
}
```

### OPTION 3: Install the Agent direct from PIP repository

WARNING: This is not available during the BETA.

This will download and install the Python Agent directly from PIP repository.

Sample of JSON file:
```
{
"virtualenv" : "/python/virt/abc" ,
"run_list": [ "recipe[appdynamics-python::install]" ]
}
```

License and Authors
-------------------
Authors: AppDynamics, Inc.

