public class TestaPontos {
    public static void main(String[] args) {
        Ponto2D p2d = new Ponto2D();
        p2d.setX(1.5f);
        p2d.setY(2.3f);
        
        float[] xy = p2d.getXY();
        System.out.printf("Coordenadas de p2d: x: %.1f, y: %.1f\n", xy[0], xy[1]);
        
        Ponto3D p3d = new Ponto3D(3.0f, 5.1f, 2.1f);
        p3d.setZ(4.0f);
        float[] xyz = p3d.getXYZ();
        System.out.printf("Coordenadas de p3d: x: %.1f, y: %.1f, z: %.1f\n", xyz[0], xyz[1], xyz[2]);
    }
}
