# SwiftUI-MVVM
Projeto para fins de estudos de SWIFTUI

Descrição
---------
Este repositório apresenta o padrão de design "Model-View-ViewModel" ou "MVVM”,  realizando requisições HTTP para api do [github][0]

Features
--------
A aplicação tem como principais recursos:
  * Procurar usuários no github
  * Listar os usuários filtrados
  * Exibir os repositórios do usuário selecionado
  * Exibir a página web do repositório selecionado

Screenshots
--------
<table>
 <tr>
  
  <td>
  <img src="https://github.com/dduardo/SwiftUI-MVVM/blob/master/SwiftUI-MVVM/Images/GitUser-ListUsers.png" width="200">
  </td>
  
  <td>
   <img src="https://github.com/dduardo/SwiftUI-MVVM/blob/master/SwiftUI-MVVM/Images/GitUser-ListUser.png" width="200">
  </td>
  
  <td>
   <img src="https://github.com/dduardo/SwiftUI-MVVM/blob/master/SwiftUI-MVVM/Images/GitUser-Repo.png" width="200">
  </td>
  
  <td>
   <img src="https://github.com/dduardo/SwiftUI-MVVM/blob/master/SwiftUI-MVVM/Images/GitUser-WebView.png" width="200">
  </td>
  
 </tr>
</table>


## Bibliotecas utilizadas

  * [Alamofire][1], para realizar requisições HTTP

## Requirements

Xcode 11.0 Beta 5+

## Before Build

Antest de executar o projeto, execute `pod install`  

## Próximas features

  * Melhorar o tratamento de error genérico de requisição HTTP;  
  * Criar um mecanismo de paginação de resultados (Pull Refresh);
  * Adicionar lib para testes de UI.
  * Refatorar a UI, adicionando mais componentes.
  * Autenticação de usuários, para que haja um melhor controle de requisições ao backend;
  
  [0]: https://developer.github.com/v3/
  [1]: https://github.com/Alamofire/Alamofire
