//state machine
switch (state)
{
	
	//esperar a que el enemigo dispare
	case 0:
	
		//apuntar al jugador
		if instance_exists(o_Player)
		{
			dir = point_direction(x, y, o_Player.x, o_Player.centerY);
		}
		
		//depth para hacerse más visible
		depth = -y - 50;
							
	break;
	
	//disparar / viajar
	case 1:
	
		//movimiento
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
		//depth actualizado
		depth = -y;
		
	break;







}

//clean up

	//fuera de los limites de la sala
	var _pad = 16;
	if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height +_pad
	{
		destroy = true;	
	}
	
	//colisión con el jugador
	if hitConfirm == true && playerDestroy == true {destroy = true;};

	//autodestrucción
	if destroy == true {instance_destroy();};
	
	//colision con la pared y jugador
	if place_meeting(x, y, o_Wall) {destroy = true;};
	if place_meeting(x, y, o_Wall2) {destroy = true;};
	if place_meeting(x, y, o_Player) {destroy = true;};




