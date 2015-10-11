-- Scripted for YAMDaM by WKIII
-- The British AI: Offensive, Naval excell. High tech researcher.
-- Loves: United States, Canada, Australia, New Zealnd, India, Singapore, France, Portugal
-- Hates: Russia, China, Iran, Egypt, North Korea, Argentina
local P = {}
AI_ENG = P

-- Technology:
function P.TechWeights(voTechnologyData)
	local laArray = {
		0.15,	-- _RESEARCH_LAND_
		0.1,	-- _RESEARCH_LAND_DOC_
		0.125,	-- _RESEARCH_AIR_
		0.125,	-- _RESEARCH_AIR_DOC_
		0.15,	-- _RESEARCH_NAVAL_
		0.15,	-- _RESEARCH_NAVAL_DOC_
		0.20,	-- _RESEARCH_INDUSTRIAL_
		0.0,	-- _RESEARCH_SECRET_
		0.0		-- _RESEARCH_UNKNOWN_
	};
	return laArray
end
function P.LandTechs(voTechnologyData)
	local ignoreTech = {
		-- Ignore some engineering stuff:
		{"demolition_equipment", 5},
		{"bridging_equipment", 5},
		-- Ignore irrelevant infantry abilities:
		{"mountain_equipment", 0},
		{"truck_engines", 4},
		-- Ignore special forces after level 5:
		{"special_forces_regiment", 5},
		{"special_small_arms", 5},
		{"special_heavy_weapons", 5},
		{"special_anti_tank", 5},
		{"special_support_weapons", 5},
		-- Ignore gunships at all:
		{"gunships", 0},
		{"gunship_armament", 0},
		{"gunship_fuselage", 0},
		{"gunship_engines", 0},
		{"gunship_reliability", 0},
		-- Ignore tank destroyers:
		{"tank_destroyer", 0},
		{"td_armament", 0},
		{"td_chassis", 0}
	};
	local preferTech = {
		-- Superior MBTs
		"tank_brigade",
		"tank_gun",
		"tank_armor",
		"tank_engine",
		"tank_reliability",
		-- AA for British Isles:
		"anti_airs",
		"anti_air_gun",
		"anti_air_carriage",
		"sam_batteries",
		"sp_anti_air",
		"sp_anti_air_armament",
		-- Infantry
		"infantry_brigade_activation",
		"marine_infantry",
		"desert_equipment",
		"urban_equipment",
		"night_equipment",
		"jungle_equipment",
		"forest_equipment",
		"amphibious_equipment"
	};
	return ignoreTech, preferTech
end
function P.LandDoctrinesTechs(voTechnologyData)
	local ignoreTech = {
		-- Active ally:
		{"asymmetrical_warfare", 0},
		{"defence_in_depth", 0},
		{"flexible_defence", 0},
		{"guerilla_tactics", 0},
		{"special_forces_doctrine", 0},
		{"reserves_doctrine", 0},
		{"superior_firepower", 0},
		{"static_defence", 0},
		{"close_air_support_doctrine", 0},
		{"human_wave", 0},
		{"firesupport_coordination", 0},
		{"solid_air_defence", 0}
	};
	local preferTech = {
		-- Active ally:
		"logistics_tech",
		"organisation_tech",
		"modern_blitzkrieg",
		"breakthrough_exploitation",
		"elastic_defence",
		"flanking_maneuvers",
		"shock_and_awe",
		"armor_tactics"
	};
	return ignoreTech, preferTech
