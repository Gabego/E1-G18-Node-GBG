CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" integer,
  "country" char(3),
  "rol_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "titlle" varchar,
  "description" text,
  "category_id" uuid,
  "level" varchar,
  "teacher_id" uuid
);

CREATE TABLE "course_video" (
  "id" serial PRIMARY KEY,
  "title" varchar,
  "course_id" uuid,
  "duration" time,
  "url" url
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "users_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");


//CREACION DE REGISTROS EN TABLAS

insert
	into
	users (
	id,
	name,
	email,
	"password",
	age,
	country,
	rol_id 
)
values (
'fecc2773-690c-405d-91b7-ed34af96fa71',
'Martin Garzon', 
'martin@garzon.com',
'123456',
32,
'PER',
'0fdca52b-01d6-4c72-a154-72ae1140e559'
);


insert
	into
	roles  (
	id,
	name
)
values (
'69bb6ffa-2e75-4659-b955-4f15c229b8e5',
'admin'
);


insert
	into
	categories  (
	id,
	name
)
values (
'66d67ac9-dd03-476c-9181-3c8a767e982d',
'Emprendimiento'
);

insert
	into
	teachers  (
	id,
	name
)
values (
'b88aae55-9a52-43cf-b996-8b0622a394ee',
'Pedro Prez'
);

insert
	into
	courses  (
	id,
	titlle,
	Description,
	category_id,
	level,
	teacher_id 
)
values (
'bc833431-4415-48bf-b6e9-01b1b8be7a90',
'Finanzas para dummies',
'Principios basicos que te permitiran alcanzar exito financiero',
'cc2338cc-cd08-48dd-b483-11ca0bd7645d',
'Intermedio',
'b88aae55-9a52-43cf-b996-8b0622a394ee'
);

insert
	into
	course_video  (
	id,
	title,
	course_id,
	Duration,
	url
)
values (
'3',
'Creditos',
'bc833431-4415-48bf-b6e9-01b1b8be7a90',
'00:12:00',
'https://aulavirtual/finanzaspersonales/video03.mp4'
);

insert
	into
	users_courses  (
	id,
	user_id,
	course_id 
)
values (
'a2e087da-bc11-44e0-b1cf-6f1047b9a01e',
'ac1b422e-67c8-4bf1-9295-f789026b0b2e',
'fd1d4ad7-4f1f-4f79-ab2f-584d904b1397'
);
