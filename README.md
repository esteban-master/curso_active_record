# APUNTES

## Relaciones en active record

Ejemplo entre modelo de **users** y **shopping_cart**, un *user* puede tener multiples *shopping_cart* y este ultimo le pertenece a 1 user, entonces la relacion es **1 a muchos**.

Para saber en que modelo va la llave foranea del ejemplo anterior, hay que responder esta pregunta: **¿Quien pertenece a quien?**, en este caso el *shopping_cart* le pertenece al *user*, entonces en el modelo de pertenencia vamos a colocar la llave foranea.

En rails Active Record, para crear llave foranea hay que hacer una referencia, ejemplo:

```bash
rails generate model shopping_cart total:integer user:references

```
Esto de forma automatica Active Record genera un campo de tipo llave foranea en *shopping_cart*