end
function P.AirTechs(voTechnologyData)
	local ignoreTech = {
		-- Does not ingore any sort of air tech
	};
	local preferTech = {
		-- To transport their stuff out of Britain:
		"transport_planes",
		"transport_plane_engine",
		"transport_plane_fuselage",
		"transport_plane_fuel_tanks",
		"transport_plane_cargo_hold",
		-- Effective air to sea attacks:
		"naval_bombers",
		"air_to_sea_weapons",
		"naval_bomber_engine",
		"naval_bomber_fuselage",
		"naval_bomber_fuel_tanks",
		"bomber_countermeasures",
		"bomber_radar",
		-- Excell CAGs:
		"carrier_air_group",
		"cag_weapons",
		"cag_fuselage",
		"cag_engine",
		"cag_fuel_tanks",
		"fighter_countermeasures",
		"fighter_radar",
		"bomber_radar"
	};
	return ignoreTech, preferTech
end
function P.AirDoctrineTechs(voTechnologyData)
	local ignoreTech = {
		-- Does not ingore any sort of air tech
	};
	local preferTech = {
		-- Naval excell:
		"naval_aviation_doctrine",
		"nav_pilot_training",
		"nav_groundcrew_training",
		"portstrike_tactics",
		"navalstrike_tactics",
		"naval_air_targeting",
		"naval_tactics"
	};
	return ignoreTech, preferTech
end
function P.NavalTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.NavalDoctrineTechs(voTechnologyData)
	-- Jack of all trades.
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.IndustrialTechs(voTechnologyData)
	local ignoreTech = {
		-- Does not ingore any industrial tech.
	};
	local preferTech = {
		-- High tech advance:
		"computers",
		"radios",
		"radar",
		"education",
		-- Industrial advance:
		"energy_production",
		"energy_efficiency",
		"industral_production",
		"industral_efficiency"
	};
	return ignoreTech, preferTech
end
function P.SecretWeaponTechs(voTechnologyData)
	-- Ignores totally.
	local ignoreTech = {"all"}
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
			0.30,	-- Air
			0.50,	-- Sea
			0.20	-- Other
		}
	elseif voProductionData.IsAtWar then
		laArray = {
			0.20,	-- Land
			0.25,	-- Air
			0.45,	-- Sea
			0.10	-- Other
		}
	else
		laArray = {
			0.20,	-- Land
			0.20,	-- Air
			0.30,	-- Sea
			0.30	-- Other
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
		interceptor = 4,
		cag = 4,
		multi_role = 1,
		cas = 1,
		tbm = 1,
		naval_bomber = 2,
		strategic_bomber = 1
	};
	return laArray
end
function P.RocketRatio(voProductionData)
	local laArray = {
		10, -- Air
		1	-- Bomb/Rocket
	};
	return laArray
end
function P.NavalRatio(voProductionData)
	local laArray = {
		destroyer = 12,
		submarine = 2,
		heavy_cruiser = 4,
		light_cruiser = 16,
		patrol_boat = 2,
		carrier = 1
	};
	return laArray
