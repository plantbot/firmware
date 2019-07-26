
-- This block will be replaced with the WiFi credentials
-- <CREDENTIALS>

function setup_wifi()
    wifi.setmode(wifi.STATION)
    wifi.setphymode(wifi.PHYMODE_N)
    wifi.sta.config(WIFI_SSID, WIFI_PASSWORD)
    wifi.sta_connect()

    print(wifi.sta.getip())
end

-- Startup Process
setup_wifi()

