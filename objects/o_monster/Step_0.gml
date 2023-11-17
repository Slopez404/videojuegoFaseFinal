


//state machine
switch(state)
{
	//chase state
	
		case 0:
		//perseguir al jugador
		if instance_exists(o_Player)
		{	
			dir = point_direction(x, y, o_Player.x, o_Player.y);
		}
		
		//velocidad correcta
		spd = chaseSpd;
		
		//transición al disparo
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		//solo añadir al contador si esta sobre la pantalla
		if bbox_right >_camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		
		if shootTimer > cooldownTime
		{
			//ir a disparo
			state = 1;
			
			//reiniciar contador para que el disparo lo pueda usar también
			shootTimer = 0;
		}
		
		break;
		
	//estado de pausa y disparo
		case 1:
		#region
		
		//perseguir al jugador
		if instance_exists(o_Player)
		{	
			dir = point_direction(x, y, o_Player.x, o_Player.y);
		}
		
		//velocidad correcta
		spd = 0;
		
		//detener animación / poner image index manualmente
		image_index = 0;
		
		//disparar una bala
		shootTimer++;
		
		//crear la bala
		if shootTimer == 1
		{
			bulletInst = instance_create_depth(x, y, depth, o_EnemyBullet);
		}
		
		//disparar la bala despues que windup haya terminado
		if shootTimer == windupTime && instance_exists(bulletInst)
		{
			//balas a movimiento
			bulletInst.state = 1;
		}
		
		//recuperar y volver a perseguir al jugador
		if shootTimer > windupTime + recoverTime
		{
			//volver a perseguir al jugador
			state = 0;
			
			//reiniciar el contador para usarlo de nuevo
			shootTimer = 0;
		}
		#endregion
		break;
}


//perseguir al jugador
	
//velocidad
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
	
//enemigo mira al jugador
	if dir > 90 && dir < 270
	{
		face =-1;
	} else {
		face = 1;
	}
	
	//colision
	if place_meeting(x + xspd, y, o_Wall) || place_meeting(x + xspd, y, o_enemyParent)
	 {
	     xspd = 0;
	 }
	 if place_meeting(x, y + yspd, o_Wall)  || place_meeting(x + xspd, y, o_enemyParent)
	 {
	     yspd = 0;
	 }
	 
	 if place_meeting(x + xspd, y, o_Wall2)  || place_meeting(x + xspd, y, o_enemyParent)
	 {
	     xspd = 0;
	 }
	 if place_meeting(x, y + yspd, o_Wall2)  || place_meeting(x + xspd, y, o_enemyParent)
	 {
	     yspd = 0;
	 }

	//movimiento
		x += xspd;
		y += yspd;
	
	//depth
		depth = -y;

	//recibir daño
	event_inherited();

