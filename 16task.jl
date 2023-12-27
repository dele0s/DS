using HorizonSideRobots
r = Robot(animate = true)
function shuttle!(stop_condition::Function, r, side)
    side1 = Ost
    side2 = West
    a = 0
    b = 1
    while stop_condition(r, side) == 1 
        if a % 2 == 0
            move_steps!(r, side1, b)
        end
        if a % 2 == 1
            move_steps!(r, side2, b)
        end
        b += 1
        a += 1
    end
    move!(r, side)
end