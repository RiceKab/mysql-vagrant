# mysql-vagrant

mysql-vagrant is a quick way to run mysql locally for development without an ssh tunnel.

This project is a fork of https://github.com/AlexDisler/mysql-vagrant with the 
addition of a database seed. The bound host port has also been changed from default.

### Requirements

* Vagrant
* Virtual Machine provider (eg. Virtualbox)

### Seed database

The `seed.sql` file is run, if it exists, upon creating of the virtual machine.

If you want to reseed you can run `vagrant provision --provision-with seed`.

#### Create VM / Start server

     $ vagrant up
	 
#### Shutdown server

     $ vagrant halt

#### Destroy virtual machine

     $ vagrant destroy

### Connect to mysql from host machine

- host: 33.33.33.1
- port: 33060
- username: root
- password: root

### Warning

For development use only, do not use in production.
Also, make sure your bound port (33060) is not open on your computer for a local network or in general.

### License

MIT