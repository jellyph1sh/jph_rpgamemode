RegisterCommand("savepos", function(src)
    SavePlayer(src)
end, false)

RegisterCommand("additem", function(src, args)
    AddItem(src, args[1], tonumber(args[2]))
end, false)

RegisterCommand("removeitem", function(src, args)
    RemoveItem(src, args[1], tonumber(args[2]))
end, false)