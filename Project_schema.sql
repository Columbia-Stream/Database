drop schema if exists Project_SQL;

create schema Project_SQL;

use Project_SQL;

create table Users
(
    UNI varchar(7) primary key ,
    email varchar(255) not null,
    role varchar(7)
        check (role in ('Student', 'Faculty')),
    password varchar(255) not null
);
create table Video_DB
(
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_uni varchar(7) not null,
    object_path varchar(255) not null,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key (professor_uni) references Users (UNI)
);
insert into Users values ('ps3408', 'ua3408@columbia.edu','Student','abc');

select * from Users;