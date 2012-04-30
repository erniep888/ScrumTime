// MongoDB on Windows {source: http://www.mongodb.org/display/DOCS/Quickstart+Windows}


By default MongoDB will store data in \data\db, but it won't automatically create that folder, so we do so here:

C:\> mkdir \data
C:\> mkdir \data\db
Or you can do this from the Windows Explorer, of course.

If you prefer to place datafiles elsewhere, use the --dbpath command line parameter when starting mongod.exe.

Run and connect to the server

The important binaries for a first run are:

mongod.exe - the database server. Try mongod --help to see startup options.
mongo.exe - the administrative shell
To run the database, click mongod.exe in Explorer, or run it from a CMD window.

C:\> cd \my_mongo_dir\bin
C:\my_mongo_dir\bin> mongod
This will start the mongod.exe server running, and you will see log messages displayed in this window as the server runs. 
	Note: It is also possible to run the server as a Windows Service. But we can do that later.

Now, start the administrative shell, either by double-clicking mongo.exe in Explorer, or from a new CMD prompt. By default 
	mongo.exe connects to a mongod server running on localhost and uses the database named test. 
	Run mongo --help to see other options.

C:\> cd \my_mongo_dir\bin
C:\my_mongo_dir\bin> mongo
> // the mongo shell is a javascript shell connected to the db
> // by default it connects to database 'test' at localhost
> 3+3
6
> db
test
> // the first write will create the db:
> db.foo.insert( { a : 1 } )
> db.foo.find()
{ _id : ..., a : 1 }
> show dbs
...
> show collections
...
> help    