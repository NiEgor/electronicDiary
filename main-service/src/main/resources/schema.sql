drop table if exists users cascade;
drop table if exists students cascade;
drop table if exists predmets cascade;
drop table if exists student_classes cascade;
drop table if exists homeworks cascade;
drop table if exists lessons cascade;
drop table if exists mark_lesson_student cascade;
drop table if exists student_user cascade;

create table users
(
    id       integer generated by default as identity,
    name     varchar not null,
    password varchar not null,
    email    varchar not null,
    phone    varchar not null,
    role     varchar not null,
    constraint users_pk
        primary key (id)
);

create table public.students
(
    id               integer generated by default as identity
        constraint students_pk
            primary key,
    name             varchar not null,
    user_id          integer not null
        constraint students_users_id_fk
            references public.users,
    student_class_id integer not null
        constraint students_students_id_fk
            references public.students
);

create table predmets
(
    id    integer generated by default as identity,
    title varchar not null,
    constraint predmets_pk
        primary key (id)
);

create table public.student_classes
(
    id    integer generated by default as identity
        constraint student_classes_pk
            primary key,
    title varchar not null
);

create table homeworks
(
    id          integer generated by default as identity,
    description varchar not null,
    constraint homeworks_pk
        primary key (id)
);

create table lessons
(
    id               integer generated by default as identity,
    lesson_time      timestamp not null,
    user_id          integer   not null,
    student_class_id integer   not null,
    predmet_id       integer   not null,
    homework_id      integer   not null,
    constraint lessons_pk
        primary key (id),
    constraint lessons_homeworks_id_fk
        foreign key (homework_id) references homeworks,
    constraint lessons_predmets_id_fk
        foreign key (predmet_id) references predmets,
    constraint lessons_student_classes_id_fk
        foreign key (student_class_id) references student_classes,
    constraint lessons_users_id_fk
        foreign key (user_id) references users
);

create table mark_lesson_student
(
    value      integer not null,
    lesson_id  integer not null,
    student_id integer not null,
    constraint mark_lesson_lesson_pk
        primary key (lesson_id, student_id),
    constraint mark_lesson_student_lessons_id_fk
        foreign key (lesson_id) references lessons,
    constraint mark_lesson_student_students_id_fk
        foreign key (student_id) references students
);

create table student_user
(
    user_id    integer not null,
    student_id integer not null,
    constraint student_user_students_id_fk
        foreign key (student_id) references students,
    constraint student_user_users__id_fk
        foreign key (user_id) references users
);




