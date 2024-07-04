local RSGCore = exports['rsg-core']:GetCoreObject()
local data = {}

--------------------------------------
-- SELL PET EVENT
--------------------------------------

RegisterServerEvent('tbrp_companions:sellpet')
AddEventHandler('tbrp_companions:sellpet', function()
	local _src = source
	local Player = RSGCore.Functions.GetPlayer(_src)
	local u_identifier = Player.PlayerData.citizenid
	local u_charid = Player.PlayerData.id
	MySQL.Async.fetchAll("SELECT * FROM companions WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = u_identifier, ['charidentifier'] = u_charid}, function(result)
		if #result > 0 then 
			MySQL.Sync.execute("DELETE FROM companions WHERE identifier = @identifier AND charidentifier = @charidentifier", {["identifier"] = u_identifier, ['charidentifier'] = u_charid})
			TriggerClientEvent('tbrp_companions:selldog', _src)
			TriggerClientEvent('RSGCore:Notify', _src, Lang:t('success.petsold'), 'success')
		else
			TriggerClientEvent('RSGCore:Notify', _src, Lang:t('error.nopet'), 'error')
		end
	end)	
end)

--------------------------------------
-- FEED PET EVENT WITH XP PROGRESSION
--------------------------------------

RegisterServerEvent('tbrp_companions:feedPet')
AddEventHandler('tbrp_companions:feedPet', function(xp)
    local _src = source
	local Player = RSGCore.Functions.GetPlayer(_src)
	local u_identifier = Player.PlayerData.citizenid
	local u_charid = Player.PlayerData.id
	local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid }
	local currentXP = xp
	local newXp = currentXP + Config.XpPerFeed
	local amount = Player.Functions.GetItemByName(Config.AnimalFood)
	if not amount then
		TriggerClientEvent('RSGCore:Notify', _src, Lang:t('error.nofood'), 'error')
	else
		if newXp <= Config.FullGrownXp then
			Player.Functions.RemoveItem(Config.AnimalFood, 1)
			local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid,  ['addedXp'] = Config.XpPerFeed }
			MySQL.Sync.execute("UPDATE companions SET xp = xp + @addedXp  WHERE identifier = @identifier AND charidentifier = @charidentifier", Parameters, function(result) end)

			local result = MySQL.query.await('SELECT * FROM companions WHERE identifier = @identifier AND charidentifier = @charidentifier', {['identifier'] = u_identifier, ['charidentifier'] = u_charid})

			for i = 1, #result do
				local xpprogress = json.decode(result[i].xp)
				print('loading '..xpprogress)
						TriggerClientEvent('RSGCore:Notify', _src, Lang:t('info.petprogress', {cpf = Config.XpPerFeed, xpp = xpprogress, cfg = Config.FullGrownXp}), 'info', 6000)
			end
			TriggerClientEvent('tbrp_companions:UpdateDogFed', _src, newXp)
		else
		Player.Functions.RemoveItem(Config.AnimalFood, 1)		
		TriggerClientEvent('tbrp_companions:UpdateDogFed', _src, newXp)
		TriggerEvent('tbrp_companions:getPetinfo')
		end
	end
end)

--------------------------------------
-- BUY PET EVENT
--------------------------------------

RegisterServerEvent('tbrp_companions:buydog')
AddEventHandler('tbrp_companions:buydog', function (args)
    local _src = source
	local Player = RSGCore.Functions.GetPlayer(_src)
	local u_identifier = Player.PlayerData.citizenid
	local u_charid = Player.PlayerData.id
	local _price = args['Price']
	local _model = args['Model']
	local skin = math.floor(math.random(0, 2))
	local canTrack = CanTrack(_src)
	u_money = Player.PlayerData.money.cash
	if u_money <= _price then
		TriggerClientEvent('RSGCore:Notify', _src, Lang:t('error.nomoney'), 'error')
		return
	end
	MySQL.Async.fetchAll("SELECT * FROM companions WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = u_identifier, ['charidentifier'] = u_charid}, function(result)
		if #result > 0 then 
		TriggerClientEvent('tbrp_companions:selldog', _src)
		TriggerClientEvent('RSGCore:Notify', _src, Lang:t('success.swappet'), 'success')
		TriggerClientEvent('tbrp_companions:spawndog', _src, _model, skin, true, 0,canTrack)
		Player.Functions.RemoveMoney('cash', _price)
		local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid,  ['dog'] = _model, ['skin'] = skin , ['xp'] = 0 }
		MySQL.Sync.execute("UPDATE companions SET dog = @dog, skin = @skin, xp = @xp WHERE identifier = @identifier AND charidentifier = @charidentifier", Parameters, function(r1)
		end)
		else
			TriggerClientEvent('RSGCore:Notify', _src, Lang:t('success.buypet'), 'success')
			TriggerClientEvent('tbrp_companions:spawndog', _src, _model, skin, true, 0,canTrack)
			Player.Functions.RemoveMoney('cash', _price)
			local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid,  ['dog'] = _model, ['skin'] = skin, ['xp'] = 0 }
		   MySQL.Sync.execute("INSERT INTO companions ( `identifier`,`charidentifier`,`dog`,`skin`, `xp` ) VALUES ( @identifier, @charidentifier, @dog, @skin, @xp )", Parameters, function(r2)
			end)
		end
	end)
end)

--------------------------------------
-- LOAD PET EVENT
--------------------------------------

RegisterServerEvent('tbrp_companions:loaddog')
AddEventHandler('tbrp_companions:loaddog', function()
    local _src = source
		local Player = RSGCore.Functions.GetPlayer(_src)
		local u_identifier = Player.PlayerData.citizenid
		local u_charid = Player.PlayerData.id
		local canTrack = CanTrack(_src)
		local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid }
		MySQL.Async.fetchAll( "SELECT * FROM companions WHERE identifier = @identifier  AND charidentifier = @charidentifier", Parameters, function(result)
			if result[1] then
				local dog = result[1].dog
				local skin = result[1].skin
				local xp = result[1].xp or 0
				TriggerClientEvent("tbrp_companions:spawndog", _src, dog, skin, false, xp, canTrack)
			else
				TriggerClientEvent('RSGCore:Notify', _src, Lang:t('error.nopet'), 'error')
			end
		end)	
end)

--------------------------------------
-- TRACK EVENT
--------------------------------------

function CanTrack(source)
	local cb = false
	if Config.TrackCommand then
		if Config.AnimalTrackingJobOnly then
			local job = getJob(source)
			for k, v in pairs(Config.AnimalTrackingJobs) do
				if job == v then
				cb = true
				end
			end
		else 
			cb = true
		end
	end
	return(cb)
end

function getJob(source)
 local cb = false
	local Character = RSGCore.Functions.GetPlayerData(source).job
	cb = Player.PlayerData.job
 return cb
end
