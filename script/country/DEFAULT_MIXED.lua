-- Scripted for YAMDaM by WKIII
-- An AI for small and solid countires, Not great powers or secondary powers.
-- They will never research high tech, which is can be bought by a production license from researchers.
-- They will research only land tech, doctrines and industrial tech. Genrally JATs in any other aspect.
local P = {}
AI_DEFAULT_MIXED = P

-- Technology:
function P.TechWeights(voTechnologyData)
	local laArray = {
		0.2,	-- _RESEARCH_LAND_
		0.2,	-- _RESEARCH_LAND_DOC_
		0.0,	-- _RESEARCH_AIR_
		0.15,	-- _RESEARCH_AIR_DOC_
		0.0,	-- _RESEARCH_NAVAL_
		0.2,	-- _RESEARCH_NAVAL_DOC_
		0.25,	-- _RESEARCH_INDUSTRIAL_
		0.0,	-- _RESEARCH_SECRET_
		0.0		-- _RESEARCH_UNKNOWN_
	};
	return laArray
end
function P.LandTechs(voTechnologyData)
	local ignoreTech = {
		-- Can be bought by license:
		{"mechanized_infantry_brigade",0},
		{"tank_brigade",0},
		{"gunships",0},
		{"tank_destroyer",0},
		{"sp_anti_air",0}
	};
	local preferTech = {
		-- Anything else.
	};
	return ignoreTech, preferTech
end
function P.LandDoctrinesTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.AirTechs(voTechnologyData)
	-- Entirely ignores, But able to buy licenses from researchers instead.
	local ignoreTech = {"all"};
	return ignoreTech, nil
end
function P.AirDoctrineTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.NavalTechs(voTechnologyData)
	-- Entirely ignores, But able to buy licenses from researchers instead.
	local ignoreTech = {"all"};
	return ignoreTech, nil
end
function P.NavalDoctrineTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.IndustrialTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.SecretWeaponTechs(voTechnologyData)
	-- Entirely ignores.
	local ignoreTech = {"all"};
	return ignoreTech, nil
end
function P.OtherTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end

-- Production:
function P.LandToAirRatio(voProductionData)
	local laArray = {
		5,	-- Land Battalion
		1	-- Air Squadron
	};
	return laArray
end
function P.ProductionWeights(voProductionData)
	local laArray
	if (voProductionData.ManpowerTotal < 30 and voProductionData.LandCountTotal > 30) or voProductionData.ManpowerTotal < 10 then
		laArray = {
			0.0,	-- Land
			0.40,	-- Air
			0.45,	-- Sea
			0.15	-- Other
		}
	elseif voProductionData.IsAtWar then
		laArray = {
			0.45,	-- Land
			0.25,	-- Air
			0.25,	-- Sea
			0.05	-- Other
		}
	else
		laArray = {
			0.40,	-- Land
			0.20,	-- Air
			0.20,	-- Sea
			0.20	-- Other
		}
	end
	return laArray
end
function P.LandRatio(voProductionData)
	local laArray = {
		infantry_brigade = 2,
		air_cavalry_brigade = 3,
		armor_brigade = 3,
		mechanized_brigade = 13,
	};
	return laArray
end
function P.SpecialForcesRatio(voProductionData)
	local laRatio = {
		20, -- Land
		1	-- Special Force Unit
	};
	local laUnits = {
		marine_brigade = 4,
		paratrooper_brigade = 2,
		special_forces_brigade = 1
	};
	return laRatio, laUnits	
end
function P.FirePower(voProductionData)
	local laArray = {
		"infantry_brigade"
	};
	return laArray
end
function P.AirRatio(voProductionData)
	local laArray = {
		interceptor = 6,
		multi_role = 3,
		cas = 1,
		strategic_bomber = 1,
		naval_bomber = 1
	};
	return laArray
end
function P.RocketRatio(voProductionData)
	local laArray = {
		10, -- Air
		0	-- Bomb/Rocket
	};
	return laArray
end
function P.NavalRatio(voProductionData)
	local laArray = {
		destroyer = 5,
		submarine = 0.5,
		heavy_cruiser = 1,
		light_cruiser = 3
	};
	return laArray
end
function P.TransportLandRatio(voProductionData)
	local laArray = {
		10, -- Land
		2,  -- transport
		1	-- invasion craft
	};
	return laArray
end
function P.ConvoyRatio(voProductionData)
	local laArray = {
		5,	-- Percentage extra (adds to 100 percent so if you put 10 it will make it 110% of needed amount)
		10, -- If Percentage extra is less than this it will force it up to the amount entered
		20, -- If Percentage extra is greater than this it will force it down to this
		5	-- Escort to Convoy Ratio (Number indicates how many convoys needed to build 1 escort)
	};
	return laArray
end
function P.Build_RocketTest(ic, voProductionData)
	return ic, false	
end

-- Return:
return AI_DEFAULT_MIXED