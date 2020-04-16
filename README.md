# flutter_test_notifications
Projeto para testar o plugin Flutter Local Notification

## TO DO
- [ ] Testar em Android;
  - [x] Verificar possibilidade de colocar ações na notificação;
    - Não foi possível verificar esta possibilidade no plugin teremos que estender a funcionalidade ou encontrar outro plugin
  - [x] Verificar o que acontece o app está fechado e deveria lançar a notificação;
    - O App apresenta a notificação apenas após entrarmos na aplicação
    -  https://medium.com/flutter/executing-dart-in-the-background-with-flutter-plugins-and-geofencing-2b3e40a1a124
    - https://pub.dev/packages/background_fetch
  - [x] Verificar o que acontece quando um telefone está desligado e deveria lançar a notificação;
    - Mesmo comportamento de quando o app está fechado
    - Acredito que aqui poderiamos não nos preocupar com o App desligado
  - [x] Verificar como reproduzir som na notificação (som customizado);
  - [x] Verificar como abrir uma tela do celular na notificação;
  - [x] Testar se quando estamos com otimização de bateria recebemos a notificação
    - Testei com a otimização média no meu celular e foi ok
    - Na otimização máxima ele não mostra o aplicativo para acesso
  - [ ] Testar se quando um Task manager é rodado mata o processo criado?
  - [x] conseguimos saber quando um usuário da dismiss na notificação?
    - Não temos como saber sobre este estado
  - [x] verificar comportamento do timezone no celular quanto as notificações.

- [ ] Testar em aparelhos IOS;
  - [ ] Verificar possibilidade de colocar ações na notificação;
  - [ ] Verificar o que acontece o app está fechado e deveria lançar a notificação;
  - [ ] Verificar o que acontece quando um telefone está desligado e deveria lançar a notificação;
  - [x] Verificar como reproduzir som na notificação (som customizado);
  - [x] Verificar como abrir uma tela do celular na notificação;
  - [ ] Testar se quando estamos com otimização de bateria recebemos a notificação
  - [ ] Testar se quando um Task manager é rodado mata o processo criado?
  - [ ] conseguimos saber quando um usuário da dismiss na notificação?
    - Não temos como saber sobre este estado
  - [ ] verificar comportamento do timezone no celular quanto as notificações.
