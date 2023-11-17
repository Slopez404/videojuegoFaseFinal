//configurar camara
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//centrar en el jugador
if instance_exists(o_Player)
{
	x= o_Player.x - _camW/2;
	y = o_Player.centerY - _camH/2;
}

//camara hasta los bordes del mapa
x = clamp(x, 0, room_width - _camW);
y = clamp(y, 0, room_height - _camH);

//establecer posicion de la camara
camera_set_view_pos(view_camera[0], x, y );

