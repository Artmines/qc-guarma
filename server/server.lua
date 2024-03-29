local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('qc-guarma:server:buyticket')
AddEventHandler('qc-guarma:server:buyticket', function(price)
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
	if cashBalance >= price then
		Player.Functions.RemoveMoney("cash", price, "purchase-ticket")
		Player.Functions.AddItem('boatticket', 1)
		TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['boatticket'], "add")
		RSGCore.Functions.Notify(src, 'boat ticket bought for $'..price, 'success')
	else 
		RSGCore.Functions.Notify(src, 'you don\'t have enough cash to do that!', 'error')
	end
end)

-- remove ticket
RegisterNetEvent('qc-guarma:server:removeItem', function(item, amount)
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item], "remove")
end)