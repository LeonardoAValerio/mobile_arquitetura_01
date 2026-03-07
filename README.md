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