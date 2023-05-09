/**
 * Testa a classe DadosDeTempoSemanais
 *
 */
public class TestaDadosDeTempoSemanais {
   public static void main(String[] args) {
    double[] chuva = 
           { 5.34, 2.34, 0.0, 0.0, 3.23, 0.0, 2.42 };
    double[] pressao = 
            { 99.3, 95.34, 101.3, 98.42, 103.4, 100.0, 102.87 };

    DadosDeTempoSemanais dts = new DadosDeTempoSemanais();
    dts.setDados(chuva, pressao);
    dts.calculaEstatisticas();

    // deve imprimir 5.35
    System.out.println("Valor maxima da chuva: " + dts.getChuvaMaxima());

    // deve imprimir ~ 1.904
    System.out.println("Valor medio da chuva: " + dts.getChuvaMedia());
   }
}