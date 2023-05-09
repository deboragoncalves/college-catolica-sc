public abstract class Forma {
    protected String cor = "Vermelho";
    protected boolean preenchido = true;

    public Forma() {
    }
    
    public Forma(String cor, boolean preenchido) {
        this.cor = cor;
        this.preenchido = preenchido;
    }

    public String getCor() {
        return this.cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public boolean isPreenchido() {
        return this.preenchido;
    }

    public void setPreenchido(boolean preenchido) {
        this.preenchido = preenchido;
    }

    // metodos abstratos não são implementados
    public abstract double getArea();

    public abstract double getPerimetro();
    
    public String toString() {
        return "Cor: " + this.cor + ", Preenchido: " + this.preenchido;
    }
}
