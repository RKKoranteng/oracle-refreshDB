What's refreshDB
----------------
refreshDB started as a work project whereby I wanted to consolidate
various database refresh processes into a single script.

Firstly, it's an operation nightmare when managing multiple databases
that different steps to be taken during its refresh effort.
Secondly, different DBA team members will not follow the same steps
and thereby causing inconsistencie and issues once refresh is complete.

refreshDB solves these challenges by consolidating the different refresh
steps for various databases in your environment into one manageable
utility and easy to use utility. Hope you enjoy it!


Directory structure
-------------------
- components    location of components/scripts for specfic database
- documents     location of documentation
- images        location of images
- inventory     location of inventory and config files
- modules       location of functions


Adding a new database refresh process
-------------------------------------
Adding  a new refresh process is simple.

 Step 1: add your specifc refresh script to $components$ directory
 Step 2: add your component entry in $inventory/comp-list.sh

 Note: You should only have one entry in $inventory>/comp-list.sh per database


Removing a database refresh process
-----------------------------------
Removing an existing refresh process is also very simple.

 Step 1: delete your specific component entry from $inventory/comp-list.sh
 Step 2: delete your specific refresh script from $components$ directory


How to use utility
------------------
Using the refreshDB utility is very straight forward.

 ./refreshDB.sh $dbname $dumpfile

  Where:
   - $dbname =  your database name
   - $dumpfile = name (including full path) of dumpfile

What to do if refreshDB doesn't work?
---------------------------------------
refreshDB git repository is github.com/RKKoranteng/oracle-refreshDB

Here you will find my list of known bugs and pending features requests.
If your problem is not listed in the "Issues" tab, feel free to create
a new issue so that I can track all the pesty bugs.
