
event_inherited();

spd = 0;
chaseSpd = 3.5;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

//state machine
state = 0;
	//shooting state
	cooldownTime = 4*60;
	shootTimer = irandom(cooldownTime);
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;
	
