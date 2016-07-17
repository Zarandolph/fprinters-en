AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )

function ENT:InvalidateEntity(ent)
    ent._InvalidMoney = true;
end

function ENT:IsEntityInvalid(ent)
    return ent._InvalidMoney == true;
end

--

function ENT:Initialize()
	self:SetModel( "models/props_c17/consolebox01a.mdl" )
	self:SetColor( fprinters.config.rubycolor )
	self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self:SetSaglik( 100 )
	self:SetUseType(SIMPLE_USE)
	self.yaniyor = false
	timer.Simple(fprinters.config.rubyprinttime, function() if IsValid(self) then yaratulan(self) end end)

	self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"))
	self.sound:SetSoundLevel(52)
	self.sound:PlayEx(1, 100)
end

function ENT:SaglikAzalt( miktar )
	if (self:GetSaglik()-miktar)<0 then 
		self:SetSaglik(0)
	else
	self:SetSaglik( self:GetSaglik()-miktar )
    end
end

function ENT:SaglikArttir( miktar )
	if (self:GetSaglik()+miktar)>100 then 
		self:SetSaglik(100)
	else
	self:SetSaglik( self:GetSaglik()+miktar )
    end
end

function ENT:OnTakeDamage(dmg)
	if dmg:IsDamageType(DMG_BURN) then return end
	if self.yaniyor then self:YokEt() end
	self:SaglikAzalt(dmg:GetDamage())
end

function ENT:YokEt()
	if not IsValid( self ) then return end

	local vPoint = self:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)
	DarkRP.notify(self:Getowning_ent(), 1, 4, fprinters.config.exploded)

	self:Remove()
end

function ENT:ParaYarat()
	if not IsValid(self) then return end
	local MoneyPos = self:GetPos()
	local printamount = fprinters.config.rubyprintamount
	local printtime = fprinters.config.rubyprinttime
	if math.random(1, 1000) == 3 then self:Yak() end
	local amount = self:GetMoney() + printamount
	self:SetMoney( amount )
	timer.Simple(printtime, function() yaratulan(self) end)
end

function yaratulan(ent)
	if IsValid(ent) then
		timer.Simple(0.1, function() if IsValid(ent) then ent:ParaYarat() end end)
	end
end

function ENT:Yak()
	self.yaniyor = true
	self.yokedelimmi = true
	self:Ignite( 15, 0 )
	DarkRP.notify(self:Getowning_ent(), 0, 4, fprinters.config.overheating)
	timer.Simple( 10, function() if IsValid( self ) && self.yokedelimmi then self:YokEt() end end)
end

function ENT:Use( act, caller )
	if !( self:Getowning_ent():IsPlayer() ) then return end

	if caller:isCP() or caller:isMayor() then 
		DarkRP.notify(caller, 1, 4, fprinters.config.youcantuse) 
		return
	end

	if self:GetMoney() >= 1 then
	caller:addMoney(self:GetMoney());
	DarkRP.notify(caller, 1, 4, "You got "..self:GetMoney()..fprinters.config.moneytype.." from printer!")
	self:SetMoney( 0 )
	end
end

function ENT:Think()
	if !( self:Getowning_ent():IsPlayer() ) then 
		self:Remove()
	end

	if not (self.yaniyor==true) and (self:GetSaglik()==0) then 
		self:Yak()
	end 

	if !self:IsInWorld() then 
		DarkRP.notify(self:Getowning_ent(), 1, 4, fprinters.config.yourprinterisbugged)
		self:Remove()
	end	

	if self:WaterLevel()==3 then 
		self:YokEt()
	end
end

function ENT:Touch( ent )
	if (ent:GetClass()=="fprinters_extinguisher") then
		if !( self.yaniyor ) then return end
		if self.yokedelimmi==false then return end 	
			if self:IsEntityInvalid(ent) then return end		
			self:InvalidateEntity(ent)			
			self.yokedelimmi=false
			ent:Remove()
			self:Extinguish()
			self:SaglikArttir( 50 )
			self.yaniyor = false
			self.daextinguishsequence = 1
			DarkRP.notify(self:Getowning_ent(), 0, 4, fprinters.config.printerextinguished)
	elseif (ent:GetClass()=="fprinters_healthpack") then
		if self:IsEntityInvalid(ent) then return end		
		self:InvalidateEntity(ent)
		if self.yaniyor then return end
		if self:GetSaglik()==100 then return end
		ent:Remove()
		if (self.dabugsequence == 1) then return end
		self:SaglikArttir(fprinters.config.healthincrease)	
		self.dabugsequence = 1
		timer.Simple( 1, function() self.dabugsequence = 0 end)
	elseif (ent:GetClass()=="spawned_money") then 
		if (self.dabugsequence == 1) then return end
		if (self:IsEntityInvalid(ent)) then return end	
		self:InvalidateEntity(ent)
		local amount = self:GetMoney() + ent.dt.amount 
		self:SetMoney( amount )
		ent:Remove()
		self.dabugsequence = 1
		timer.Simple( 1, function() self.dabugsequence = 0 end)
	end	
end

function ENT:OnRemove()
	if self.sound then
		self.sound:Stop()
	end
end