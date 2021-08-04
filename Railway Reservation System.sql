USE thriftshop;
SELECT * FROM inventory;
UPDATE inventory
SET number_in_stock=0
WHERE inventory_id IN(1,9);
USE siu_lib;
create table Noofcopies(bnid int primary key,Bid int,foreign key(Bid) references books(Bid),blid int not null);
create table Author(aid int primary key, aname varchar(20) not null,email varchar(30) ,phoneno varchar(11));
create table Publisher( Pid int primary key,pname varchar(20) not null);
create table Writes(Bid int,foreign key(Bid) references books(Bid),aid int,foreign key(aid) references Author(aid),Pid int,foreign key(Pid) references Publisher(Pid));
create table Seller(sid int primary key,slname varchar(40) not null,city varchar(40));
create table Department(deptid int primary key,dname varchar(20) not null,Iname varchar(20) not null,lid int,foreign key(lid) references Ilibrary(lid));
create table NMember(Memid int primary key, lid int, foreign key(lid) references ilibrary(Lid));
create table Student(stid int primary key,sname varchar(20) not null,email varchar(20) , memid int,foreign key(memid) references NMember(memid),deptid int,foreign key(deptid) references Department(deptid));
create table Staff(stid int primary key,stname varchar(20) not null,email varchar(20) ,deptid int,foreign key(deptid) references Department(deptid),memid int,foreign key(memid) references NMember(memid));
create table Purchase(prid int primary key,lid int,foreign key(lid) references Ilibrary(lid), sid int,foreign key(sid) references Seller(sid),Pid int,foreign key(Pid) references Publisher(Pid),Bid int,foreign key(Bid) references books(Bid), quantity int not null, date Date,totalcost int not null);
create table Issue(issueid int primary key,memid int,foreign key(memid) references NMember(memid),Bid int,foreign key(Bid) references books(Bid),lid int,foreign key(lid) references Ilibrary(lid),issuedate Date not null,returndate Date not null);
create table Sells(sid int,foreign key(sid) references Seller(sid),Bid int,foreign key(Bid) references books(Bid),Pid int,foreign key(Pid) references Publisher(Pid));
create table Employee(eid int primary key,empname varchar(20) not null,email varchar(30) ,salary int not null,lid int,foreign key(lid) references Ilibrary(lid));
create table A_specialization(specid int primary key,specname varchar(20) not null,aid int,foreign key(aid) references Author(aid));
INSERT INTO books VALUES
(1,	'Operating System',	1000,	1),
(2,	'Management System'	,2500,	2),
(3,	'Supply chain management',	500	,8),
(4,	'Bioinformatics',780	,10),
(5,	'Tele informatics',4567	,10),
(6,	'IP and Patents formation',	345,4),
(7,	'Engineering Graphics',2456,	1),
(8,	'Customer Management',3467,	5),
(9,	'Buying Pattern Analysis',	456	,8),
(10,	'Digital Finance'	,600	,8),
(11,	'Telecommunication', 	1500	,6),
(12,	'Algorithms	',	2345,	2),
(15,	'MicroEconomics ',	267,	5),
(16,	'Electronics'	,2341,	1),
(17	,'Structure foundations',	1700,	3),
(18,	'Ecohomes'	,1234,	3),
(19	,'Mobile Communication',	456	,6),
(20	,'Labor Laws'	,3452	,9),
(21,	'Copyrights',	2789	,9),
(22	,'Research Laws',	1100	,9),
(23,'DBMS'	,700	,1),
(24	,'Computer networks',	3451	,1);
SELECT * FROM books;
DELETE FROM books;
TRUNCATE TABLE books;
INSERT INTO books VALUES
(1,	'Operating System',	1000,	1),
(2,	'Management System'	,2500,	2),
(3,	'Supply chain management',	500	,8),
(4,	'Bioinformatics',780	,10),
(5,	'Tele informatics',4567	,10),
(6,	'IP and Patents formation',	345,4),
(7,	'Engineering Graphics',2456,	1),
(8,	'Customer Management',3467,	5),
(9,	'Buying Pattern Analysis',	456	,8),
(10,	'Digital Finance'	,600	,8),
(11,	'Telecommunication', 	1500	,6),
(12,	'Algorithms	',	2345,	2),
(13,'Child Law',1800,4),
(14,'Multimanagers',2345,2),
(15,	'MicroEconomics ',	267,	5),
(16,	'Electronics'	,2341,	1),
(17	,'Structure foundations',	1700,	3),
(18,	'Ecohomes'	,1234,	3),
(19	,'Mobile Communication',	456	,6),
(20	,'Labor Laws'	,3452	,9),
(21,	'Copyrights',	2789	,9),
(22	,'Research Laws',	1100	,9),
(23,'DBMS'	,700	,1),
(24	,'Computer networks',	3451	,1);
SELECT * FROM books;
USE siu_lib;
INSERT INTO author VALUES
(1,	'Shruti','abc@gmail.com',6447896542),
(2,	'Shivam Kapoor',	'adf@gmail.com',	2345778998),
(3	,'Ameya',	'ert@gmail.com'	,23456789087),
(4	,'Pooja Pai',	'edr@gamil.com',	32554565678),
(5	,'Brian Kernighan'	,'rtyu@gmail.com',	2143454657),
(6	, 'Ken Thompson',	'errt@gmail.com',	2343454565);
SELECT * FROM author;
INSERT INTO writes VALUES
(1,1,2),
(2,2,3),
(3,5,2),
(4,6,4),
(5,1,5),
(6,1,2),
(7,4,1),
(8,2,2),
(9,5,5),
(10,6,4),
(11,1,1),
(12,4,2),
(13,5,5),
(14,6,2),
(15,3,1),
(16,4,2),
(17,6,5),
(18,2,4),
(19,5,1),
(20,1,2),
(21,3,5),
(22,5,2),
(23,6,1),
(24,3,3);
SELECT * FROM writes;
create database railway_management;
use railway_management;
create table zip(zipcode varchar(10) primary key,city varchar(20));
create table gst(gstno varchar(20) primary key,businessname varchar(50));
create table admin(adminid int auto_increment primary key,adminname varchar(50),admin_dob varchar(20),houseno varchar(10),streetname varchar(20),zipcode varchar(10),foreign key(zipcode) references zip(zipcode));
create table admin_mobile(adminid int,foreign key(adminid) references admin(adminid),mobile varchar(20));
create table train(trainno varchar(20) primary key,trainname varchar(50) unique,traintype varchar(30) not null,distance int,adminid int,foreign key(adminid) references admin(adminid));

