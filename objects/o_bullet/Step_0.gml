//movimiento
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	

//limpiar

	//hit confirm destroy
	if hitConfirm == true && enemyDestroy == true {destroy = true;};
	
	//destruir
	if destroy == true
	{
		//vfx
		instance_destroy();
	}
	
	//colision de la bala 
	if place_meeting(x, y, o_Wall)
	{
		destroy = true;
	}
	
	if place_meeting(x, y, o_Wall2)
	{
		destroy = true;
	}
	if place_meeting(x + xspd, y, o_Wall)
	 {
	    destroy = true;
	 }
	 if place_meeting(x, y + yspd, o_Wall)
	 {
	    destroy = true;
	 }
	 
	 if place_meeting(x + xspd, y, o_Wall2)
	 {
	     destroy = true;
	 }
	 if place_meeting(x, y + yspd, o_Wall2)
	 {
	     destroy = true;
	 }
	
	//balas fuera de rango
	if point_distance(xstart, ystart, x, y) > maxDist
	{
		destroy = true;
	}
	


