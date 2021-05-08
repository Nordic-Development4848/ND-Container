--[[
██╗ ██████╗███████╗██╗   ██╗ ██╗ ██╗ ██╗  ██╗ █████╗ ██╗  ██╗ █████╗ 
██║██╔════╝██╔════╝╚██╗ ██╔╝████████╗██║  ██║██╔══██╗██║  ██║██╔══██╗
██║██║     █████╗   ╚████╔╝ ╚██╔═██╔╝███████║╚█████╔╝███████║╚█████╔╝
██║██║     ██╔══╝    ╚██╔╝  ████████╗╚════██║██╔══██╗╚════██║██╔══██╗
██║╚██████╗███████╗   ██║   ╚██╔═██╔╝     ██║╚█████╔╝     ██║╚█████╔╝
╚═╝ ╚═════╝╚══════╝   ╚═╝    ╚═╝ ╚═╝      ╚═╝ ╚════╝      ╚═╝ ╚════╝  
]]--

Icey = {}

Icey.objects = { -- Alle de props som man kan lede igennem. Alle dumpsters er allerede tilføjet. Men jeg har gjort det muligt at ændre i, hvis det lyster.
	object = nil,
	locations = {
		[1] = {object="prop_dumpster_01a"},
		[2] = {object="prop_cs_dumpster_01a"},
		[3] = {object="prop_dumpster_02a"},
		[4] = {object="prop_dumpster_02b"},
		[5] = {object="prop_dumpster_3a"},
		[6] = {object="prop_dumpster_4a"},		
		[7] = {object="prop_dumpster_4b"}
	}
}

Icey.min = "1" -- Minimum antal item du kan få fra en container

Icey.max = "4" -- Max antal item du kan få fra en container

-- Altså den vælger et random tal  mellem de 2 tal ovenover ^^


Icey.flaske = "200" -- Beløb man får af penge i pungen ved at sælge en plastikflaske

Icey.pose = "100" -- Beløb man får af penge i pungen ved at sælge en plastikpose

Icey.daase = "300" -- Beløb man får af penge i pungen ved at sælge en metaldåse