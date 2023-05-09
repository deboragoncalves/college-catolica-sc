import java.lang.reflect.Array;
import java.util.Arrays;

public class DadosDeTempoSemanais {

    public static void main(String[] args) throws Exception {
    }

    static int NUMDIAS = 7;

    double[] qtdChuva= new double[NUMDIAS];
    double[] pressaoMedia = new double[NUMDIAS];
    double chuvaMedia;
    double chuvaMaxima;

    void setDados(double[] chuva, double[] pressao) {
        qtdChuva = chuva;
        pressaoMedia = pressao;
    }

    void calculaEstatisticas() {
        chuvaMaxima = 0.0;
        double somaChuva = 0.0;

        // ordenando array para pegar valor máximo
        Arrays.sort(qtdChuva);
        
        // corringindo index - começando do 0 até o tamanho da lista
        for (int i = 0; i < qtdChuva.length; i++) {
            //System.out.println("Index: " + i);
            //System.out.println("Quantidade de chuva: " + qtdChuva[i]);

            // retirando if, se não os valores não ficam corretos
            // if (qtdChuva[i] >= chuvaMaxima) {}

            chuvaMaxima = qtdChuva[qtdChuva.length - 1];
            somaChuva += qtdChuva[i];
            // System.out.println("Soma: " + somaChuva);
        }

        // TODO definir o valor de chuvaMedia
        chuvaMedia = somaChuva / qtdChuva.length;
        setChuvaMedia(chuvaMedia);
    }

    double getChuvaMedia() {
        return chuvaMedia;
    }

    // set chuva media
    void setChuvaMedia(double chuvaMedia) {
        this.chuvaMedia = chuvaMedia;
    }

    double getChuvaMaxima() {
        return chuvaMaxima;
    }

    // set chuva maxima
    void setChuvaMaxima(double chuvaMaxima) {
        this.chuvaMaxima = chuvaMaxima; 
    }
}