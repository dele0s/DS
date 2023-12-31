using HorizonSideRobots
r = Robot(animate = true)
function backside(side)
    if side == Nord 
        return Sud
    elseif side == Sud 
        return Nord
    elseif side == West
        return Ost
    else
        return West 
    end
end
function can_move!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        if !ismarker(robot) return true
        else
            move!(robot, backside(side))
            return false
        end
    end
    return false
end
function go_labirint!(robot, last = 0)
    if last == 0 putmarker!(robot) end
    for i in (Nord, Ost, Sud, West)
        if backside(i) != last && can_move!(robot, i)
            putmarker!(robot)
            go_labirint!(robot, i)
            move!(robot, backside(i))
        end
    end
end