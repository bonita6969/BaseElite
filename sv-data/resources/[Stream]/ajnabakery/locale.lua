local locale = {}

locale['en'] = {
	invalid_command   = '[~r~ERROR~s~] missing argument. Usage: /%s emote_id',
	invalid_command_2 = '[~r~ERROR~s~] /%s %s is not a valid emote.',
	cant_use_command  = '[~r~ERROR~s~] You can\'t perform this animation right now.',
	keymapping_hint	  = 'Stop animation',
}

locale['br'] = {
	invalid_command   = '[~r~ERRO~s~] argumento faltando. Uso correto: /%s id_do_emote',
	invalid_command_2 = '[~r~ERRO~s~] /%s %s não é um emote válido.',
	cant_use_command  = '[~r~ERRO~s~] Você não pode fazer essa animação no momento.',
	keymapping_hint	  = 'Parar animação',
}

function _s(index, ...)
	if not Config or not Config.Locale then return '' end
	local lang = locale[Config.Locale]
	if not lang then
		print('^1Locale [^7' .. Config.Locale .. '^1] does not exist, setting to default language.^7')
		Config.Locale = 'en'
		return _s(index)
	end

	if not lang[index] then return '' end

	local check = false
	for k,v in ipairs({...}) do check = true break end

	if not check then return lang[index] else return (lang[index]):format(...) end
end