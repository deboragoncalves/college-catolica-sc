public class Ponto3D extends Ponto2D {
    private float z;

    public Ponto3D() {
    }

    // construtor com super
    public Ponto3D(float x, float y, float z) {
        super(x, y);
        this.z = z;
    }

    // getter e setter z
    public final float getZ() {
        return this.z;
    }

    public final void setZ(float z) {
        this.z = z;
    }

    public final void setXYZ(float x, float y, float z) {
        setX(x);
        setY(y);
        setZ(z);
    }

    public final float[] getXYZ() {
        float[] listaXYZ = new float[3];
        listaXYZ[0] = getX();
        listaXYZ[1] = getY();
        listaXYZ[2] = getZ();
        return listaXYZ;
    }
}
