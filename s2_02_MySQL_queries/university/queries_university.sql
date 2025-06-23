USE universidad;

-- UNIVERSITY QUERIES:

-- 1. Returns a list with the first surname, middle surname and first name of all students. The list must be sorted alphabetically from lowest to highest by first surname, middle surname and first name.
    SELECT p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre FROM persona AS p WHERE p.tipo = 'alumno' ORDER BY 1,2,3;

    SELECT * FROM persona p WHERE p.tipo='alumno' ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

-- 2. Finds the name and both surnames of students who have not registered their telephone number in the database.
    SELECT p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre FROM persona AS p WHERE p.telefono IS NULL AND p.tipo = 'alumno';

-- 3. Returns the list of students who were born in 1999.
    SELECT * FROM persona p WHERE p.tipo='alumno' AND YEAR(p.fecha_nacimiento)=1999 ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

-- 4. Returns the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.
    SELECT * FROM persona p WHERE p.tipo='profesor' AND p.telefono IS NULL AND p.nif LIKE '%K' ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

-- 5. Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
    SELECT * FROM asignatura a WHERE a.cuatrimestre=1 AND a.curso=3 AND a.id_grado=7;

SELECT a.nombre, a.cuatrimestre, a.curso, g.id, g.nombre
FROM asignatura AS a
LEFT JOIN grado AS g ON g.id = a.id_grado
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND g.id = 7;

-- 6. Returns a list of teachers along with the name of the department to which they are linked. The list must return four columns, first surname, middle surname, name and department name. The result will be sorted alphabetically from lowest to highest by surname and first name.
    SELECT p.apellido1,p.apellido2,p.nombre, nombre_departamento FROM persona p JOIN (SELECT p.id_profesor as idProfesor, dp.nombre as nombre_departamento  FROM profesor as p JOIN departamento as dp ON p.id_departamento=dp.id) dp2  ON p.id=dp2.idProfesor AND p.tipo='profesor'  ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

-- 7. Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
    SELECT c.id, asign.nombre, c.anyo_inicio, c.anyo_fin FROM curso_escolar c JOIN alumno_se_matricula_asignatura matasign ON c.id = matasign.id_curso_escolar JOIN asignatura asign ON matasign.id_asignatura = asign.id JOIN persona p ON matasign.id_alumno = p.id WHERE p.nif = '26902806M';

SELECT a.nombre AS 'nombre de las asignaturas', ce.anyo_inicio AS 'año de inicio', ce.anyo_fin as 'año de fin'
FROM asignatura AS a
LEFT JOIN alumno_se_matricula_asignatura AS am ON am.id_asignatura = a.id
LEFT JOIN curso_escolar AS ce ON ce.id = am.id_curso_escolar
LEFT JOIN persona AS p ON p.id = am.id_alumno
WHERE p.nif = '26902806M';

-- 8.Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Plan).
    SELECT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_grado = 4 GROUP BY d.nombre;

SELECT d.nombre AS 'nombre de departamento', g.nombre, a.nombre AS 'asignatura'
FROM asignatura AS a
LEFT JOIN profesor AS pf ON pf.id_profesor = a.id_profesor
LEFT JOIN departamento AS d ON d.id = pf.id_departamento
LEFT JOIN grado AS g ON g.id = a.id_grado
LEFT JOIN persona AS p ON p.id = a.id_profesor
WHERE g.nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)';

-- 9.Returns a list with all the students who have enrolled in a subject during the 2018/2019 school year.
    SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura mat ON p.id = mat.id_alumno JOIN curso_escolar c ON c.id = mat.id_curso_escolar WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;

--  UNIVERSITY QUERIES USING LEFT JOIN i RIGHT JOIN:

-- 1. Returns a list with the names of all teachers and the departments they are associated with. The list must also show those teachers who do not have any associated department. The list must return four columns, department name, first name, second name and teacher name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.

    SELECT d.nombre AS nom_departament, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor prf ON p.id=prf.id_profesor LEFT JOIN departamento d ON prf.id_departamento=d.id ORDER BY  d.nombre;

SELECT d.nombre AS 'nombre del departamento', p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor'
FROM persona AS p
LEFT JOIN profesor AS pf ON pf.id_profesor = p.id
LEFT JOIN departamento AS d ON d.id = pf.id_departamento
ORDER BY 1,2,3;

-- 2. Returns a list with teachers who are not associated with a department.

    SELECT d.nombre as nom_departament, p.apellido1, p.apellido2, p.nombre FROM persona p left JOIN profesor prf ON p.id=prf.id_profesor left JOIN departamento d ON prf.id_departamento=d.id WHERE d.nombre IS NULL ORDER BY d.nombre;

SELECT d.nombre AS 'nombre del departamento', p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor'
FROM persona AS p
LEFT JOIN profesor AS pf ON pf.id_profesor = p.id
LEFT JOIN departamento AS d ON d.id = pf.id_departamento
WHERE d.nombre IS NULL;

-- 3. Returns a list with departments that do not have associated teachers.
    SELECT * FROM departamento d LEFT JOIN profesor p ON p.id_departamento=d.id WHERE p.id_profesor IS NULL;

-- 4. Returns a list with teachers who do not teach any subjects.
    SELECT * FROM persona p LEFT JOIN profesor prf ON p.id=prf.id_profesor LEFT JOIN asignatura a ON prf.id_departamento=a.id_profesor  WHERE a.tipo IS NULL;