create table station(stationid int auto_increment primary key,stationname varchar(20) not null);
create table trainroutes(routeid int primary key,stopno int,arrivaltime varchar(10),departuretime varchar(10),dayno int not null,trainno varchar(20),foreign key(trainno) references train(trainno),stationid int,foreign key(stationid) references station(stationid));
create table trainschedule(scheduleid int primary key,daysrunning varchar(10),duration varchar(20),starttime varchar(10),endtime varchar(10),trainno varchar(20),foreign key(trainno) references train(trainno));
create table class(classid int primary key,ac varchar(10),sleeper varchar(10),trainno varchar(20),foreign key(trainno) references train(trainno));
create table user(userid int primary key,dob varchar(15) not null,password varchar(20) not null,fname varchar(20),lname varchar(20),gender varchar(10),loyaltyprogram varchar(20),emailid varchar(50),zipcode varchar(10),foreign key(zipcode) references zip(zipcode),houseno varchar(10),streetname varchar(30),adminid int,foreign key(adminid) references admin(adminid));
create table agent(agentid int primary key,gstno varchar(20),foreign key(gstno) references gst(gstno),userid int,foreign key(userid) references user(userid));
create table customer(customerid int primary key,userid int,foreign key(userid) references user(userid));
create table employee(employeeid int primary key,userid int,foreign key(userid) references user(userid),designation varchar(30) not null);
create table user_mobile(userid int,foreign key(userid) references user(userid),mobile varchar(20));
create table reserves(pnr varchar(20) primary key,dateofissue varchar(15) not null,seatno varchar(5),bookingstatus varchar(20),reservationtype varchar(20),class varchar(20),e_wheelchair varchar(10),e_catering varchar(10),traindate varchar(15) not null,paymenttype varchar(20),paymentid varchar(10),amount varchar(10),trainno varchar(20),foreign key(trainno) references train(trainno),userid int,foreign key(userid) references user(userid));
create table trainstatus(statusid int auto_increment primary key,available_sleeper int not null,available_ac int not null,waiting_sleeper int not null,waiting_ac int not null,source varchar(20) not null,destination varchar(20) not null,trainno varchar(20),foreign key(trainno) references train(trainno));
insert into zip values('110001','NewDelhi');
insert into zip values('600001','Chennai');
insert into zip values('700001','Kolkata');
insert into zip values('320008','Ahmedabad');
insert into zip values('411002','Pune');
insert into zip values('238727','Mysore');
insert into zip values('102255','Darjeeling');
insert into zip values('222601','Gangtok');
insert into zip values('442414','DehraDun');
insert into zip values('281953','Patna');
insert into zip values('548519','Indore');
insert into zip values('339142','Gandhinagar');
insert into zip values('547656','Gurugram');
insert into zip values('495954','Kota');
insert into zip values('136536','Panaji');

