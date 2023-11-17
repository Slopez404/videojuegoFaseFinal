//deshacerse de la bala si no se ha disparado
if instance_exists(bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;	
}



