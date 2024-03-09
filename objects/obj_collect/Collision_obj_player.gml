global.collect+=value
if ((global.collect)mod(20) == 0) {
	if(other.hp < 5) {
		other.hp++;
		other.getLife = 180
	}
}
instance_destroy();
