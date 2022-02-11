# APUNTES

## Relaciones en active record

### has_many (1 a muchos)
Ejemplo entre modelo de **users** y **shopping_cart**, un *user* puede tener multiples *shopping_cart* y este ultimo le pertenece a 1 user, entonces la relacion es **1 a muchos**. (has_many)

Para saber en que modelo va la llave foranea del ejemplo anterior, hay que responder esta pregunta: **¿Quien pertenece a quien?**, en este caso el *shopping_cart* le pertenece al *user*, entonces en el modelo de pertenencia vamos a colocar la llave foranea.

En rails Active Record, para crear llave foranea hay que hacer una referencia, ejemplo:

```bash
rails generate model shopping_cart total:integer user:references

```
Esto de forma automatica Active Record genera un campo de tipo llave foranea en *shopping_cart*

### has_many (muchos a muchos)

Un **shopping_cart** puede almacenar muchos **products**, y su vez un **product** puede encontrarse en multiples **shopping_cart**

Para realizar esta relacion, nos tenemos que apoyar de una tercera tabla, una tabla intermedia, y en esta nueva tabla vamos a definir 2 llaves foraneas, y apartir de ellas, sera posible relacionar la tabla **products** junto con la tabla **shopping_carts**.

Entonces creamos nuestro tercer modelo encargado de establecer la relacion, llamado **shopping_cart_product**, haciendo una union entre estos modelos:

```bash
  rails g model shopping_cart_product shopping_cart:references product:references
```

Esto genera un archivo de migracion para ese modelo, ahora hay que migrarlo a la base de datos con el comando `rails db:migrate`

Luego agregamos la relacion `has_many :shopping_cart_products` en los modelos `product.rb` y `shopping_cart` y listo.

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

## Queries

Usar el metodo `includes` al realizar una consulta entre uniones, para realizar solo una consulta y no consultas de **n + 1** que provocaria una bajada de performance en la app al realizar muchas consultas. Un ejemplo seria obtener todos los `products` de un `shopping_cart` que le pertenece a un `user`

Ejemplo de consulta **mala** en active record, donde se imprimen todos los productos del carrito de un usuario:

```ruby
  User.find(1).shopping_cart.shopping_cart_products.each do |sho|
    puts sho.product.title
  end
```
El codigo anterior va a realizar **n + 1** consultas a la base de datos, ya que obtenemos los productos agregados al carrito (tabla de union muchos a muchos), luego recorremos para obtener el producto en si.

Ejemplo de consulta **buena** del mismo ejercicio, usando el metodo `includes` que relaciona los modelos:

```ruby
  User.find(1).shopping_cart.shopping_cart_products.includes(:product).each do | sho |
    puts sho.product.title
  end
```

Esta consulta es mucho mejor, ya que incluye la peticion de todos los productos, solo realizan 2 consultas a la base de datos:
1. Obtenemos todos los objetos de la tabla `shopping_cart_product` (tabla de muchos a muchos)
2. Luego otra consulta donde obtenemos los productos a partir de un listado de IDs obtenidos de la tabla `shopping_cart_products` -> IN (1, 2, 3, ...etc)