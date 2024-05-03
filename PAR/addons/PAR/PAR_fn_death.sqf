params ["_unit"];

[(_unit getVariable ['PAR_myMedic', objNull]), _unit] call PAR_fn_medicRelease;
_unit setVariable ['PAR_wounded', false];

if (_unit == player) then {
	titleText ["" ,"BLACK FADED", 100];
	_unit connectTerminalToUAV objNull;

	// Grave + Save Stuff
	private _pos = getPosATL _unit;
	if (PAR_grave == 1 && isNull objectParent player &&
		(_pos select 2) <= 2 && !(surfaceIsWater _pos)) then {
		// Clean body
		removeAllActions _unit;
		removeAllWeapons _unit;
		_unit setPosATL ([0,0,0] vectorAdd [floor random 5, floor random 5, 0.5]);

		// Save Stuff
		[PAR_grave_box] call F_clearCargo;
		[PAR_grave_box, PAR_backup_loadout] call F_setCargo;

		// create grave
		private _grave = (selectRandom PAR_graves) createVehicle _pos;
		_grave allowDamage false;
		_grave setPosATL _pos;
		_grave setvariable ["PAR_grave_message", format ["- R.I.P - %1", name player], true];

		// remove old grave (max: 3)
		private _old_graves = _unit getVariable ["PAR_player_graves", []];
		_old_graves pushback _grave;
		if (count _old_graves > 3) then {
			deleteVehicle (_old_graves select 0);
			_old_graves deleteAt 0;
		};
		_unit setvariable ["PAR_player_graves", _old_graves];

		// attach grave box
		private _grave_box_pos = (getposATL _grave) vectorAdd ([[-1.75, 0, 0], -(getDir _grave)] call BIS_fnc_rotateVector2D);
		PAR_grave_box enableSimulationGlobal true;
		PAR_grave_box setPosATL _grave_box_pos;
		PAR_grave_box attachto [_grave];
		// Marker
		"player_grave_box" setMarkerPosLocal PAR_grave_box;
	};

	// Marker
	if (PAR_grave == 0) then { "player_grave_box" setMarkerPosLocal _pos };
	titleText ["" ,"BLACK FADED", 100];
} else {
	player globalChat (format [localize "STR_PAR_DE_01", name _unit]);
	removeAllActions _unit;
	removeAllWeapons _unit;
	hideBody _unit;
	sleep 5;
	deleteVehicle _unit;
};
