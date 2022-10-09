hypnonema_url 'https://thiago-dev.github.io/fivem-hypnonema'

-- If you want to see a custom splash screen / poster
hypnonema_poster_url 'https://i.imgur.com/dPaIjEW.jpg'

-- The command someone needs to enter for opening the menu
-- Hint: no spaces, no special characters!
hypnonema_command_name 'hypnonema'

-- Only change if you know what you are doing!
hypnonema_db_connString "Filename=hypnonema.db;Flush=true"

-- Whether logging is enabled or not
hypnonema_logging_enabled 'false'

-- The max render distance for all screens
hypnonema_max_render_distance '400'

--------------------------------------------
--------------------------------------------
fx_version 'bodacious'
game 'gta5'

ui_page 'client/html/index.html'
client_script 'client/Hypnonema.Client.net.dll'
server_script 'server/Hypnonema.Server.net.dll'

files {
    'client/Newtonsoft.Json.dll',
    'client/Hypnonema.Shared.dll',
    'client/html/index.html',
    'client/html/static/js/main.js',
    'client/html/static/css/main.css',
}

author 'simpled-dev'
version '1.9.2'
description 'a Media Player Resource for FiveM'
repository 'https://github.com/thiago-dev/fivem-hypnonema'
