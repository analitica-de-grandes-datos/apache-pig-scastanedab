/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


u = LOAD 'data.csv' USING PigStorage (',') AS (id:INT, 
firstname: CHARARRAY, 
surname: CHARARRAY,
birthday: CHARARRAY,
color: CHARARRAY,
quantity: INT); 
month = FOREACH u GENERATE SUBSTRING(birthday,5,7) AS month;
STORE month INTO 'output' USING PigStorage(',');