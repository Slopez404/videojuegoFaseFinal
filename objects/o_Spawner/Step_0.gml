//spawn enemigo
timer++;

if timer >= spawnTime
{
	//crear enemigo
	instance_create_depth(x, y, depth-1, o_monster);
	
	//reinicar contador
	timer = 0;
}




