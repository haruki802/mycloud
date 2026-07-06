-- This script wont work during a song, it will wait until the song ends, keybind detection reasons
-- ModCharts supported
-- SV poorly supported
-- 60+ FPS supported
-- Avoids Death & Poison notes (WARNING: if Death/Poison note skins are different than default, then it wont work. Also, if your Regular notes have default Death/Poison's skin, autoplayer wont work at all!)
-- Read "Features" to know more

-- 

local lib = FFAutoplayLib or loadstring(game:HttpGet("https://raw.githubusercontent.com/Null-Cherry/Null-Fire/refs/heads/main/Core/Loaders/Funky-Friday/Autoplay.lua", true))()
lib.AutoPlay = true
lib.MoreStats = true -- show autoplayer stats
lib.PerfectSick = 1 -- Sick hits are WAAAAY closer to 0ms. Put here a 0 if you wanna disable that
lib.Performance = 0 -- CHANGE THIS NUMBER IN RANGE FROM 0 TO 5
-- 5 WILL RESULT IN ALMOST NO LAGS WHEN AUTOPLAYING
