DROP TABLE IF EXISTS predmets cascade;


create table public.predmets
(
    id    bigint generated by default as identity
        constraint predmets_pk
            primary key,
    title varchar not null
        constraint predmets_pk2
            unique
);