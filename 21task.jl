function inverse(side)
    if side == Nord return Sud
    elseif side == Sud return Nord
    else return side == West ? Ost : West
    end
end
function along_rec!(robot, side1, side2 = ((side1 == Nord) || (side1 == Sud)) ? West : Nord)
    if isborder(robot, side1)
        move!(robot, side2)
        along_rec!(robot, side1)
        move!(robot, inverse(side2))
    else move!(robot, side1) end
end