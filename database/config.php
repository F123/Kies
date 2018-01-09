
<?
#configuration file used by createtab
#This file is to be included in all php files called by the system.
$c_database = 'mysql';
#$c_database='oci8';
#the type of database you are going to use.
$c_server='localhost';  #the name of the server running the database IP address or dns name
$c_db_user = 'root';
#user to access the database with
$c_db_password = '';
#password for the db user
$c_db_connect_string = 'personal';
#$c_db_connect_string='rh.health.gov.za';   #The connect string or service name of the database if required.
$c_adodb_dir='/var/www/adodb';
#the directory on the server to find the adodb files
define('ADODB_ASSOC_CASE', 0);
#sets internal field representation. DO NOT CHANGE!

include($c_adodb_dir.'/adodb.inc.php');
#bring in the adodb class library
?>
