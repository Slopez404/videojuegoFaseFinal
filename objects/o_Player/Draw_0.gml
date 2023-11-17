//dibujar arma detras del jugador
if aimDir >= 0 && aimDir < 180
{
	draw_my_weapon();
}

//dibujar al jugador
	draw_self();

//dibujar el arma
if aimDir >= 180 && aimDir < 360
{
	draw_my_weapon();
}

