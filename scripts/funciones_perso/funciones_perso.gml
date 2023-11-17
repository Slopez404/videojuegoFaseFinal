//dibujando el arma
function draw_my_weapon()
{
	//dibujar el arma
	//sacar arma del cuerpo del jugador
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
	//voltear arma
	var _weaponYsc1 = 1;
	if aimDir > 90 && aimDir < 270
	{
		_weaponYsc1 = -1;
	}

	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYsc1, aimDir, c_white, 1);	
}

//calculo de daño
	//evento de creacion de daño
	function get_damage_create(_hp = 10, _iframes = false)
	{
		maxHp = _hp;
		hp = _hp;
		
		//obtener los iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}

		//crear la lista de daño
		if _iframes == false
		{
			damageList = ds_list_create();
		}

	}
	
	//evento de limpiar daño
	function get_damage_cleanup()
	{
		//no se necesita si se usan iframes
		//quitar la estructura de la lista de año para ahorrar mamoria
		ds_list_destroy(damageList);
	}
	
	
	//evento de daño
	function get_damaged( _damageObj, _iframes = false)
	{
		
		//salida especial al contador de iframe
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			
			if iframeTimer / 5 == 0
			{
				if image_alpha == 1
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
			}
			
			//clamp 
			hp = clamp(hp, 0, maxHp);
			
			exit;
		}
		
		//parpadeo del iframe se detenga
		if _iframes == true
		{
			image_alpha = 1;
		}
		
	//daño recibido
		if place_meeting(x, y, _damageObj)
		{
			
	//lista de las instanicas de daño
			//creacion de la lista ds y copia de instancias en ella
			var _instList = ds_list_create();
	
			instance_place_list(x, y, _damageObj, _instList, false);
	
			//obtener tamaño de la lista
			var _listSize = ds_list_size(_instList);
			
			//loop a través de la lista
			var _hitConfirm = false;
			for (var i = 0; i < _listSize; i++)
			{
				//daño de objeto de la lista
				var _inst = ds_list_find_value(_instList, i);
				
				//comprobar que la instancia está en la lista de daño
				if _iframes == true || ds_list_find_index(damageList, _inst) == -1
				{
					//añadir la nueva instancia de daño a la la lista de daño
					if _iframes == false
					{
						ds_list_add(damageList, _inst);
					}
					
					//tomar daño de una instancia específica
					hp -= _inst.damage;
					_hitConfirm = true;
					//la instancia de daño ha sido impactada
					_inst.hitConfirm = true;
				}
			}
			//poner iframes si el jugador es golpeado
			if _iframes == true && _hitConfirm
			{
				iframeTimer = iframeNumber;	
			}
	
	
	
			//memoria libre por destruir la lista ds
			ds_list_destroy(_instList);
			
}



	//limpiar la lista de daño a objetos que no existen más o que no son tocados más
	if _iframes == false
	{
		var _damageListSize = ds_list_size(damageList);
		for (var i = 0; i < _damageListSize; i++)
		{
			//si no se toca la instancia de daño más, quitarla de la lista y poner el loop en la posición 1
			var _inst = ds_list_find_value(damageList, i);
			if !instance_exists(_inst) || !place_meeting(x, y, _inst)
			{
				ds_list_delete(damageList, i);
				i--;
				_damageListSize--;
			}
			}
		}
	
 
//muerte
if hp <= 0
	{
	
	instance_destroy();

	}
		//clamp 
		hp = clamp(hp, 0, maxHp);
	}