if [ -f /vagrant/seed.sql ]; then 
	mysql -u root -proot < /vagrant/seed.sql;
	# sudo service mysql restart
else 
	figlet "Error: Seed file doesn't exist"
fi