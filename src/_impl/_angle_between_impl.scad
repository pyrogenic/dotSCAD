function angle_between_ccw_2d(v1, v2) = 
    let(a = atan2(v1.x * v2.y - v1.y * v2.x, v1 * v2))
	a >= 0 ? a : a + 360;

function angle_between_ccw_3d(v1, v2) = 
    let(a = acos(v1 * v2 / sqrt((v1 * v1) * (v2 * v2))))
	a >= 0 ? a : a + 360;