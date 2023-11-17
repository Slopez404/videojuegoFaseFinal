//obtener inputs
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
shoot_key = mouse_check_button(mb_left);
swap_keypressed = mouse_check_button_pressed(mb_right);

//movimiento jugador
#region
     //direccion
	 var _horizKey = right_key - left_key;
	 var _vertKey = down_key - up_key;
	 moveDir = point_direction(0, 0, _horizKey, _vertKey)
	 
	 //x y de y
	 var _spd = 0;
	 var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
	 _inputLevel = clamp( _inputLevel, 0, 1);
	 _spd = moveSpd * _inputLevel;
	 
	 xspd = lengthdir_x( _spd, moveDir);
	 yspd = lengthdir_y( _spd, moveDir);
	 
	 //colisiones
	 if place_meeting(x + xspd, y, o_Wall)
	 {
	     xspd = 0;
	 }
	 if place_meeting(x, y + yspd, o_Wall)
	 {
	     yspd = 0;
	 }
	 
	 if place_meeting(x + xspd, y, o_Wall2)
	 {
	     xspd = 0;
	 }
	 if place_meeting(x, y + yspd, o_Wall2)
	 {
	     yspd = 0;
	 }
	 
	 //mover jugador
	 x += xspd;
	 y += yspd;
	 
	 //profundidad
	 depth = -bbox_bottom;
	 
#endregion

//obtener daño
get_damaged(o_damagePlayer, true);


//sprite control
#region
	//jugador apunta al mouse
		centerY = y + centerYOffset; 
	
	//apuntado
		aimDir = point_direction(x, centerY, mouse_x, mouse_y);
	
	//jugador mirando a la direccion correcta
		face = round(aimDir/90);
		if face == 4 {face = 0; };
	
	//que no se mueva cuando esta quieto
		if xspd == 0 && yspd == 0
		{
			image_index = 0;	
		}


	//establecer el sprite del jugador
		mask_index = sprite[3];
		sprite_index = sprite[face];
#endregion

//cambio de arma
	var _playerWeapons = global.PlayerWeapons;
	
	//recorrer las armas
	if swap_keypressed
	{
		
		//cambiar la seleccion
		selectedWeapon++;
		if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0; };
		
		//establecer arma
		weapon = _playerWeapons[selectedWeapon];
	
	}

//disparar arma
if shootTimer > 0 {shootTimer--;};
if shoot_key && shootTimer <= 0
{
	//resetear contador
	shootTimer = shootCooldown;
	//crear la bala
	var _xOffset = lengthdir_x(weaponLength + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponLength + weaponOffsetDist, aimDir);
	var _bulletInst = instance_create_depth(x, centerY, depth-100, bulletObj);
	
	//cambiar la direccion de la bala
	with (_bulletInst)
	{
		dir = other.aimDir;
	}
		
}


