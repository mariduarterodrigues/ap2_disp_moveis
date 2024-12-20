# Aplicativo Multiuso em Flutter

Este é um aplicativo desenvolvido em **Flutter** que reúne diversas funcionalidades, incluindo ferramentas úteis e jogos interativos. O projeto foi desenvolvido para praticar conceitos fundamentais de Flutter e proporcionar uma experiência divertida para o usuário.

---

## Funcionalidades Principais

### **Tela Principal**
A tela principal oferece três opções principais de funcionalidades:

1. **Escolha do Combustível**  
   Ajuda o usuário a decidir entre abastecer com álcool ou gasolina, considerando os preços informados.  
   > *Funcionalidade semelhante à desenvolvida em sala de aula.*

2. **Frases do Dia**  
   Exibe frases inspiradoras ou motivacionais geradas aleatoriamente ao clicar no botão.

3. **Acesso aos Jogos**  
   Direciona o usuário para uma tela dedicada aos jogos disponíveis.

---

### **Tela de Jogos**
Na tela de jogos, estão disponíveis três opções clássicas para entretenimento:

1. **Jokenpô (Pedra, Papel e Tesoura)**  
   O clássico jogo onde o usuário enfrenta o computador.  
   - Exibe a escolha do usuário e do computador.  
   - Determina e exibe o vencedor ou informa o empate.

2. **Cara ou Coroa**  
   Um jogo simples de adivinhação onde o usuário escolhe entre cara ou coroa.  
   - O resultado é gerado aleatoriamente.  
   - Inclui animação opcional para o lançamento da moeda.

3. **Jogo da Forca**  
   O usuário tenta adivinhar uma palavra letra por letra antes de esgotar suas tentativas.  
   - Palavras selecionadas aleatoriamente em português.  
   - Feedback em tempo real para cada tentativa.  
   - Exibe o resultado final e reinicia automaticamente após vitória ou derrota.

---

## Tecnologias Utilizadas
- **Flutter**: Framework principal para desenvolvimento do aplicativo.  
- **Dart**: Linguagem de programação utilizada no desenvolvimento.  
- **Widgets**: Estruturas base para compor a interface do aplicativo.  
- **Geradores Aleatórios**: Utilizados para sortear frases, palavras e resultados dos jogos.

---

## Como Executar o Projeto

1. Certifique-se de ter o [Flutter](https://flutter.dev/docs/get-started/install) instalado em sua máquina.
2. Clone o repositório:
   ```bash
   git clone https://github.com/mariduarterodrigues/ap2_disp_moveis.git
   ```
3. Acesse o diretório do projeto:
   ```bash
   cd ap2_disp_moveis
   ```
4. Instale dependências:
   ```bash
   flutter pub get
   ```
5. Execute o projeto:
   ```bash
   flutter run
   ```
   
---

## Estrutura do Projeto

- **Tela Principal**: Exibe botões para acessar as funcionalidades principais.
- **Tela de Jogos**: Contém as opções de jogos interativos.
- **Lógica Separada**: Cada funcionalidade/jogo possui sua própria lógica encapsulada.

---

## Autor

Desenvolvido por **Marilia Duarte Rodrigues** (Trabalho feito apenas por uma pessoa).

---
