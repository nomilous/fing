fing
====

Meta tools for Node/Javascript

Usage
-----

### Argument metadata

```coffee

require 'fing'
testFunction = (arg1, arg2) -> 
testFunction.fing.args[0].name # == 'arg1'

```


ChangeLog
---------

### 2013-02-04 v0.0.1

* Added <function>.fing.args (= [{name:'arg1name'},{name:'arg2name'},...])
