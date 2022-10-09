vRP.prepare("vRP/money_init_user","INSERT IGNORE INTO vrp_user_moneys(user_id,bank) VALUES(@user_id,@bank)")
vRP.prepare("vRP/get_money","SELECT bank FROM vrp_user_moneys WHERE user_id = @user_id")
vRP.prepare("vRP/set_money","UPDATE vrp_user_moneys SET bank = @bank WHERE user_id = @user_id")
vRP.prepare("vRP/get_coins","SELECT coins FROM vrp_users WHERE id = @user_id")
vRP.prepare("vRP/set_coins","UPDATE vrp_users SET coins = @coins WHERE id = @user_id")

function vRP.tryCoins(user_id,amount)
	if user_id and amount then
		local coins = vRP.getCoins(user_id)
		if parseInt(coins) >= parseInt(amount) then
			coins = parseInt(coins)-parseInt(amount)
			vRP.execute("vRP/set_coins", {user_id = user_id, coins = coins})
			return true
		end
	end
	return false
end

function vRP.addCoins(user_id,amount)
	if user_id and amount then
		local coins = vRP.getCoins(user_id)
		coins = parseInt(coins)+parseInt(amount)
		vRP.execute("vRP/set_coins", {user_id = user_id, coins = coins})
		return
	end
	return
end

function vRP.withdrawCoins(user_id,amount)
	local coins = vRP.getCoins(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then 
		data.coins = coins-amount
	end
end

function vRP.getCoins(user_id)
	if user_id then
		local coins = vRP.query("vRP/get_coins",{ user_id = user_id })
		coins = coins[1].coins
		return coins
	end
	return
end

function vRP.tryPayment(user_id,amount)
	if amount >= 0 then
		if vRP.getInventoryItemAmount(user_id,"cartao-debito") >= 1 then
			if amount >= 0 and vRP.getInventoryItemAmount(user_id,"dinheiro") >= amount then
				vRP.tryGetInventoryItem(user_id,"dinheiro",amount)
				return true
			else
				local money = vRP.getBankMoney(user_id)
				if amount >= 0 and money >= amount then
					vRP.setBankMoney(user_id,money-amount)
					return true
				else
					return false
				end
			end
		else
			if amount >= 0 and vRP.getInventoryItemAmount(user_id,"dinheiro") >= amount then
				vRP.tryGetInventoryItem(user_id,"dinheiro",amount)
				return true
			else
				return false
			end
		end
	end
	return false
end

function vRP.giveMoney(user_id,amount)
	if amount >= 0 then
		vRP.giveInventoryItem(user_id,"dinheiro",amount)
	end
end

function vRP.getMoney(user_id)
	return vRP.getInventoryItemAmount(user_id,"dinheiro")
end

function vRP.getBankMoney(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.bank or 0
	else
		return 0
	end
end



function vRP.setBankMoney(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.bank = value
	end
end

function vRP.giveBankMoney(user_id,amount)
	if amount >= 0 then
		local money = vRP.getBankMoney(user_id)
		vRP.setBankMoney(user_id,money+amount)
	end
end

function vRP.tryWithdraw(user_id,amount)
	local money = vRP.getBankMoney(user_id)
	if amount >= 0 and money >= amount then
		vRP.setBankMoney(user_id,money-amount)
		vRP.giveInventoryItem(user_id,"dinheiro",amount)
		return true
	else
		return false
	end
end

function vRP.tryDeposit(user_id,amount)
	if amount >= 0 and vRP.tryGetInventoryItem(user_id,"dinheiro",amount) then
		vRP.giveBankMoney(user_id,amount)
		return true
	else
		return false
	end
end

AddEventHandler("vRP:playerJoin",function(user_id,source,name)
	vRP.execute("vRP/money_init_user",{ user_id = user_id, bank = 92000 })
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		local rows = vRP.query("vRP/get_money",{ user_id = user_id })
		if #rows > 0 then
			tmp.bank = rows[1].bank
		end
	end
end)

RegisterCommand('savedb',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local tmp = vRP.getUserTmpTable(user_id)
		if tmp and tmp.bank then
			vRP.execute("vRP/set_money",{ user_id = user_id, bank = tmp.bank })
		end
		TriggerClientEvent("save:database",source)
		TriggerClientEvent("Notify", source, "aviso","Você salvou todo o conteúdo temporário de sua database.")
	end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp and tmp.bank then
		vRP.execute("vRP/set_money",{ user_id = user_id, bank = tmp.bank })
	end
end)

AddEventHandler("vRP:save",function()
	for k,v in pairs(vRP.user_tmp_tables) do
		if v.bank then
			vRP.execute("vRP/set_money",{ user_id = k, bank = v.bank })
		end
	end
end)

local timerscheat = {}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(timerscheat) do
            if v > 0 then
                timerscheat[k] = v - 1
            end
        end
    end
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function vRP.sendemplog(source,emp,amount)
	local user_id = vRP.getUserId(source)
	if timerscheat[user_id] == 0 or not timerscheat[user_id] then
		timerscheat[user_id] = 6
		SendWebhookMessage(webh.emplog,"```prolog\n[JOGADOR]: » "..user_id.."\n[Emprego]: "..emp.." [PAGAMENTO]:"..amount..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	else
		SendWebhookMessage(webh.emplogban,"```prolog\n[JOGADOR BANIDO]: » "..user_id.."\n[Emprego] "..emp.." [TRIGGER DE HACK]:"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		vRP.setBanned(user_id,true)
		vRP.kick(source,"BOA NOITE, CABAÇO!")
	end
end

function vRP.sendemplog1(source,emp,amount)
	local user_id = vRP.getUserId(source)
	SendWebhookMessage(webh.emplog1,"```prolog\n[JOGADOR]: » "..user_id.."\n[Emprego]: "..emp.." [PAGAMENTO]:"..amount..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
end