create table if not exists Courses
(
    course_id   varchar(50)  not null
        primary key,
    course_code varchar(50)  not null,
    course_name varchar(200) not null,
    constraint course_code
        unique (course_code)
);

create table if not exists CourseOfferings
(
    offering_id int auto_increment
        primary key,
    course_id   varchar(50)             not null,
    semester    enum ('Spring', 'Fall') not null,
    year        int                     not null,
    constraint CourseOfferings_ibfk_1
        foreign key (course_id) references Courses (course_id)
            on delete cascade
);

create index course_id
    on CourseOfferings (course_id);

create table if not exists Users
(
    uni      varchar(50)                 not null
        primary key,
    role     enum ('student', 'faculty') not null,
    email    varchar(255)                not null,
    password varchar(255)                not null,
    constraint email
        unique (email)
);

create table if not exists CourseInstructors
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

create table if not exists Videos
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

select * from Users;

