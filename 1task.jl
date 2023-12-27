using HorizonSideRobots
r = Robot(animate=true)
function inverse!(side::HorizonSide)::HorizonSide
    if side == Nord
        return Sud
    elseif side == Sud
        return Nord
    elseif side == Ost
        return West
    else
        return Ost
    end
end
function num_steps_move_marker!(robot::Robot, direct::HorizonSide) 
    num_steps = 0
    while !isborder(robot, direct)
            move!(robot, direct)
            putmarker!(robot)
            num_steps += 1
    end
    return num_steps
end
Direction = [Ost, Sud, West, Nord]
function X!(robot::Robot, direct::HorizonSide)
    x = num_steps_move_marker!(robot, direct)
    along!(robot, inverse!(direct), x)
end
putmarker!(r)
for y in Direction
    X!(r, y)
end