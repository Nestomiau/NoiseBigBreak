global.collect+=other.value
if (global.collect>=global.collectHigh) {
	if(hp<5) {
		hp++
		getLife=180
		collectHigh+=20
	}
}
instance_destroy(other)
