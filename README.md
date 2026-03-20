# product_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Questionário de Reflexão (Atividade 2)
Após concluir a Atividade 2, responda às seguintes perguntas:

Em qual camada foi implementado o mecanismo de cache? Explique por que essa decisão é adequada dentro da arquitetura proposta.
R: O mecanismo de cache foi implementado dentro da pasta de `/datasource`. Sendo que é uma decisão adequada pois é de onde puxamos os dados, e a camada de cache seria mais um local onde pode buscar informações e serem tratadas no repository. 

Por que o ViewModel não deve realizar chamadas HTTP diretamente?
R: Por conta que para a apresentação visual dos dados, eles já devem estar tratados, ou seja, já devem estar em seu formato de entidades. E se você colocasse esse tratamento no ViewModel ele começaria a ter muitas responsabilidades além de apenas auxiliar a interface

O que poderia acontecer se a interface acessasse diretamente o DataSource?
R: A interface poderia gerar loops de envios de informações, gerando um risco de perfomance para o aplicativo. Além disso tem a questão de que ela precisaria tratar os dados que ainda estaria no formato de Model, oque faria ter que implementar funções que estão hoje no Repository dentro das pages.

Como essa arquitetura facilitaria a substituição da API por um banco de dados local?
R: Por conta que os métodos necessários para buscar informações dos repositóries já estão definidos. Então você apenas implementaria um novo datasource, e mudaria o Repository, sem precisar mudar nada além disso.

## Questionário (Atividade 6)
Após concluir a implementação da atividade 05, responda às seguintes questões:

O que significa gerenciamento de estado em uma aplicação Flutter?
R: Gerenciamento de estado é o processo de controlar como os dados da aplicação são armazenados, atualizados e sincronizados com a interface do usuário. Ele garante que a UI reflita sempre o dado mais recente e que diferentes partes do app possam acessar e reagir a mudanças no mesmo conjunto de informações.

Por que manter o estado diretamente dentro dos widgets pode gerar problemas em aplicações maiores?
R: Manter o estado localmente (com setState) em aplicações grandes dificulta o compartilhamento de dados entre widgets distantes na árvore, gerando o "prop drilling" (passar dados por muitos níveis). Além disso, mistura lógica de negócio com UI, tornando o código difícil de testar, manter e escalar.

Qual é o papel do método notifyListeners() na abordagem Provider?
R: O notifyListeners() é responsável por avisar a todos os widgets que estão "escutando" aquele ChangeNotifier que o estado mudou. Isso dispara uma reconstrução (rebuild) apenas nos widgets dependentes, garantindo que a interface se atualize com os novos valores.

Qual é a principal diferença conceitual entre Provider e Riverpod?
R: O Provider é dependente da árvore de widgets do Flutter (baseado em InheritedWidget) e requer o BuildContext para acessar os dados. O Riverpod é uma evolução que funciona de forma independente da árvore de widgets (global e seguro em tempo de compilação), não depende de BuildContext e resolve limitações do Provider, como o acesso a estados fora da UI.

No padrão BLoC, por que a interface não altera diretamente o estado da aplicação?
R: Para manter a separação de responsabilidades. No BLoC, a interface apenas dispara "Eventos". A lógica de como transformar esses eventos em um novo estado fica centralizada no componente BLoC, tornando o fluxo de dados unidirecional, previsível e fácil de testar.

Considere o fluxo do padrão BLoC:
Evento → Bloc → Novo estado → Interface
Qual é a vantagem de organizar o fluxo dessa forma?
R: A principal vantagem é a previsibilidade e a rastreabilidade. Com o fluxo unidirecional, você sabe exatamente qual evento gerou qual mudança de estado. Isso facilita muito o debug, permite testar a lógica de negócio sem depender da interface e evita estados inconsistentes causados por múltiplas fontes de alteração.

Qual estratégia de gerenciamento de estado foi utilizada em sua implementação?
R: Foi utilizada a estratégia Provider com ChangeNotifier.

Durante a implementação, quais foram as principais dificuldades encontradas?
R: Uma das dificuldades foi a transição do modelo de ValueNotifier (que já estava parcialmente implementado) para o ChangeNotifier do Provider, garantindo que a lógica de "toggle" do favorito atualizasse a lista de produtos de forma imutável para que o Provider detectasse a mudança corretamente.
