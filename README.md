# repair-xampp-mysql

Automatic repair a faulty mysql xampp database. This PS script automates the following steps:
 * rename `C:\xampp\mysql\data` to a new folder with the current date appended
 * copy the `C:\xamp\mysql\backup` folder to `data`
 * copy the user defined innoDB folder from the old data folder to the new one
 * copy existing `ibdata1` and ib_logfile[0|1] from the old data folder to the new one
 
No garantues but the old data folder is still available. It should fix most of the problems
