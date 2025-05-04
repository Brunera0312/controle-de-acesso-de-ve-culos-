algoritmo "ControleDeAcessoVeiculos"
var
  maxVeiculos, veiculosCadastrados : inteiro
  placas : vetor[1..30] de caractere
  dataEntrada, dataSaida : vetor[1..30] de registro // Corrigido: registro ao invés de estrutura
  tempoPermanencia : vetor[1..30] de caractere
  placa, entradaData, entradaHora, saidaData, saidaHora : caractere
  opcao : inteiro

registro DataHora // Estrutura para representar datas e horas
    dia : inteiro
    mes : inteiro
    ano : inteiro
    hora : inteiro
    minuto : inteiro
fimregistro

// Função para calcular o tempo de permanência
funcao CalcularTempoPermanencia(entrada, saida: DataHora): caractere
var
  minutosEntrada, minutosSaida, totalMinutos, horas, minutos : inteiro
  resultado : caractere
inicio
  minutosEntrada := (entrada.dia * 24 * 60) + (entrada.hora * 60) + entrada.minuto
  minutosSaida := (saida.dia * 24 * 60) + (saida.hora * 60) + saida.minuto
  totalMinutos := minutosSaida - minutosEntrada
  horas := totalMinutos div 60
  minutos := totalMinutos mod 60
  resultado := horas + " horas e " + minutos + " minutos"
  retorne resultado
fimfuncao

inicio
  // Inicialização das variáveis
  maxVeiculos := 30
  veiculosCadastrados := 0

  // Laço principal
  repita
    // Exibição do menu
    escreval("Sistema de Controle de Acesso de Veículos")
    escreval("1 - Registrar Entrada")
    escreval("2 - Registrar Saída")
    escreval("3 - Exibir Todos")
    escreval("0 - Sair")
    escreva("Escolha uma opção: ")
    leia(opcao)

    // Verificação da opção escolhida
    escolha opcao
      caso 1:
        // Registro de entrada
        se veiculosCadastrados < maxVeiculos entao
          escreva("Digite a placa do veículo (3 letras e 4 números): ")
          leia(placa)
          placas[veiculosCadastrados + 1] := placa

          escreva("Digite a data de entrada (dd/mm/aaaa): ")
          leia(entradaData)
          leia(dataEntrada[veiculosCadastrados + 1].dia, "/", dataEntrada[veiculosCadastrados + 1].mes, "/", dataEntrada[veiculosCadastrados + 1].ano)

          escreva("Digite a hora de entrada (hh:mm): ")
          leia(entradaHora)
          leia(dataEntrada[veiculosCadastrados + 1].hora, ":", dataEntrada[veiculosCadastrados + 1].minuto)

          veiculosCadastrados := veiculosCadastrados + 1
          escreval("Entrada registrada com sucesso!")
        senao
          escreva("Limite de veículos cadastrados atingido!")
        fimse
      caso 2:
        // Registro de saída e cálculo do tempo de permanência
        escreva("Digite a placa do veículo: ")
        leia(placa)
        para i de 1 ate veiculosCadastrados faca
          se placas[i] = placa entao
            escreva("Digite a data de saída (dd/mm/aaaa): ")
            leia(saidaData)
            leia(dataSaida[i].dia, "/", dataSaida[i].mes, "/", dataSaida[i].ano)

            escreva("Digite a hora de saída (hh:mm): ")
            leia(saidaHora)
            leia(dataSaida[i].hora, ":", dataSaida[i].minuto)

            tempoPermanencia[i] := CalcularTempoPermanencia(dataEntrada[i], dataSaida[i])
            escreval("Saída registrada com sucesso!")
          fimse
        fimpara
      caso 3:
        // Exibir todos os veículos cadastrados
        se veiculosCadastrados > 0 entao
          escreval("Veículos Cadastrados:")
          para i de 1 ate veiculosCadastrados faca
            escreva("Placa: ", placas[i])
            escreva("Data de entrada: ", dataEntrada[i].dia, "/", dataEntrada[i].mes, "/", dataEntrada[i].ano)
            escreva("Hora de entrada: ", dataEntrada[i].hora, ":", dataEntrada[i].minuto)
            escreva("Data de saída: ", dataSaida[i].dia, "/", dataSaida[i].mes, "/", dataSaida[i].ano)
            escreva("Hora de saída: ", dataSaida[i].hora, ":", dataSaida[i].minuto)
            escreva("Tempo de permanência: ", tempoPermanencia[i])
            escreval("----------------------")
          fimpara
        senao
          escreval("Não há veículos cadastrados.")
        fimse
      caso 0:
        escreval("Saindo do sistema...")
      outroCaso:
        escreval("Opção inválida!")
    fimescolha
  ate opcao = 0
fimAlgoritmo