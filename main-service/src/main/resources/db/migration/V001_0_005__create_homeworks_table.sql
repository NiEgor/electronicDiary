DROP TABLE IF EXISTS homeworks cascade;


create table public.homeworks
(
    id          integer generated by default as identity
        constraint homeworks_pk
            primary key,
    description varchar default 'Ничего не задано':: character varying not null
);