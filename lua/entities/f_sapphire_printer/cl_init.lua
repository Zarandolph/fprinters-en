include('shared.lua')

surface.CreateFont( "RLLYKucukFont", {
	font = "BebasNeue",
	size = 18,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "KucukFont", {
	font = "BebasNeue",
	size = 24,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "UffaxFont", {
	font = "BebasNeue",
	size = 31,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "Font", {
	font = "BebasNeue",
	size = 40,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "BuyukFont", {
	font = "BebasNeue",
	size = 64,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "DahaBuyukFont", {
	font = "BebasNeue",
	size = 80,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )	

surface.CreateFont( "DahadaBuyukFont", {
	font = "BebasNeue",
	size = 95,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )	

surface.CreateFont( "BayagiBuyukFont", {
	font = "BebasNeue",
	size = 112,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )	

function draw.Kare( x, y, x2, y2, renk )
	return draw.RoundedBox(0,x-137,y-148,x2,y2,renk)
end

function draw.KarsidanKare( x, y, x2, y2, renk )
	return draw.RoundedBox(0,x-137,y-97,x2,y2,renk)
end

function draw.OrtaliYazi( x, y, font, yazi )
	return draw.SimpleText(yazi,font,x-137,y-148,Color(255,255,255),TEXT_ALIGN_CENTER)
end

function draw.KarsidanOrtaliYazi( x, y, font, yazi )
	return draw.SimpleText(yazi,font,x-137,y-97,Color(255,255,255),TEXT_ALIGN_CENTER)
end

function draw.KarsidanSolluYazi( x, y, font, yazi )
	return draw.SimpleText(yazi,font,x-137,y-97,Color(255,255,255),TEXT_ALIGN_LEFT)
end

local function drawYovarlank( x, y, radius, seg ) -- Bunu kendim yapmadım, mantığı çoxor. 
	local cir = {}
	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, 72 do
		local a = math.rad( ( i / 72 ) * -360 +180)
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end
	draw.NoTexture()
	surface.DrawPoly( cir )
end

local function roundValue( number )
	local output = number
	if number < 1000000 then
		output = string.gsub( number, "^(-?%d+)(%d%d%d)", "%1,%2" ) 
	else
		output = string.gsub( number, "^(-?%d+)(%d%d%d)(%d%d%d)", "%1,%2,%3" )
	end
	return output
end

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local KarsidanAng = self:GetAngles()

    local sahip = self:Getowning_ent()
	sahip = (IsValid(sahip) and sahip:Nick()) or DarkRP.getPhrase("unknown")

	Ang:RotateAroundAxis(Ang:Up(), 90)

	KarsidanAng:RotateAroundAxis(Ang:Right(), 90)
	KarsidanAng:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D( Pos + Ang:Up() * 10.65, Ang, 0.109 )

		draw.Kare( 0,0,278,280,Color(0,0,0,205) )
		
		draw.Kare( 3,3,272,45,Color(0,0,0,205) )
		draw.OrtaliYazi( 137, 7, "Font", sahip)

		surface.SetDrawColor(0,0,0,205)
		drawYovarlank( 0, 15, 100, 50 )

	if (self:GetMoney()>=10000&&self:GetMoney()<100000) then
		draw.OrtaliYazi( 134, 120, "DahadaBuyukFont", roundValue(self:GetMoney()) )
	elseif ( self:GetMoney()>=100000 ) then
		draw.OrtaliYazi( 134, 125, "DahaBuyukFont", roundValue(self:GetMoney()) )
	else
		draw.OrtaliYazi( 134, 110, "BayagiBuyukFont", roundValue(self:GetMoney()) )
	end
	
		draw.OrtaliYazi( 136, 200, "Font", fprinters.config.moneytype )
		draw.OrtaliYazi( 136, 85, "Font", fprinters.config.moneytype )
	
	cam.End3D2D()

	cam.Start3D2D( Pos + KarsidanAng:Up() * 16.9, KarsidanAng, 0.109 )

		draw.KarsidanKare( 0,0,278,95,Color(0,0,0,205) )
		draw.KarsidanKare( 3,3,272,89,Color(0,0,0,205) )

		draw.KarsidanOrtaliYazi( 133, 5, "BuyukFont", self:GetSaglik())
		draw.KarsidanOrtaliYazi( 133, 60, "KucukFont", fprinters.config.sapphirename)

	cam.End3D2D()
end