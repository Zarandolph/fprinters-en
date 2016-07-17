AddCSLuaFile()
fprinters = fprinters or {} 
fprinters.config = {} 

-- fprinters Configuration

--Language Settings
fprinters.config.printerextinguished 		= "Your printer is extinguished!"
fprinters.config.overheating 				= "Your printer is overheating!"
fprinters.config.exploded 				    = "Your printer got exploded!"
fprinters.config.youcantuse					= "You can't use printers!"
fprinters.config.yourprinterisbugged		= "Your printer has gone out of world! It is removed!"

-- General Settings
fprinters.config.entityenable				= true
fprinters.config.moneytype                  = "$"

-- Printer Repair Pack Settings
fprinters.config.repairpackname 			= "Printer Repair Pack"
fprinters.config.repairpackmodel			= "models/Items/car_battery01.mdl"
fprinters.config.healthincrease				= 25
fprinters.config.repaircost 				= 300 -- Cost in F4 menu

-- Printer Extinguisher Settings
fprinters.config.extinguishername 			= "Printer Extinguisher"
fprinters.config.extinguishermodel		    = "models/props/cs_office/fire_extinguisher.mdl"
fprinters.config.extinguishercost 			= 200 -- Cost in F4 menu

-- Topaz Printer Settings
fprinters.config.topazname					= "Topaz Printer"
fprinters.config.topazcolor					= Color( 242, 207, 107, 255 )
fprinters.config.topazprintamount			= 1000
fprinters.config.topazprinttime				= 60

-- Amethyst Printer Settings
fprinters.config.amethystname				= "Amethyst Printer"
fprinters.config.amethystcolor				= Color( 153, 102, 204, 255 )
fprinters.config.amethystprintamount		= 1500
fprinters.config.amethystprinttime			= 60

-- Emerald Printer Settings
fprinters.config.emeraldname				= "Emerald Printer"
fprinters.config.emeraldcolor				= Color( 0, 112, 60, 255 )
fprinters.config.emeraldprintamount			= 2000
fprinters.config.emeraldprinttime			= 60

-- Ruby Printer Settings
fprinters.config.rubyname					= "Ruby Printer"
fprinters.config.rubycolor					= Color( 224, 17, 95, 255 )
fprinters.config.rubyprintamount			= 2500
fprinters.config.rubyprinttime				= 60

-- Sapphire Printer Settings
fprinters.config.sapphirename				= "Sapphire Printer"
fprinters.config.sapphirecolor				= Color( 15, 82, 186, 255 )
fprinters.config.sapphireprintamount		= 3000
fprinters.config.sapphireprinttime			= 60

-- VIP Printer Settings
fprinters.config.vipname					= "VIP Printer"
fprinters.config.vipcolor					= Color( 171, 0, 121 ) 
fprinters.config.vipglowcolor 				= Color(63,127,127,255)
fprinters.config.vipprintamount				= 4000
fprinters.config.vipprinttime				= 60