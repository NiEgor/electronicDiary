DROP TABLE IF EXISTS student_classes cascade;


create table public.student_classes
(
    id    integer generated by default as identity
        constraint student_classes_pk
            primary key,
    title varchar not null
);