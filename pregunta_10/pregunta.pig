/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = load 'data.csv' using PigStorage(',') as (id:int, name:chararray, secondname:chararray, date:chararray, favcolor:chararray, number:int);

data_length = foreach data generate secondname, SIZE(secondname) as data_length;
data_output = order data_length by data_length desc, secondname;

store data_output into 'output/' using PigStorage(',');