end
function P.TransportLandRatio(voProductionData)
	local laArray = {
		10, -- Land
		2,  -- transport
		2	-- invasion craft
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

-- Diplomacy:
function P.DiploScore_InfluenceNation(voDiploScoreObj)
	local loInfluences = {
		ISR = {Score = 250},
		AST = {Score = 500},
		NZL = {Score = 500},
		SIN = {Score = 500},
		IRE = {Score = 350},
		CHI = {Score = 50},
		JOR = {Score = 100},
		IND = {Score = 500}
	}
	-- Are they on our list
	if loInfluences[voDiploScoreObj.TargetName] then
		return (voDiploScoreObj.Score + loInfluences[voDiploScoreObj.TargetName].Score)
	end
	return voDiploScoreObj.Score
end
function P.DiploScore_OfferTrade(voDiploScoreObj)
	local laTrade = {
		-- Loves:
		USA = {Score = 200},
		GER = {Score = 200},
		IND = {Score = 200},
		ITA = {Score = 50},
		SPA = {Score = 75},
		POR = {Score = 150},
		JAP = {Score = 50},
		KOR = {Score = 125},
		ISR = {Score = 75},
		CHI = {Score = 150},
		CAN = {Score = 200},
		FRA = {Score = 190},
		AST = {Score = 200},
		NZL = {Score = 200},
		SIN = {Score = 100},
		-- Hates:
		ARG = {Score = -200},
		SOV = {Score = -200},
		CHC = {Score = -75},
		PER = {Score = -200},
		SYR = {Score = -200},
		EGY = {Score = -100},
		IRQ = {Score = -150},
		PAK = {Score = -50},
		PRK = {Score = -200}
	}
	if laTrade[voDiploScoreObj.TagName] then
		return voDiploScoreObj.Score + laTrade[voDiploScoreObj.TagName].Score
	end
	return voDiploScoreObj.Score
end
function P.DiploScore_Alliance( viScore, ai, actor, recipient, observer)
	local lsTargetTag = voDiploScoreObj.TargetTag
	if lsTargetTag == 'USA' or
	lsTargetTag == 'CAN' or
	lsTargetTag == 'NZL' or
	lsTargetTag == 'AST' or
	lsTargetTag == 'POR' or
	lsTargetTag == 'FRA' or
	lsTargetTag == 'SIN' or
	lsTargetTag == 'MLT' or
	lsTargetTag == 'GER' then
		voDiploScoreObj.Score = 200
	elseif lsTargetTag == 'PER' or
	lsTargetTag == 'IRQ' or
	lsTargetTag == 'SYR' or
	lsTargetTag == 'EGY' or
	lsTargetTag == 'SOV' or
	lsTargetTag == 'MEX' or
	lsTargetTag == 'SAU' or
	lsTargetTag == 'CHC' or
	lsTargetTag == 'PKR' then
		return 0
	end
	return voDiploScoreObj.Score
end
function P.ForeignMinister_Influence(voForeignMinisterData)
	local laIgnoreWatch -- Ignore this country but monitor them if they are about to join someone else
	local laWatch -- Monitor them and also fi their score is high enough they can be influenced normally
	local laIgnore -- Ignore them completely
	laWatch = {
		"ISR",
		"KOR",
		"JAP",
		"NZL",
		"AST",
		"SIN",
		"CHI",
		"MLT",
		"IRE",
		"CYP",
		"PHI",
		"FRA",
		"ITA",
		"SPA",
		"GER",
		"USA",
		"IND",
		"NOR"
	};
	laIgnoreWatch = {
		"SWE",
		"FIN",
		"JOR",
		"POR",
		"SCH",
		"AUS",
		"BOS",
		"SER",
		"SLV",
		"SLO",
		"CZE"
	};
	laIgnore = {
		"PER",
		"IRQ",
		"SYR",
		"EGY",
		"CHC",
		"SOV",
		"PKR",
		"SAU"
	};
	return laWatch, laIgnoreWatch, laIgnore
end
function P.DiploScore_RequestLendLease( liScore, voAI, voActorTag )
	if tostring(voActorTag) == "JAP" or
	tostring(voActorTag) == "KOR" or
	tostring(voActorTag) == "ISR" or
	tostring(voActorTag) == "IND" or
	tostring(voActorTag) == "POR" or
	tostring(voActorTag) == "NOR" or
	tostring(voActorTag) == "HOL" or
	tostring(voActorTag) == "BEL" or
	tostring(voActorTag) == "AUS" or
	tostring(voActorTag) == "SCH" or
	tostring(voActorTag) == "POL" or
	tostring(voActorTag) == "CHI" or
	tostring(voActorTag) == "USA" or
	tostring(voActorTag) == "GER" or
	tostring(voActorTag) == "FRA" or
	tostring(voActorTag) == "CYP" or
	tostring(voActorTag) == "SIN" or
	tostring(voActorTag) == "IND" or
	tostring(voActorTag) == "AST" or
	tostring(voActorTag) == "SPR" or
	tostring(voActorTag) == "GRE" or
	tostring(voActorTag) == "NZL" then
		return 200
	end
	return liScore
end

-- Return:
return AI_ENG