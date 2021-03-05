# Plantillas de Django

¡Es hora de mostrar algunos datos! Para ello Django incorpora unas etiquetas de plantillas, **template tags**, muy útiles.

## ¿Qué son las etiquetas de plantilla?

Verás, en HTML no se puede escribir código en Python porque los navegadores no lo entienden. Sólo saben HTML. Sabemos que HTML es bastante estático, mientras que Python es mucho más dinámico.

Las **etiquetas de plantilla de Django** nos permiten insertar elementos de Python dentro del HTML, para que puedas construir sitios web dinámicos más rápida y fácilmente. ¡Genial!

## Mostrar la plantilla lista de posts

En el capítulo anterior le dimos a nuestra plantilla una lista de entradas en la variable `posts`. Ahora la vamos a mostrar en HTML.

Para imprimir una variable en una plantilla de Django, utilizamos llaves dobles con el nombre de la variable dentro, algo así:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Prueba esto en la plantilla `blog/templates/blog/post_list.html`. Ábrela en el editor de código, y cambia todo desde el segundo `<div>` hasta el tercer `</div>` por `{{ posts }}`. Guarda el archivo y refresca la página para ver los resultados:
