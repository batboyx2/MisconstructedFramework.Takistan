_unit = _this select 0;

_bool = [_unit] call ACE_fnc_HasRuck;
if (_bool) then {
	[_unit, "MAG", "ACE_Bandage", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_LargeBandage", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Epinephrine", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Morphine", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Medkit", 4] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Tourniquet", 4] call ACE_fnc_RemoveGear;
};
{_unit removeMagazine "ACE_Medkit"} forEach [1,2];
{_unit removeMagazine "ACE_LargeBandage"} forEach [1];
{_unit removeMagazine "ACE_Tourniquet"} forEach [1];
{_unit removeMagazine "ACE_Bandage"} forEach [1];

sleep 2;
/*
_bool = [_unit] call ACE_fnc_HasRuck;
if (_bool) then {
	[_unit, "MAG", "ACE_Bandage", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_LargeBandage", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Epinephrine", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Morphine", 10] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Medkit", 4] call ACE_fnc_RemoveGear;
	[_unit, "MAG", "ACE_Tourniquet", 4] call ACE_fnc_RemoveGear;
};
{_unit removeMagazine "ACE_Medkit"} forEach [1,2];
{_unit removeMagazine "ACE_LargeBandage"} forEach [1];
{_unit removeMagazine "ACE_Tourniquet"} forEach [1];
{_unit removeMagazine "ACE_Bandage"} forEach [1];
*/