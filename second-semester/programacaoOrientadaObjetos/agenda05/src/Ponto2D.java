public class Ponto2D {
    private float x;
    private float y;

    // construtor vazio e com parametros
    public Ponto2D(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public Ponto2D() {
    }
    
    // getter e settet para X e Y
    public final float getX() {
        return this.x;
    }

    public final void setX(float x) {
        this.x = x;
    }

    public final float getY() {
        return this.y;
    }

    public final void setY(float y) {
        this.y = y;
    }

    // setter X e Y
    public final void setXY(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public final float[] getXY() {
        float[] listaXY = new float[2];
        listaXY[0] = this.x;
        listaXY[1] = this.y;
        return listaXY;
    }
}
