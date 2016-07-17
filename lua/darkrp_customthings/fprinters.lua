AddCSLuaFile()

if (fprinters.config.entityenable) then

	DarkRP.createEntity(fprinters.config.amethystname, {
			ent = "f_amethyst_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 1500,
			max = 2,
			cmd = "buyamethystprinter",
	})

	DarkRP.createEntity(fprinters.config.topazname, {
			ent = "f_topaz_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 1000,
			max = 2,
			cmd = "buytopazprinter",
	})	
	 
	DarkRP.createEntity(fprinters.config.emeraldname, {
			ent = "f_emerald_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 2500,
			max = 2,
			cmd = "buyemeraldprinter",
	})
	 
	DarkRP.createEntity(fprinters.config.rubyname, {
			ent = "f_ruby_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 5000,
			max = 2,
			cmd = "buyrubyprinter",
	})
	 
	DarkRP.createEntity(fprinters.config.sapphirename, {
			ent = "f_sapphire_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 7500,
			max = 2,
			cmd = "buysapphireprinter",
	})

	DarkRP.createEntity(fprinters.config.vipname, {
			ent = "f_vip_printer",
			model = "models/props_c17/consolebox01a.mdl",
			price = 7500,
			max = 2,
			cmd = "buyvipprinter",
    		customCheck = function(ply) return table.HasValue({"donator","superadmin"}, ply:GetUserGroup()) end,
	})

	DarkRP.createEntity(fprinters.config.extinguishername, {
			ent = "fprinters_extinguisher",
			model = fprinters.config.extinguishermodel,
			price = fprinters.config.extinguishercost,
			max = 2,
			cmd = "buyprintextinguisher",
	})

	DarkRP.createEntity(fprinters.config.repairpackname, {
			ent = "fprinters_healthpack",
			model = fprinters.config.repairpackmodel,
			price = fprinters.config.repaircost,
			max = 2,
			cmd = "buyprinthealth",
	})
end