//constructor de plantillas de armas
function create_weapon( _sprite = s_ak47, _weaponLength = 0, _bulletObj = o_bullet, _cooldown = 1) constructor
{

	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;

}

//inventaro de arma del jugador
global.PlayerWeapons= array_create(0);

//armas
global.WeaponList = {
	
	ak_47 : new create_weapon(
		s_ak47,
		sprite_get_bbox_right(s_ak47) - sprite_get_xoffset(s_ak47),
		o_bullet,
		6
		),
	
	gak_47 : new create_weapon(
		s_gak47,
		sprite_get_bbox_right(s_gak47) - sprite_get_xoffset(s_gak47),
		o_bullet2,
		2
		),
		
	
	}

