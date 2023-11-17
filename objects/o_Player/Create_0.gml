//setup de daño
	get_damage_create(10, true);

//variables de movimiento
	moveDir = 0;
	moveSpd = 6.3;
	xspd = 0;
	yspd = 0;


//sprite control
	centerYOffset = -18;
	centerY = y + centerYOffset; 
	
	weaponOffsetDist = 4;
	aimDir = 0;

	face = 3;
	sprite[0] = s_playerRight;
	sprite[1] = s_playerUp;
	sprite[2] = s_playerLeft;
	sprite[3] = s_playerDown;

//info arma
	bulletObj = o_bullet;
	shootTimer = 0;
	shootCooldown = 3.5;
	weaponLength = sprite_get_bbox_right(s_ak47) - sprite_get_xoffset(s_ak47);
	
	//añadir armas al inventario del jugador
	array_push(global.PlayerWeapons, global.WeaponList.ak_47,  global.WeaponList.gak_47);
	
	selectedWeapon = 0;
	weapon = global.PlayerWeapons[selectedWeapon];
	
	
	
	