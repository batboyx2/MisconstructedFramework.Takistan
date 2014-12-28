// F2 - Folk Assign Gear Script - Russian Army Equipment
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co		- commander
//		dc 		- deputy commander
//		m 		- medic
//		ftl		- fire team leader
//		ar 		- automatic rifleman
//		aar		- assistant automatic rifleman
//		rat		- rifleman (AT)
//		samg	- surface to air missile gunner
//		samag	- surface to air missile assistant
//		mmgg	- medium mg gunner
//		mmgag	- medium mg assistant
//		hmgg	- heavy mg gunner (deployable)
//		hmgag	- heavy mg assistant (deployable)
//		matg	- medium AT gunner
//		matag	- medium AT assistant
//		hatg	- heavy AT gunner
//		hatg	- heavy AT assistant
//		mtrg	- mortar gunner (deployable)
//		mtrag	- mortar assistant (deployable)
//		sn		- sniper
//		sp		- spotter
//		c		- ground vehicle crew
//		p		- air vehicle pilots
//		eng		- engineers
//
//		r 		- rifleman
//		car		- carabineer
//		smg		- submachinegunner
//		gren	- grenadier
//
//		v_car	- car/4x4
//		v_tr	- truck
//		v_ifv	- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

_rifle = "ACE_AK74M_FL"; _riflemag = "30Rnd_545x39_AK";																						// Standard Riflemen (Spotter, HMG Assistant Gunner, MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, HAT Assistant Gunner, MTR Assistant Gunner, Rifleman)

_carbine = "ACE_AK74M"; _carbinemag = "30Rnd_545x39_AK"; 																					// Standard Carabineer (Medic, HMG Gunner, Rifleman (AT), Rifleman (AA), MAT Gunner, HAT Gunner, MTR Gunner, Carabineer)

_smg = "AKS_74_U"; _smgmag = "30Rnd_545x39_AK";																									// Standard Submachine Gun/Personal Defence Weapon (Vehicle Crew, Aircraft Pilot, Submachinegunner)

_glrifle = "ACE_AK74M_GL"; _glriflemag = "30Rnd_545x39_AK"; _glmag = "1Rnd_HE_GP25";														// Rifle with GL and HE grenades (CO, DC, FTLs)
_glsmokewhite = "1Rnd_SMOKE_GP25"; _glsmokegreen = "1Rnd_SmokeGreen_GP25"; _glsmokered = "1Rnd_SmokeRed_GP25";    							// Smoke for FTLs, Squad Leaders, etc 
_glflarewhite = "FlareWhite_GP25"; _glflarered = "FlareRed_GP25"; _glflareyellow = "FlareYellow_GP25"; _glflaregreen = "FlareGreen_GP25";	// Flares for FTLs, Squad Leaders, etc

_pistol = "ACE_APS"; _pistolmag = "ACE_20Rnd_9x18_APS";																								// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)

_grenade = "HandGrenade_East"; _smokegrenade = "SmokeShell";_smokegrenadegreen = "SmokeShellGreen";																				// Grenades

_bagmedium = "ACE_ALICE_Backpack";		// 																							// Backpack for assistant gunners (AAR, AMMG, AMAT, AHAT), so that they don't have to drop ammo themselves
_baglarge =  "ACE_Rucksack_RD90"; 		// 


// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

_AR = "ACE_RPK74M"; _ARmag = "75Rnd_545x39_RPK";																							// Automatic Rifleman

_MMG = "PK"; _MMGmag = "100Rnd_762x54_PK";																								// Medium MG

_HMG = "ACE_DSHKMProxy";																										// Heavy MG (note: HMG is an assembled weapon, gunner carries weapon)
_HMGmount = "ACE_DSHKMTripodProxy";																													// Assistant Heavy MG (note: HMG is an assembled weapon, assistant carries bipod/tripd)

_RAT = "ACE_RPG22"; _RATmag = "ACE_RPG22";																											// Rifleman AT

_MAT = "RPG7V"; _MATmag1 = "ACE_PG7VL_PGO7"; _MATmag2 = "ACE_TBG7V";																			// Medium AT

_HAT = "MetisLauncher"; _HATmag1 = "ACE_AT13TB"; _HATmag2 = "ACE_AT13TB";																				// Heavy AT Gunner
//_HATscope = "ACE_Javelin_CLU";

_MTR = "M252_US_Bag_EP1";																													// Mortar Gunner (note: Mortar is an assembled weapon, gunner carries weapon)
_MTRmount = "Tripod_Bag";																													// Mortar Assistant Gunner (note: Mortar is an assembled weapon, assistant carries bipod/tripd)

_RAA = "Igla"; _RAAmag = "Iglac";																										// Rifleman AA (anti-air)

_SNrifle = "ACE_SVD_Bipod"; _SNriflemag = "10Rnd_762x54_SVD";																					// Sniper

_claymore = "ACE_CLAYMORE_M"; _satchel = "pipebomb";																										// Engineer

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

removeBackpack _unit;
removeallweapons _unit;
_unit addweapon "NVGoggles"; 					// add universal NVG for this faction

removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
////_unit addweapon "ItemGPS";					// add universal GPS for this faction (nb: misc items not cleared
_unit addweapon "ItemMap";				// etc
_unit addweapon "ItemCompass";
//_unit addweapon "ItemRadio";
_unit addweapon "ItemWatch";

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "co":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_COriflemag
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular_Vector";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _glmag, 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glriflemag, 5] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glsmokewhite, 5] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC117";
	};
  
// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_COriflemag
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular_Vector";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _glmag, 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glriflemag, 5] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glsmokewhite, 5] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC117";
		_unit addWeapon "ACRE_PRC148";
	};  

