//coordenadas de la camara
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

//dibujo del hp del jugador
var _border = 8;
draw_sprite(sHealthBar, 0, _camX + _border, _camY + _border);

for(var i = 0; i < playerMaxHp; i++)
{
	//mostrar hp momentaneo
	var _img = 1;
	if i+1 <= playerHp {_img = 2;};
	
	var _sep = 13;
	draw_sprite(sHealthBar, _img, _camX + _border + _sep*i, _camY + _border);
}


