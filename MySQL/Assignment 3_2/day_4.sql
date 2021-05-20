DROP DATABASE IF EXISTS TestingSystem_demo_join;
CREATE DATABASE TestingSystem_demo_join;
USE TestingSystem_demo_join;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID MEDIUMINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL
);

insert into department (DepartmentName) values ('Engineering');
insert into department (DepartmentName) values ('Product Management');
insert into department (DepartmentName) values ('Business Development');
insert into department (DepartmentName) values ('Legal');
insert into department (DepartmentName) values ('Support');
insert into department (DepartmentName) values ('Accounting');
insert into department (DepartmentName) values ('Services');
insert into department (DepartmentName) values ('Sale');
insert into department (DepartmentName) values ('Training');
insert into department (DepartmentName) values ('Human Resources');
insert into department (DepartmentName) values ('Research and Development');
insert into department (DepartmentName) values ('Marketing');

insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('lgoodge0@msn.com', 'lgoodge0', 'Lyman Goodge', 11, '2017-04-09');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('dgeertz1@bluehost.com', 'dgeertz1', 'Dal Geertz', 3, '2020-09-13');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('qharwick2@kickstarter.com', 'qharwick2', 'Quentin Harwick', 9, '2018-01-23');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('noriordan3@jugem.jp', 'noriordan3', 'Nomi O''Riordan', 7, '2018-11-30');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('ledmondson4@jalbum.net', 'ledmondson4', 'Livia Edmondson', 3, '2019-06-16');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('cgerauld5@lycos.com', 'cgerauld5', 'Cordell Gerauld', 6, '2019-12-26');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('thowgego6@sourceforge.net', 'thowgego6', 'Taffy Howgego', 5, '2017-08-27');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('vkiernan7@uol.com.br', 'vkiernan7', 'Verna Kiernan', 9, '2017-08-08');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('tgegg8@cyberchimps.com', 'tgegg8', 'Tiffanie Gegg', 9, '2017-09-23');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('tplace9@cbc.ca', 'tplace9', 'Tiffani Place', 10, '2018-10-08');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('iadamidesa@blogs.com', 'iadamidesa', 'Isac Adamides', 7, '2021-01-02');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('lghirardib@imgur.com', 'lghirardib', 'Lanie Ghirardi', 3, '2018-08-13');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('eallwoodc@example.com', 'eallwoodc', 'Erena Allwood', 11, '2017-09-21');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('mrizzid@vimeo.com', 'mrizzid', 'Monte Rizzi', 3, '2017-08-12');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('mlynese@photobucket.com', 'mlynese', 'Mayne Lynes', 8, '2020-03-15');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('achanningf@apache.org', 'achanningf', 'Ansley Channing', 1, '2020-11-08');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('hgoscombg@umn.edu', 'hgoscombg', 'Horacio Goscomb', 10, '2018-09-10');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('jwarykh@cam.ac.uk', 'jwarykh', 'Jorge Waryk', 1, '2020-04-30');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('nmariansi@studiopress.com', 'nmariansi', 'Northrup Marians', 3, '2019-08-28');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('aapedailej@printfriendly.com', 'aapedailej', 'Alwyn Apedaile', 2, '2017-10-25');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('bmastersk@census.gov', 'bmastersk', 'Bridie Masters', 5, '2020-02-11');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('cboulgerl@theguardian.com', 'cboulgerl', 'Cristen Boulger', 3, '2020-03-19');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('reamm@state.gov', 'reamm', 'Ripley Eam', 6, '2020-10-17');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('epietranekn@nps.gov', 'epietranekn', 'Elinore Pietranek', 8, '2018-03-21');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('skrammero@abc.net.au', 'skrammero', 'Stanfield Krammer', 1, '2017-12-22');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('jboswoodp@auda.org.au', 'jboswoodp', 'Jillie Boswood', 10, '2018-01-18');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('cheadleyq@usnews.com', 'cheadleyq', 'Cynthea Headley', 5, '2020-09-23');
insert into account (Email, Username, FullName, DepartmentID, CreateDate) values
('erozecr@plala.or.jp', 'erozecr', 'Eden Rozec', 6, '2017-05-04');

DELETE FROM Department WHERE DepartmentId = 11;