insert into gst values('09AHLPG56980','Ram tours');		
insert into gst values('09AHPERG4981','SC travels');
insert into gst values('08APYTH84522','RailCentre');
insert into gst values('07WERFF45689','RailWheels');
insert into gst values('08ASDGH34527','Chander Rails');

insert into admin values('1','Ram Singh','12-Mar-1970','12-A','Saket Road','110001');
insert into admin values('2','Surya Kumar','25-Nov-1986','62-C','Nehru place','600001');				
insert into admin values('3','Naresh Yadav','6-Jun-1975','23','JM road','700001');
insert into admin values('4','Aman Gupta','21-Apr-1990','59','FC road','411002');
insert into admin values('5','Shyam Dev','30-Oct-1983','123/34','Lajpat nagar','320008');
	
insert into admin_mobile values('1','9875641235');					
insert into admin_mobile values('1','8564245974');				
insert into admin_mobile values('2','7456125936');
insert into admin_mobile values('3','9756321568');
insert into admin_mobile values('4','8563241256');
insert into admin_mobile values('4','9854632156');
insert into admin_mobile values('5','7051145623');
	

insert into train values('12423','Dibrugarh Town Rajdhani Express','Passenger','2434','1');
insert into train values('12267','Mumbai Central- Ahmedabad AC Duronto EXP','Duronto','789.7','1');			
insert into train values('12426','Jammu Tawi- New Delhi Rajdhani Express','Rajdhani','577','2');			
insert into train values('22201','Kolkata Seldah- Puri Duronto Express','Duronto','540.9','2');			
insert into train values('22204','Secunderabad- Visakhapatnam AC Duronto Exp','Duronto','698.1','2');			
insert into train values('22206','Madurai- Chennai Central AC Duronto Exp','Duronto','556.2','3');			
insert into train values('12430','New Delhi- Lucknow AC SF Express','Superfast','492','3');			
insert into train values('12437','Secunderbad- Hazrat Nizamuddin Rajdhani Exp','Rajdhani','1660.7','4');			
insert into train values('12019','Howrah- Ranchi Shatabdi Express','Shatabdi','426','5');			
insert into train values('11077','Pune Jammu Tawi Jhelum Express','Mail Express','2176','5');			


insert into class values('1','Yes','No','12423');	  
insert into class values('2','Yes','No','12267');	  
insert into class values('3','Yes','Yes','12426');	  
insert into class values('4','Yes','Yes','22201');	  
insert into class values('5','Yes','Yes','22204');	  
insert into class values('6','Yes','No','22206');	  
insert into class values('7','Yes','Yes','12430');	  
insert into class values('8','Yes','Yes','12437');	  
insert into class values('9','Yes','Yes','12019');	  
insert into class values('10','Yes','Yes','11077');	  

insert into trainschedule values('1','M','37hours40mins','20:35','10:15+2n','12423');
insert into trainschedule values('2','M,T,W,F,S','6hours35mins','11:25','5:55+1n','12267');
insert into trainschedule values('3','M,T,Th,S,S','9hours15mins','19:45','5:00+1n','12426');
insert into trainschedule values('4','M,W,F','8hours35mins','20:00','4:35+1n','22201');
insert into trainschedule values('5','M,W,S','9hours35mins','20:15','6:30+1n','22204');
insert into trainschedule values('6','T,Th','8hours35mins','22:45','7:20+1n','22206');
insert into trainschedule values('7','M,T,F,S','8hours5mins','23:25','7:30+1n','12430');
insert into trainschedule values('8','W','21hours35mins','12:45','10:40+1n','12437');
insert into trainschedule values('9','W,Th,F,S','7hours5mins','6:05','13:15','12019');
insert into trainschedule values('10','M,T,S','51hours10mins','17:20','10:15+2n','11077');
			
				
insert into trainstatus values('1','0','864','0','0','Dibrugarh','New Delhi','12423');
insert into trainstatus values('2','238','578','12','52','Ahmedabad','Mumbai','12267');
insert into trainstatus values('3','310','420','0','0','Jammu','New Delhi','12426');
insert into trainstatus values('4','197','209','0','125','Kolkata','Puri','22201');
insert into trainstatus values('5','0','913','0','25','Secunderabad','Visakhapatnam','22204');
insert into trainstatus values('6','428','542','5','0','Madurai','Chennai','22206');
insert into trainstatus values('7','432','711','1','0','New Delhi','Lucknow','12430');
insert into trainstatus values('8','521','670','0','0','Secunderabd','New Delhi','12437');
insert into trainstatus values('9','389','564','0','3','Howrah','Ranchi','12019');
insert into trainstatus values('10','782','983','5','6','Pune','Jammu','11077');

