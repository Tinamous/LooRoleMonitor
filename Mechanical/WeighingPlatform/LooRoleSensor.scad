// Overall size
height = 2;
outerDiameter = 61; // 122 mm
innerCutoutDiameter = 18; // 36mm
$fn = 20;

module LooRoleBase() {
 
	difference() {
		union() 
		{
			cylinder(height,outerDiameter,outerDiameter,true);
		}	
		
		union() 
		{
			cylinder(height+1,innerCutoutDiameter,innerCutoutDiameter,true);
		}
	}
}

// Leave a small hole in one of the pads so that
// a mark can be made on the base to locate where the 
// sensor should be placed.
module AddSensorLocationHole() {
	translate([0,-50,2])  {
		cylinder(10,1,1,true);
	}
}

module AddPad(x, y, height) {
 translate([x,y,2])  {
	cylinder(height,11,11,true);
 }
}

module AddPads() {

		union() 
		{
			AddPad(50,0,2);
			AddPad(-50,0,2);
			AddPad(0,50,2);
			AddPad(0,-50,2);
		}	
}

module AddPin(x, y) {
 translate([x,y,5])  {
	cylinder(10,2,2,true);
 }
}

// Extend 2 of the pads with small pins to allow the 
// plate to be located without spinning
// whist also allowing it to be rotated 180°
// So that the sensor location hold can be placed
// off the sensor once located.
module AddPins() {
		union() 
		{
			AddPin(50,0);
			AddPin(-50,0);
		}	
}

module BuildTop() {

	difference() {
		union() {
			LooRoleBase();
			AddPads();
			AddPins();
		}
		union() {
			AddSensorLocationHole();
		}
	}
}

BuildTop();