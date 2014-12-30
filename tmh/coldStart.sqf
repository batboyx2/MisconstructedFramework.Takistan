private ["_count", "_EHindex"];
if (time < 10) then {
tmh_var_cold = true;
//
// =========================================================================================
// God everyone on spawn to prevent object-collision deaths

[] spawn {
	player allowDamage false;
	{_x allowDamage false;} forEach playableUnits;
};
};
//
// =========================================================================================
// Add the fleximenu option for administrative functions to the current administrator
if ((serverCommandAvailable "#missions") || (isServer)) then {
	[
		"player",
		[ace_sys_interaction_key_self],
		-100,
		[
			"tmh\adminFunctions.sqf",
			"main"
		]
	] call CBA_UI_fnc_Add; //ace self interact
};

//
// =========================================================================================
// Define functions and eventhandlers

firedEH = { //define the eventhandler for any type of fire (grenade throws, gun shots, etc.)
	_bullet = _this select 6; //find projectile
	deleteVehicle _bullet; //delete projectile
};

tmh_fnc_weaponsCold = {
	_EHindex = player addEventHandler ["Fired", firedEH];
	player allowDamage false;
	{_x allowDamage false} forEach playableUnits;
};

tmh_fnc_weaponsLive = {
	player removeEventHandler ["Fired", _EHindex];
	player allowDamage true;
	{_x allowDamage true} forEach playableUnits;
};

//
// =========================================================================================
// Meat of the script, handle switching on and off of damage and weapon usability

_count = 0;
while {true} do {
	waitUntil {!isNil "tmh_var_cold"}; //JIP precautions
	waitUntil {tmh_var_cold}; //JIP precautions
	hint "All weapons are cold.";
	[] call tmh_fnc_weaponsCold;
	_count = 0;
	while {tmh_var_cold} do {
		_rem = _count mod 60;
		if (_rem == 0) then {
			_formText = format["All weapons are cold | Waiting on Administrator | %1 minutes elapsed", (_count / 60)];
			hint _formText;
		};	//only hint every minute
		_count = _count + 1;
		sleep 1;
	};
	hint "All weapons are live.";
	[] call tmh_fnc_weaponsLive;
	waitUntil {tmh_var_cold};
};

//
// =========================================================================================
//