processos = [];
opcaoMenu = "";
nomeProcesso = "";

def inserir_processo(processo):
    processos.append(processo);
    exibir_menu();

def executar_processo():
    processos.clear();
    
    print("Pilha de Processos está vazia.");
    print(processos);
    exibir_menu();

def listar_processo():
    if (len(processos) == 0): 
        print("Pilha de Processos está vazia.");
        exibir_menu();
        return;

    listaProcessos = ", ".join(processos);
    print("Pilha de Processos: " + listaProcessos);
    exibir_menu();

def exibir_menu():
    print("");
    print("Digite as opcoes do menu:");
    print("1 - para inserir um processo");
    print("2 - para remover todos os processos da pilha");
    print("3 - para exibir todos os processos da pilha");
    print("4 - para sair");

    print("");
    opcaoMenu = input();
    print("");

    if opcaoMenu == "1":
        nomeProcesso = input("Informe o processo a ser inserido: ");
        if nomeProcesso != "":
            inserir_processo(nomeProcesso);
        else:
            print("Processo inválido. Tente novamente.");

    elif opcaoMenu == "2":
        executar_processo();
    elif opcaoMenu == "3":
        listar_processo();
    elif opcaoMenu == "4":
        print("Encerrando Menu.");
    else:
        print("Opção inválida. Tente novamente.");

exibir_menu();