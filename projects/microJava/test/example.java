class MyModule {

public static class Object3D {
	Point point;
	int height;
	int width;
	Object3D neighbor;
	
	public Object3D implode (Object3D r) {
		this.point.x = this.neighbor.point.x - 10;
		this.point.y = -1000;
		this.point.z = -1000;
		this.height = 0;
		this.width = 0;
	}
	public Object3D move (int s) {
		this.point.x = this.point.x * s;
		this.point.y = this.point.y * s;
		this.point.z = this.point.z * s;
		return this;
	}
	public Object3D copy3D () {
		Object3D res;
		res.point.x = this.point.x;
		res.point.y = this.point.y;
		res.point.z = this.point.z;
		return res;
	}
}

public static class Point {
	Object3D object3d;
	int x;
	int y;
	int z;
	
}

}
