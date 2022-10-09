-- [EN] OPTIONAL: You may change the function below to fit your server needs.
-- [PT] OPCIONAL: Você pode mudar as funções abaixo para atender às necessidades do seu servidor.

-- [EN] Show notification
-- [PT] Exibir notificação
function ShowNotification(message)
	BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(('~r~%s~s~'):format(message))
    EndTextCommandThefeedPostTicker(false, true)
end