use <_impl/_geom_platonic_polyhedra.scad>;

function geom_dodecahedron(radius, detail = 0) =
    let(
        t = (1 + sqrt(5)) / 2,
		r = 1 / t,
        dodecahedron_points = [
			// (±1, ±1, ±1)
			[-1, -1, -1], [-1, -1, 1],
			[-1, 1, -1], [-1, 1, 1],
			[1, -1, -1], [1, -1, 1],
			[1, 1, -1], [1, 1, 1],

			// (0, ±1/φ, ±φ)
			[0, -r, -t], [0, -r, t],
			[0, r, -t], [0, r, t],

			// (±1/φ, ±φ, 0)
			[-r, -t, 0], [-r, t, 0],
			[r, -t, 0], [r, t, 0],

			// (±φ, 0, ±1/φ)
			[-t, 0, -r], [t, 0, -r],
			[-t, 0, r], [t, 0, r]
		],
        dodecahedron_faces = [
			[7, 11, 3], [15, 7, 3], [13, 15, 3], 
			[17, 19, 7], [6, 17, 7], [15, 6, 7], 
			[8, 4, 17], [10, 8, 17], [6, 10, 17], 
			[16, 0, 8], [2, 16, 8], [10, 2, 8], 
			[1, 12, 0], [18, 1, 0], [16, 18, 0], 
			[2, 10, 6], [13, 2, 6], [15, 13, 6], 
			[18, 16, 2], [3, 18, 2], [13, 3, 2], 
			[9, 1, 18], [11, 9, 18], [3, 11, 18], 
			[12, 14, 4], [0, 12, 4], [8, 0, 4],
			[5, 9, 11], [19, 5, 11], [7, 19, 11], 
			[14, 5, 19], [4, 14, 19], [17, 4, 19], 
			[14, 12, 1], [5, 14, 1], [9, 5, 1]
		]
    )
	_subdivide_project(dodecahedron_points, dodecahedron_faces, radius, detail);