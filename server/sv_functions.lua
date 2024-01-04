function GetIdentifier()
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    return identifier and identifier:gsub('license:', '')
end

function CreateUser()
    local identifier = GetIdentifier()
    MySQL.insert('INSERT INTO users (identifier, label) VALUES (?, ?)', { name, label })
end