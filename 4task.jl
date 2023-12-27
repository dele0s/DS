using HorizonSideRobots
r = Robot(animate = true)
function dmove!(r, side1, side2)
    move!(r, side1)
    move!(r, side2)
end 
function diagonalback!(r, Side1, Side2, Side3, Side4)
    while !isborder(r, Side1) && !isborder(r, Side2)
        dmove!(r, Side1, Side2)
        putmarker!(r)
    end
    while ismarker(r) == 1
        dmove!(r, Side3, Side4)
    end
end
function task4!(r)
	Side1 = Nord
	Side2 = East
	Side3 = Sud 
	Side4 = West
    diagonalback!(r, Side1, Side2, Side3, Side4)
    diagonalback!(r, Side2, Side3, Side4, Side1)
    diagonalback!(r, Side3, Side4, Side1, Side2)
    diagonalback!(r, Side4, Side1, Side2, Side3)
    putmarker!(r)   
end