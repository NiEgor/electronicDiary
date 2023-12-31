DROP TABLE IF EXISTS student_lesson cascade;


create table public.student_lesson
(
    id_mark    bigint generated by default as identity
        constraint student_lesson_pk
            primary key,
    value      integer default 0,
    lesson_id  bigint not null
        constraint student_lesson_lessons_id_fk
            references public.lessons,
    student_id bigint not null
        constraint student_lesson_students_id_fk
            references public.students
);