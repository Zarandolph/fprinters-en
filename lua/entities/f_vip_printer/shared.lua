ENT.Type 		= "anim"
ENT.Base 		= "base_entity"

ENT.PrintName	= "fPrinters"
ENT.Author		= "Fexa"
ENT.Contact		= "http://steamcommunity.com/id/fexahit/"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false
ENT.RenderGroup 		= RENDERGROUP_OPAQUE

AddCSLuaFile( "shared.lua" )

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "isWorking" )
	self:NetworkVar( "Float", 1, "Money" )
    self:NetworkVar( "Entity", 0, "owning_ent")
    self:NetworkVar( "Float", 0, "Saglik")
end