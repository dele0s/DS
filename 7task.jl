using HorizonSideRobots
r = Robot(animate = true)
function move_steps!(r, Side, Numsteps)
    while Numsteps != 0
        move!(r, Side)
        Numsteps -= 1
    end
end
function task7!(r, gogo)
    i = 2
    while isborder(r, gogo)
        if i % 2 == 1
            move_steps!(r, Ost, i)
            i += 1
        else
            move_steps!(r, West, i)
            i += 1
        end
    end
    move!(r, gogo)
end