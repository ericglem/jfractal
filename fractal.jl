using Images

function fractal(z₀ :: Complex, MAX_ITER :: Int)
    z = z₀
    n = 0
    while abs(z) < 2 && n < MAX_ITER
        z = z*z + complex(0.4, 0.6)
        n += 1
    end
    return n == MAX_ITER ? n : n=1-log(log2(abs(z)))
end

WIDTH = 400
HEIGHT = 400
MAX_ITER = 1000

r_start, r_end = -1, 1
i_start, i_end = -1, 1

img = rand(RGB, WIDTH, HEIGHT)

for x ∈ 1:WIDTH
    for y ∈ 1:HEIGHT
        z₀ = complex(r_start + (x/WIDTH) * (r_end - r_start), 
                     i_start + (y/HEIGHT) * (i_end - i_start))
        n = fractal(z₀, MAX_ITER)
        color = (255 * n)/MAX_ITER
        img[x,y] = RGB(color, color, color)
    end
end


display(img)
