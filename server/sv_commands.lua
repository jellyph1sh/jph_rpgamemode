RegisterCommand("savepos", function(src)
    SavePlayer(src)
end, false)

RegisterCommand("additem", function(src, args)
    AddItem(src, args[1], args[2])
end, false)