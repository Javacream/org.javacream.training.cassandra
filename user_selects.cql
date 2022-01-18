//select * from user; //OK, aber die Abfrage muss auf allen Knoten ausgeführt werden
//select description from user; //OK, aber die Abfrage muss auf allen Knoten ausgeführt werden
//select * from user where lastname='Sawitzki'; //OK
//select lastname from user where description='a trainer'; //GEHT NICHT
//select lastname from user where description='a trainer' ALLOW FILTERING;// OK, aber Abfrage muss auf allen Partitionen ausgeführt werden!
//select * from user where firstname='Rainer' //GEHT NICHT
//select * from user where firstname='Rainer' ALLOW FILTERING

