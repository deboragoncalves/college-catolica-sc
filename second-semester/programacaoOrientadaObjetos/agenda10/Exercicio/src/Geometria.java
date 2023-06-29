public abstract class Geometria {
    private int numLados;

    public Geometria(int numLados) {
        this.numLados = numLados;
    }

    public int getNumLados() {
        return this.numLados;
    }

    public abstract double getArea();
    public abstract double getPerimetro();
    
}
