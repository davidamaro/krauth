## Capítulo 1 ##

En términos generales los métodos de Monte Carlo
es un tratamiento experimental para calcular
integrales utilizando *posiciones aleatorias*
llamadas *muestreos*, cuya **distribución**
es cuidadosamente **elegida**. pp1 Krauth.

Queremos conocer **cómo** obtener estos muestreos y
cómo **procesarlos** para calcular la integral. Además
de obtener buenos resultados usando tan pocos
datos como podamos.

Dos maneras de obtener muestreos: **muestreo directo**
y **muestreo con cadenas de Markov**.

### Muestro directo ###

**Ejemplo**. Se dibuja un círculo y un cuadrado
que lo contenga exactamente. Se lanzan piedras
aleatoriamente; cada lanzamiento es una *prueba*
y si cae dentro del círculo es un *acierto*.

El radio ${\rm aciertos}/{\rm pruebas} = A_{\rm c}/A_{\rm cu}$.

Programa __direct_pi__:

```julia
function direct_pi(N)
    Nhits = 0
    for i in 1:N
        x = rand(linspace(-1,1,400))
        y = rand(linspace(-1,1,400))
        if (sumabs2([x,y]) < 1)
            Nhits += 1
        end
    end
    Nhits
end
```

Uso:


```julia
4 * direct_pi(1000)/1000
```

### Muestro por cadenas de Markov ###

Se inicia en la casa-club. Los adultos juegan
en un **área mayor** que en la
que juegan los niños, por lo que ahora las reglas del 
juego cambian. Se lanza una piedra. Se toma una nueva y se vuelve a 
lanzar (aleatoriamente). Si la piedra se sale del área se 
pone una nueva sobre la que estaba anteriormente y se lanza una nueva.

Según el programa sólo una persona lanza. Tiene que intentar $N$ 
lanzamientos.


```julia
function markov_pi(N)
    x = 1
    y = 1
    Nh = 0
    for i in 1:N
        dx = rand(linspace(-1,1,400))
        dy = rand(linspace(-1,1,400))
        if abs(x+dx) < 1. && abs(y+dy) < 1.
            x += dx
            y += dy
        end
        if x^2 + y^2 <= 1
            Nh += 1
        end
    end
    Nh
end
```

Observación, `dx` y `dy` no se deben hacer muy pequeñas
ya que de otra manera la *aceptación* es alta y si es
muy alta, es más fácil que se salgan. Se debe hacer
de forma que **la mitad se acepte** y la otra
se rechace.

**Definición**. Una cadena de Markov: La probabilidad
de generar la configuración $i+1$ sólo depende en la 
configuración anterior, $i$, y no en las anteriores.

El problema con el muestreo usando la cadena de Markov
es que depende de condiciones iniciales y la correlación:
el tiempo en que la configuración se acuerda de dónde vino
(la casa-club).

Nos quedamos en la aguja de Buffon.