insert into station values('1','Dibrugarh Town');
insert into station values('2','NEW TINSUKIA JN ');
insert into station values('3','Dimapur');
insert into station values('4','Guwahati');
insert into station values('5','Barauni');
insert into station values('6','NewDelhi');
insert into station values('7','Rajkot');
insert into station values('8','Surendranagar');
insert into station values('9','Ahmedabad');
insert into station values('10','Mumbai Central');
insert into station values('11','Jammu Tawi');
insert into station values('12','Kathua');
insert into station values('13','Pathankot Cantt');
insert into station values('14','Ludhiana');
insert into station values('16','Kolkata Seldah');
insert into station values('17','Kharagpur');
insert into station values('18','Puri');
insert into station values('19','Secunderadbad');
insert into station values('20','Vijaywada');
insert into station values('21','Visakhapatnam');
insert into station values('22','Madurai');
insert into station values('23','Salem JN');
insert into station values('24','Chennai Central');
insert into station values('26','Ghaziabad');
insert into station values('27','Moradabad');
insert into station values('28','Bareilly');
insert into station values('29','Shahjehanpur');
insert into station values('30','Lucknow');
insert into station values('32','Kazipet JN');
insert into station values('33','Balharshah');
insert into station values('34','Nagpur');
insert into station values('35','Bhopal JN');
insert into station values('36','Jhansi JN');
insert into station values('37','Delhi');
insert into station values('38','Howrah JN');
insert into station values('39','Durgapur');
insert into station values('40','Raniganj');
insert into station values('41','Asansol JN');
insert into station values('42','Dhanbad JN');
insert into station values('43','Chandrapura');
insert into station values('44','Bokaro Steel City');
insert into station values('45','Muri');
insert into station values('46','Ranchi');
insert into station values('47','Pune JN');
insert into station values('48','Ahmednagar');
insert into station values('49','Jalgaon JN');
insert into station values('50','Gwalior JN');
insert into station values('51','Agra Cantt');
insert into station values('52','Mathura JN');
insert into station values('53','Faridabad');
insert into station values('54','Sonipat');
insert into station values('55','Panipat JN');
insert into station values('56','Karnal');
insert into station values('57','Kurukshetra JN');
insert into station values('58','Ambala cantt JN');
insert into station values('59','Ambala City');
insert into station values('60','Jalandhar Cantt');
insert into station values('61','Vijaypur Jammu');


