private ["_target","_params","_menuName","_menuRsc","_menuDef","_menus"];


_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__]};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

_menus = [];

if (_menuName == "tmh_utilityCrateMenu") then {
	_menus set [count _menus,
		[
			["tmh_utilityCrateMenu","Self Options", _menuRsc],
			[
				["<t color='#b54438'>ACE Medical Box ></t>",
					{["ACE_BandageBoxWest"] call tmh_fnc_spawnUtilityCrate},
					"", "", "", -1,
					true],
				["<t color='#b54438'>ACRE Radio Box ></t>",
					{["ACRE_RadioBox"] call tmh_fnc_spawnUtilityCrate},
					"", "", "", -1,
					true],
				["<t color='#b54438'>ACE Ruck Box ></t>",
					{["ACE_RuckBox"] call tmh_fnc_spawnUtilityCrate},
					"", "", "", -1,
					true],
				["<t color='#b54438'>ACE Rope Box ></t>",
					{["ACE_RopeBox"] call tmh_fnc_spawnUtilityCrate},
					"", "", "", -1,
					true],
				["<t color='#b54438'>ACE Item Box ></t>",
					{["ACE_ItemsBox"] call tmh_fnc_spawnUtilityCrate},
					"", "", "", -1,
					true],
				["<t color='#b54438'>Delete Nearest Crate ></t>",
					{[] call tmh_fnc_deleteUtilityCrate},
					"", "", "", -1,
					true]
			]
		]
	];
};





_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef