DROP TABLE IF EXISTS CourseInstructors;
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS CourseOfferings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Courses;

create table Courses
(
    course_id   varchar(50)  not null
        primary key,
    course_name varchar(200) not null

);

create table CourseOfferings
(
    offering_id int auto_increment
        primary key,
    course_id   varchar(50)             not null,
    semester    enum ('Spring', 'Fall') not null,
    year        int                     not null,
    section     int                     not null,
    constraint CourseOfferings_ibfk_1
        foreign key (course_id) references Courses (course_id)
            on delete cascade
);

create index course_id
    on CourseOfferings (course_id);

create table Users
(
    uni      varchar(50)                 not null
        primary key,
    role     enum ('student', 'faculty') not null,
    email    varchar(255)                not null,
    password varchar(255)                not null,
    constraint email
        unique (email)
);

create table  CourseInstructors
(
    offering_id int         not null,
    prof_uni    varchar(50) not null,
    primary key (offering_id, prof_uni),
    constraint CourseInstructors_ibfk_1
        foreign key (offering_id) references CourseOfferings (offering_id)
            on delete cascade,
    constraint CourseInstructors_ibfk_2
        foreign key (prof_uni) references Users (uni)
            on delete cascade
);

create index prof_uni
    on CourseInstructors (prof_uni);

create table Videos
(
    video_id    int auto_increment
        primary key,
    offering_id int                                 not null,
    prof_uni    varchar(50)                         null,
    title       varchar(200)                        not null,
    gcs_path    text                                not null,
    uploaded_at timestamp default CURRENT_TIMESTAMP null,
    constraint Videos_ibfk_1
        foreign key (offering_id) references CourseOfferings (offering_id)
            on delete cascade,
    constraint Videos_ibfk_2
        foreign key (prof_uni) references Users (uni)
            on delete set null
);

create index offering_id
    on Videos (offering_id);

create index prof_uni
    on Videos (prof_uni);

insert into Courses values('COMSW4153','Cloud Computing');
insert into Courses values('COMSW4111','Introduction to Databases');

insert into CourseOfferings(course_id, semester, year,section) values('COMSW4153','Fall',2025,1);
insert into CourseOfferings(course_id, semester, year,section) values('COMSW4153','Fall',2025,2);
insert into CourseOfferings(course_id, semester, year,section) values('COMSW4111','Fall',2025,1);

insert into Users values('abc9','faculty','abc9@columbia.edu','qwerty123');
insert into Users values('def9','faculty','def9@columbia.edu','qwerty124');
insert into Users values('abc4','student','abc4@columbia.edu','qwerty12');
insert into Users values('fgh5','student','fgh5@columbia.edu','qwerty1');


insert into CourseInstructors values(1,'abc9');
insert into CourseInstructors values(2,'def9');
insert into CourseInstructors values(3,'def9');

select * from Courses;

