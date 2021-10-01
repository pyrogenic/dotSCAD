/**
* hull_polyline3d.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib3x-hull_polyline3d.html
*
**/

module hull_polyline3d(points, diameter = 1) {
    radius = diameter / 2;
    leng = len(points);
    
    module hull_line3d(index) {
        point1 = points[index - 1];
        point2 = points[index];

        hull() {
            translate(point1) 
                children();
            translate(point2) 
                children();
        }

        // hook for testing
        test_hull_polyline3d_line_segment(index, point1, point2, radius);        
    }

    if($children == 0) {
        for(i = [1:leng - 1]) {
            hull_line3d(i)
                sphere(radius);
        }
    }
    else if($children == 1) {
        for(i = [1:leng - 1]) {
            hull_line3d(i)
                children();
        }
    }
    else {
        for(i = [1:leng - 1]) {
            hull_line3d(i)
                children(i);
        }
    }
}

// override it to test
module test_hull_polyline3d_line_segment(index, point1, point2, radius) {

}