insert into trainroutes values('1','1','Start','20:35','1','12423','1');
insert into trainroutes values('2','2','21:40','2:13','2','12423','2');
insert into trainroutes values('3','3','6:38','6:58','2','12423','3');
insert into trainroutes values('4','4','19:05','19:15','2','12423','4');
insert into trainroutes values('5','5','4:57','5:02','3','12423','5');
insert into trainroutes values('6','6','10:15','End','3','12423','6');
insert into trainroutes values('7','1','Start','19:05','1','12267','9');
insert into trainroutes values('8','2','20:37','20:47','1','12267','7');
insert into trainroutes values('9','3','23:15','23:35','1','12267','8');
insert into trainroutes values('10','4','6:00','End','1','12267','10');
insert into trainroutes values('11','1','Start','19:45','1','12426','11');
insert into trainroutes values('12','2','20:45','20:47','1','12426','12');
insert into trainroutes values('13','3','21:22','21:27','1','12426','13');
insert into trainroutes values('14','4','0:05','0:15','2','12426','14');
insert into trainroutes values('15','5','5:00','End','2','12426','6');
insert into trainroutes values('16','1','Start','20:00','1','22201','16');
insert into trainroutes values('17','2','22:15','22:20','1','22201','17');
insert into trainroutes values('18','3','4:35','End','2','22201','18');
insert into trainroutes values('19','1','Start','20:15','1','22204','19');
insert into trainroutes values('20','2','1:05','1:15','2','22204','20');
insert into trainroutes values('21','3','6:30','End','2','22204','21');
insert into trainroutes values('22','1','Start','22:45','1','22206','22');
insert into trainroutes values('23','2','2:25','2:30','2','22206','23');
insert into trainroutes values('24','3','7:20','End','2','22206','24');
insert into trainroutes values('25','1','Start','23:25','1','12430','6');
insert into trainroutes values('26','2','0:05','0:07','2','12430','26');
insert into trainroutes values('27','3','2:13','2:15','2','12430','27');
insert into trainroutes values('28','4','3:37','3:39','2','12430','28');
insert into trainroutes values('29','5','4:43','4:45','2','12430','29');
insert into trainroutes values('30','6','7:30','End','2','12430','30');
insert into trainroutes values('31','1','Start','12:45','1','12437','19');
insert into trainroutes values('32','2','14:28','14:30','1','12437','32');
insert into trainroutes values('33','3','17:45','17:50','1','12437','33');
insert into trainroutes values('34','4','20:40','20:45','1','12437','34');
insert into trainroutes values('35','5','2:00','2:10','2','12437','35');
insert into trainroutes values('36','6','5:45','5:50','2','12437','36');
insert into trainroutes values('37','7','10:40','End','2','12437','37');
insert into trainroutes values('38','1','Start','6:05','1','12019','38');
insert into trainroutes values('39','2','7:48','7:50','1','12019','39');
insert into trainroutes values('40','3','8:06','8:07','1','12019','40');
insert into trainroutes values('41','4','8:22','8:24','1','12019','41');
insert into trainroutes values('42','5','9:21','9:26','1','12019','42');
insert into trainroutes values('43','6','10:26','10:28','1','12019','43');
insert into trainroutes values('44','7','10:55','11:00','1','12019','44');
insert into trainroutes values('45','8','12:00','12:02','1','12019','45');
insert into trainroutes values('46','9','13:15','End','1','12019','46');
insert into trainroutes values('47','1','Start','17:20','1','11077','47');
insert into trainroutes values('48','2','20:22','20:25','1','11077','48');
insert into trainroutes values('49','3','1:55','2:00','2','11077','49');
insert into trainroutes values('50','4','16:24','16:26','2','11077','50');
insert into trainroutes values('51','5','17:55','17:59','2','11077','51');
insert into trainroutes values('52','6','20:26','20:28','2','11077','52');
insert into trainroutes values('53','7','21:00','21:15','2','11077','53');
insert into trainroutes values('54','8','21:49','21:50','2','11077','6');
insert into trainroutes values('55','9','22:32','22:34','2','11077','54');
insert into trainroutes values('56','10','23:20','23:25','2','11077','55');
insert into trainroutes values('57','11','23:32','23:34','2','11077','56');
insert into trainroutes values('58','12','1:35','1:45','3','11077','57');
insert into trainroutes values('59','13','1:56','1:58','3','11077','58');
insert into trainroutes values('60','14','2:13','2:15','3','11077','59');
insert into trainroutes values('61','15','4:20','4:22','3','11077','14');
insert into trainroutes values('62','16','5:25','5:27','3','11077','60');
insert into trainroutes values('63','17','8:13','8:15','3','11077','12');
insert into trainroutes values('64','18','9:32','9:34','3','11077','61');
insert into trainroutes values('65','19','10:15','End','3','11077','11');

