# Aborto terapeuticos en el Perú

La fuente de los datos proviene de Susalud, a través de su portal de [datos abiertos](http://datos.susalud.gob.pe/group/cobertura-prestacional?query=tedef).

Ellos explican lo siguiente:

El aborto terapéutico es un diagnóstico y en el Modelo de Transacción Electrónica de Datos Estandarizados de Facturación – TEDEF los diagnósticos se registran usando el estándar CIE10. 

En el Modelo TEDEF se registra la información de los diagnósticos vinculados a las prestaciones en salud que son financiadas por las IAFAS privadas a las IPRESS privadas según el alcance de la Resolución de Superintendencia N.° 020-2016-SUSALUD/S. 

SUSALUD publica en el portal de datos abiertos http://datos.susalud.gob.pe/group/coberturaprestacional?query=tedef la información anonimizada del Modelo TEDEF corresponde a los periodos comprendidos entre enero del 2018 y marzo del 2023. El Diccionario de datos se encuentra disponible en el mismo portal indicado.

Así también es preciso señalar que la demás información solicitada vinculada al diagnóstico corresponde a datos de la historia clínica la cual no se registra en el Modelo TEDEF o en otro sistema de información que gestione SUSALUD.

Según la data decargada, hay una columna llamada `VPRIDIAGCIE_ATE` que contiene el código del dianósitico, basado en el catálogo CIE10. 

Según un documento, Volumen 01-2018, del REUNIS del [Ministerio de Salud del 2018](https://www.minsa.gob.pe/reunis/), el aborto terapéutico se encuentra en el capítulo `O` de la CIE10, que corresponde a `Embarazo, parto y puerperio`.

En el detalle del mismo documento, el código O04 es "Aborto médico" indican que incluye "aborto terapetico terminación del embarazo, legal y terapéutico"
