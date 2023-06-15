/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

data = load 'data.csv' using PigStorage(',') as (id:int, name:chararray, secondname:chararray, date:chararray, favcolor:chararray, number:int);

filter_secname = filter data by (SUBSTRING(secondname, 0, 1) >= 'D' and SUBSTRING(secondname, 0, 1) <= 'K');
data_output = foreach filter_secname generate secondname;

store data_output into 'output/' using PigStorage(',');