insert into user values('1','12-Mar-1970','ani@1234','Anirudh','Batra','Male','No','anirudh12@yahoo.com','238727','97B','Ankita Nagar','1');
insert into user values('2','25-Nov-1986','javedbest789','Javed','Malik','Male','Yes','javedmick@gmail.com','110001','103','Yamini Chowk','2');
insert into user values('3','6-Jun-1975','randhawa09','Mohan','Randhawa','Male','No','mohanswa@gmail.com','222601','99','Neela Villas','2');
insert into user values('4','21-Apr-1990','up34678','Upasana','Singh','Female','No','upasaad@gmail.com','102255','66','Fakaruddin Heights','3');
insert into user values('5','30-Oct-1983','nancoon12','Nancy','Khurana','Female','Yes','nancoon@gmail.com','700001','156/C','Tulsi Nagar ','4');
insert into user values('6','5-Feb-1995','sfafsf23g','Isha','Sodhi','Female','No','ishasd4@yahoo.com','136536','25','Aundh','3');
insert into user values('7','12-Sep-1989','rg5st8ey','Samir','Ram','Male','No','samiara@gmail.com','442414','58/K','Sameedha Society','4');
insert into user values('8','15-Mar-1975','stgerh85h','Sameedha','Char','Female','Yes','samehar@gmail.com','281953','456','Borivali','1');
insert into user values('9','19-Aug-1993','hyfju12f','Owais','Dash','Male','No','owais23@rediff.com','548519','75','VimalaGunj','4');
insert into user values('10','16-Apr-1978','set4styy','Manoj','Nayar','Male','Yes','manoj213@outlook.com','600001','334','Yeru road','5');
insert into user values('11','9-Dec-1988','yryssr85','Jatin','Chander','Male','No','jatider@gmail.com','339142','40','Harmada','2');
insert into user values('12','17-Aug-1965','ramesh@567','Ramesh','Pratap','Male','Yes','rameshpt@gmail.com','102255','55D','Chinchwad','5');
insert into user values('13','1-Jan-1992','ysrhsr98s','Nupur','Patil','Female','Yes','nupurp@outlook.com','547656','41','Anandpur','5');
insert into user values('14','25-Aug-1978','aehhej7j6','Nitin','Dev','Male','Yes','nitinlla@gmail.com','495954','33','Kanika Heights','1');
insert into user values('15','6-May-1989','jdkel65ds','Vishnu','Chand','Male','Yes','vishnuc098@gmail.com','411002','486','Yerwada','5');

insert into customer values('1','1');
insert into customer values('2','2');
insert into customer values('3','3');
insert into customer values('4','4');
insert into customer values('5','5');
insert into customer values('6','6');

insert into agent values('1','09AHLPG56980','7');
insert into agent values('2','09AHPERG4981','8');
insert into agent values('3','08APYTH84522','9');
insert into agent values('4','07WERFF45689','10');
insert into agent values('5','08ASDGH34527','11');
 
insert into employee values('1','12','Senior Systems Engineer');
insert into employee values('2','13','Nodal officer');
insert into employee values('3','14','TC');
insert into employee values('4','15','OperationalManager');

insert into user_mobile values('1','9875134565');
insert into user_mobile values('2','7894153246');
insert into user_mobile values('3','8945214569');
insert into user_mobile values('4','9845763210');
insert into user_mobile values('5','9402365187');
insert into user_mobile values('6','8945203617');
insert into user_mobile values('7','7520361245');
insert into user_mobile values('8','8895478210');
insert into user_mobile values('9','8445436974');
insert into user_mobile values('10','9675665012');
insert into user_mobile values('11','7842365109');
insert into user_mobile values('12','9927054896');
insert into user_mobile values('13','8997745612');
insert into user_mobile values('14','9654785211');
insert into user_mobile values('15','8556321459');
insert into user_mobile values('5','9852364456');
insert into user_mobile values('6','7855699512');
insert into user_mobile values('8','8897455638');
insert into user_mobile values('9','9545333469');
insert into user_mobile values('1','7789874520');
insert into user_mobile values('12','9837125640');

insert into reserves values('AGH10001','12-Sep-2018','12A','Confirmed','Regular','AC','Yes','Yes','13-Oct-2018','CreditCard','1256974521','1200','22204','2');
insert into reserves values('JSA10002','15-Mar-2020','25B','Waiting','Regular','SL','No','No','19-Aug-2020','UPI','5632145896','750','12426','3');
insert into reserves values('LPH10003','9-Dec-2018','34A','Confirmed','Regular','AC','No','No','9-Jan-2019','CreditCard','7854123695','1500','11077','10');
insert into reserves values('HDS10004','19-Aug-2020','76B','Confirmed','Tatkal','AC','No','Yes','20-Aug-2020','UPI','3215462102','1200','22201','12');
insert into reserves values('TMK10005','9-June-2020','52A','Waiting','Regular','SL','No','No','29-July-2020','CreditCard','1023540256','750','12019','8');
insert into reserves values('UGC10006','15-Oct-2019','65A','Confirmed','Tatkal','AC','No','No','16-Oct-2019','DebitCard','1602354896','1500','11077','7');
insert into reserves values('WER10007','18-Aug-2020','89B','Waiting','Regular','AC','No','Yes','26-Sep-2020','DebitCard','2013542065','1200','22201','7');
insert into reserves values('PLK10008','15-Apr-2020','56A','Confirmed','Regular','AC','Yes','Yes','1-Sep-2020','UPI','8035912067','1200','12267','1');





