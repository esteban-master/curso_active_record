# APUNTES

## Relaciones en active record

Ejemplo entre modelo de **users** y **shopping_cart**, un *user* puede tener multiples *shopping_cart* y este ultimo le pertenece a 1 user, entonces la relacion es **1 a muchos**.

Para saber en que modelo va la llave foranea del ejemplo anterior, hay que responder esta pregunta: **¿Quien pertenece a quien?**, en este caso el *shopping_cart* le pertenece al *user*, entonces en el modelo de pertenencia vamos a colocar la llave foranea.

En rails Active Record, para crear llave foranea hay que hacer una referencia, ejemplo:

```bash
rails generate model shopping_cart total:integer user:references

```
Esto de forma automatica Active Record genera un campo de tipo llave foranea en *shopping_cart*


## Migraciones

Agregar una nueva columna a un modelo (tabla) existente, nos debemos apoyar de una nueva migracion, por ejemplo queremos agregar la columna **active** de tipo boolean al modelo **shopping_cart** ,ejecutamos el siguiente comando usando una convencion de rails:

```bash
  rails g migration add_active_to_shopping_carts active:boolean
```
La convencion se lee de la siguiente manera: *Agregame una nueva columna llamada active en la tabla shopping_carts*. Luego el atributo a agregar. Este comando va generar una migracion en la carpeta *db/migrate*, que permita agregar una nueva columna a un tabla ya existente.

Luego realizar migracion:

```bash 
 rails db:migrate
```

La migracion se va a aplicar a la tabla **shopping_carts** en la base de datos.