SELECT a.nombre AS 'asignatura', p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor' 
FROM persona AS p
LEFT JOIN profesor AS prf ON prf.id_profesor = p.id
LEFT JOIN asignatura AS a ON a.id_profesor = prf.id_profesor
WHERE a.nombre IS NULL;

-- 5. Returns a list with subjects that do not have a teacher assigned.
    SELECT * FROM asignatura a WHERE a.id_profesor IS NULL;

SELECT a.nombre AS 'asignatura', p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor' 
FROM persona AS p
LEFT JOIN profesor AS pf ON pf.id_profesor = p.id
RIGHT JOIN asignatura AS a ON a.id_profesor = pf.id_profesor
WHERE p.nombre IS NULL;

-- 6. Returns a list with all departments that have not taught subjects in any school year.
    SELECT d.nombre, a.curso FROM departamento d LEFT JOIN profesor prf ON d.id=prf.id_departamento LEFT JOIN asignatura a ON prf.id_profesor=a.id_profesor WHERE a.curso IS NULL GROUP BY d.nombre, a.curso;

-- FINAL QUERIES:

-- 1. Returns the total number of students.
SELECT count(*) FROM persona a WHERE a.tipo='alumno';

SELECT count(p.nombre) AS 'total de alumnos'
FROM persona AS p
WHERE p.tipo = 'alumno';

-- 2. Calculates how many students were born in 1999.
    SELECT count(*) FROM persona a WHERE a.tipo='alumno' AND YEAR(a.fecha_nacimiento)=1999;

SELECT count(p.nombre) AS 'total de alumnos nacidos en 1999'
FROM persona AS p
WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = '1999';

-- 3. Calculates how many professors there are in each department. The result should only show two columns, one with the name of the department and another with the number of professors in that department. The result should only include departments that have associated professors and should be sorted from highest to lowest by the number of professors.

    SELECT d.nombre, count(p.id_profesor) as professors_assignats FROM departamento d JOIN profesor p ON p.id_departamento=d.id GROUP BY d.nombre ORDER BY professors_assignats DESC

SELECT d.nombre AS 'nombre del departamento', count(pf.id_profesor) AS 'número de profesores'
FROM departamento AS d
JOIN profesor AS pf ON pf.id_departamento = d.id
GROUP BY 1
ORDER BY 2 DESC;

-- 4. Returns a list with all the departments and the number of professors in each of them. Note that there may be departments that do not have associated professors. These departments should also appear in the list.

SELECT d.nombre AS 'nombre del departamento', count(pf.id_profesor) AS 'número de profesores'
FROM departamento AS d
LEFT JOIN profesor AS pf ON pf.id_departamento = d.id
GROUP BY 1
ORDER BY 2 DESC;

-- 5. Returns a list with the names of all the degrees in the database and the number of subjects each one has. Note that there may be degrees that do not have associated subjects. These degrees should also appear in the list. The result must be sorted from highest to lowest by the number of subjects.

SELECT g.nombre AS grado, count(a.id) AS num_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, g.nombre
ORDER BY num_asignaturas DESC;

-- 6. Returns a list with the name of all the degrees in the database and the number of subjects each has, of the degrees that have more than 40 associated subjects.

SELECT g.nombre AS grado, count(a.id) AS num_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, g.nombre
HAVING count(a.id) > 40
ORDER BY num_asignaturas DESC;

-- 7. Returns a list that shows the name of the degrees and the sum of the total number of credits for each type of subject. The result must have three columns: name of the degree, type of subject and the sum of the credits of all the subjects of that type.

SELECT g.nombre AS nombre_grado, a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS suma_creditos
FROM grado AS g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY g.nombre, a.tipo;

-- 8. Returns a list that shows how many students have enrolled in a subject in each of the school years. The result must show two columns, one column with the start year of the school year and another with the number of students enrolled.

SELECT c.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS numero_alumnos
FROM universidad.alumno_se_matricula_asignatura AS am
JOIN curso_escolar c ON am.id_curso_escolar = c.id
GROUP BY c.anyo_inicio
ORDER BY c.anyo_inicio;

-- 9. Returns a list with the number of subjects taught by each teacher. The list must take into account those teachers who do not teach any subject. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects.

SELECT p.id, p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor', count(a.id) AS 'número de asignaturas'
FROM asignatura AS a
LEFT JOIN profesor AS pf ON a.id_profesor = pf.id_profesor
RIGHT JOIN persona AS p ON p.id = pf.id_profesor
GROUP BY 1,2,3,4
ORDER BY 5 DESC;

-- 10. Returns all the data of the youngest student.
    SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

SELECT *
FROM persona
WHERE tipo = 'alumno'
  AND fecha_nacimiento = (
      SELECT MAX(fecha_nacimiento)
      FROM persona
      WHERE tipo = 'alumno'
  );

-- 11. Returns a list with the teachers who have an associated department and who do not teach any subject.

SELECT d.nombre AS 'nombre del departamento', p.apellido1 AS 'primer apellido', p.apellido2 AS 'segundo apellido', p.nombre AS 'nombre del profesor'
FROM departamento AS d
RIGHT JOIN profesor AS prf ON prf.id_departamento = d.id
LEFT JOIN persona AS p ON p.id = prf.id_profesor
LEFT JOIN asignatura AS a ON a.id_profesor = prf.id_profesor
WHERE a.id IS NULL;