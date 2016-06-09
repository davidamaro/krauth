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
