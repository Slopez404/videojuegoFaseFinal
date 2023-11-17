
// Inherit the parent event
event_inherited();

dir = 0;
spd = 5;
xspd = 0;
yspd = 0;

//state control
state = 0;
//0 = no se mueve, apunta al jugador y espera a que el enemigo dispare
//1 = disparar hacia el jugador

//clean up
destroy = false;
playerDestroy = true;