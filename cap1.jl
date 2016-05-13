# David Amaro-Alcalá

# La siguiente instrucción sirve para *precompilar* el módulo
__precompile__(true)

module Krauth

export direct_pi, markov_pi

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

function markov_pi(N,delta)
    Nhits = 0
    x = 1
    y = 1
    for i in 1:N
        deltax = rand(linspace(-delta,delta))
        deltay = rand(linspace(-delta,delta))
        if abs(x + deltax) < 1 && abs(y + deltay) < 1
            x += deltax
            y += deltay
        end
        if (sumabs2([x,y]) < 1)
            Nhits += 1
        end
    end
    Nhits
end
end