// LOADOUT: MEDIC
	case "m":
	{
		{_unit addMagazine "ACE_LargeBandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1,2];
		{_unit addMagazine "ACE_Epinephrine"} forEach [1,2];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];	
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1,2,3,4,5];
		{_unit addmagazine _smokegrenadegreen} foreach [1,2];
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _carbinemag, 2] call ACE_fnc_PackMagazine;
		_bool = [_unit, "ACE_LargeBandage", 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, "ACE_Medkit", 8] call ACE_fnc_PackMagazine;
		_bool = [_unit, _smokegrenade, 6] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_COriflemag
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _glmag, 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glriflemag, 5] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glsmokewhite, 5] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};		


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _ARmag} foreach [1,2,3,4];
		_unit addweapon _AR;
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade} foreach [1,2,3];
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;		
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _ARmag, 4] call ACE_fnc_PackMagazine;
		_bool = [_unit, _riflemag, 4] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};				
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6,7,8,9,10];
		_unit addweapon _carbine;
		{_unit addmagazine _RATmag} foreach [1];
		{_unit addmagazine _smokegrenade} foreach [1];		
		_unit addweapon _RAT;
		
		_unit addWeapon "ACRE_PRC148";
	};		
	
// LOADOUT: SURFACE TO AIR MISSILE GUNNER 
	case "samg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _RAAmag} foreach [1];				
		_unit addweapon _RAA;
		
		_unit addWeapon "ACRE_PRC148";
	};			
	
// LOADOUT: ASSISTANT SURFACE TO AIR MISSILE GUNNER
	case "samag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _grenade, 1] call ACE_fnc_PackMagazine;
		_bool = [_unit, _RAAmag, 2] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};			
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _MMGmag} foreach [1,2,3,4,5];
		_unit addweapon _MMG;		
		{_unit addmagazine _pistolmag} foreach [1,2,3,4,5];
		_unit addweapon _pistol;
		
		_unit addWeapon "ACRE_PRC148";
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _MMGmag, 4] call ACE_fnc_PackMagazine;
		_bool = [_unit, _riflemag, 4] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};
	
// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addBackpack _HMG;
		[_unit, _HMG] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};	
	
// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade} foreach [1,2];		
		_unit addBackpack _HMGmount;
		[_unit, _HMGmount] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};		

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3];
		_unit addweapon _carbine;
		{_unit addmagazine _MATmag1} foreach [1,2];
		{_unit addmagazine _MATmag2} foreach [1];
		_unit addweapon _MAT;
		
		_unit addWeapon "ACRE_PRC148";
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade;} foreach [1];		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _MATmag1, 2] call ACE_fnc_PackMagazine;
		_bool = [_unit, _MATmag2, 2] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};	
	
// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		{_unit addmagazine _HATmag1} foreach [1];
		_unit addweapon _HAT;
		_unit addmagazine _HATscope;
		
		_unit addWeapon "ACRE_PRC148";
	};	
	
// LOADOUT: HEAVY AT ASSISTANT GUNNER	
	case "hatag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";	
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _HATmag1, 2] call ACE_fnc_PackMagazine;
		_bool = [_unit, _riflemag, 3] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};		
	
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		_unit addBackpack _MTR;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		_unit addWeapon "Binocular_Vector";			
		_unit addBackpack _MTRmount;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};
	
// LOADOUT: SNIPER
	case "sn":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _SNriflemag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _SNrifle;
		_unit addweapon "Binocular";
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon "ACRE_PRC148";
	};		
	
// LOADOUT: SPOTTER
	case "sp":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _SNriflemag} foreach [1,2,3,4];
		{_unit addmagazine _riflemag} foreach [1,2,3,4];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";	
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon "ACRE_PRC148";
	};			
	
// LOADOUT: GROUND VEHICLE CREW
	case "c":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon "ACRE_PRC148";
	};			
	
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
		{_unit addmagazine _smokegrenade} foreach [1,2];

		_unit addWeapon "ACRE_PRC148";
	};		
	
// LOADOUT: ENGINEER
	case "eng":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _satchel} foreach [1];
		{_unit addmagazine _claymore} foreach [1,2,3];
		
		
		_unit addWeapon "ACRE_PRC148";
	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _riflemag, 12] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};

// LOADOUT: CARABINEER
	case "car":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _carbinemag, 12] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _smgmag} foreach [1,2,3,4,5,6];
		_unit addweapon _smg;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		_unit addWeapon _bagmedium;
		_bool = [_unit, _smgmag, 12] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		{_unit addMagazine "ACE_Bandage"} forEach [1,2,3,4];
		{_unit addMagazine "ACE_Morphine"} forEach [1];
		
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6];	
		_unit addweapon _glrifle;									
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
		_bool = [_unit, _glmag, 15] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glsmokewhite, 10] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glflarewhite, 15] call ACE_fnc_PackMagazine;
		_bool = [_unit, _glriflemag, 2] call ACE_fnc_PackMagazine;
		[_unit, _bagMedium] call ACE_fnc_PutWeaponOnBack;
		
		_unit addWeapon "ACRE_PRC148";
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};	
	
// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
	};
	
// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};
	
// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
		_unit addweapon _rifle;
		
		_unit selectweapon primaryweapon _unit;
				
		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

_unit setVariable ["ace_sys_wounds_no_medical_gear", true];

// ====================================================================================

// ENSURE UNIT HAS WEAPON SAFETIED AND LOWERED ON SPAWN
_unit addWeapon "ACE_Safe";
_unit selectWeapon "ACE_Safe";
_unit action ["WEAPONONBACK",_unit];

//DISENGAGES THE SYSTEM WHICH KEEPS TEN OF EACH MED FROM BEING ADDED

[_unit]execVM "tmh\reinstatePacking.sqf";