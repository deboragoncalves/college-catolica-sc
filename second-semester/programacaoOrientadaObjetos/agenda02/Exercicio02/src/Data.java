public class Data {
    int dia;
    int mes;
    int ano;

    String mostraData() {
        String stringDia = String.valueOf(dia);

        if (dia < 10) {
            stringDia = "0" + stringDia;
        }

        String stringMes = String.valueOf(mes);

        if (mes < 10) {
            stringMes = "0" + stringMes;
        }

        String dataFormatada = stringDia + "/"
                + stringMes
                + "/"
                + ano;

        return dataFormatada;
    }
}
