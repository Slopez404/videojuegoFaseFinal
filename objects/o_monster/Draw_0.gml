//draw self

draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);

//hp
var _healthPercent = hp / maxHp;
var _hpImage = _healthPercent* (sprite_get_number(s_EnemyHealth) -1);
draw_sprite(s_EnemyHealth, _hpImage, x, y - sprite_height - 1);

//draw_text(x, y, string(hp) ); 