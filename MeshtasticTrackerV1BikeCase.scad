thickness = 1.5;

$fn = 200;

module top () {
    difference() {
        translate([0, -20, 0])
            cube([65+(thickness*2), 20+28+(thickness*2), 10+thickness]);
        
        translate([0, -20, 0])
        translate([thickness, thickness, thickness])
            cube([65, 20+28, 12+thickness]);
        
        // Cutout for OLED
        translate([30+thickness, 8+thickness, -0.1])
            cube([23, 12, thickness+0.2]);
        
        // Partial depth cutour for GPS antenna
        translate([1+thickness, 4-0.5+thickness, thickness-0.8])
            cube([21, 21, 0.9]);
        
        // Cutout for USB-C connector
        translate([65+thickness-0.1, 9+thickness, 1.3+thickness])
            rotate([0, 90, 0])
            translate([-2, 1, 0])
            minkowski () {
                cube([4-2, 10-2, 3]);
                cylinder(4, 1, 1);
            }
            
        // SMA connector
        translate([59+thickness, -20-0.1, 5+thickness])
            rotate([-90, -90, 0])
            cylinder(thickness+0.2, 3.2, 3.2);
    }
    
    // Board / Battery separator
    translate([0, 0, thickness])
    cube([55, thickness, 10]);
}

module bottom () {
    //Lid 
    translate([0, -20, 10+thickness])
        cube([65+(thickness*2), 20+28+(thickness*2), thickness]);
    
    // Board pushers
    translate([thickness+0.1, -20+thickness+0.1, 5.2+thickness])
    cube([55-thickness+0.1, thickness, 4.8+thickness]);
    translate([thickness+0.1, thickness+0.1, 5.2+thickness])
    cube([55-thickness-0.1, thickness, 4.8+thickness]);
    translate([thickness+0.1, 28-0.1, 5.2+thickness])
    cube([68-(thickness*2)-0.2, thickness, 4.8+thickness]);
}

top();
//bottom();
