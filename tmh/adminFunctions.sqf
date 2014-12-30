private ["_target","_params","_menuName","_menuRsc","_menuDef","_menus","_objects"];

_target = _this select 0;
_params = _this select 1;

_menuName = "main";
_menuRsc = "popup";

tmh_fnc_spawnUtilityCrate = {
	_crateClass = (_this select 0);
	//hint _crateClass;
	createVehicle [_crateClass, getPos player,[],0,"NONE"];
};

tmh_fnc_deleteUtilityCrate = {
	_objects = nearestObjects [getPos player,["ACE_ItemsBox","ACE_RopeBox","ACE_RuckBox","ACRE_RadioBox","ACE_BandageBoxWest"],100];
	hint str _objects;
	deleteVehicle (_objects select 0);
};

_menus = [
  [
    ["main", "tmh menu", _menuRsc], // Root menu, name of ???, rsc for it
    [
      ["<t color='#ffc600'>Administrator Actions ></t>",
        {}, // code to run
        "", "", // ?? and ??
		["tmh\adminFunctions_mainMenu.sqf","tmh_mainMenu",1], //submenu
		-1, // key
        (true)] //conditions
    ]
  ]
];
//-----------------------------------------------------------------------------
_menuDef = [];
{
  if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
  hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""},__FILE__];
  diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef 