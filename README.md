🧪 spring4dteste
Teste simples em Delphi com Spring4D e Firebird 5.0.

📌 Visão Geral
Este projeto demonstra a integração entre Delphi (utilizando o IDE do Delphi 10.x) com a biblioteca Spring4D e o banco de dados Firebird 5.0, através de um exemplo prático que executa operações básicas de CRUD.

📂 Estrutura do Projeto
```graphql

spring4dteste/
├── modules/
│   ├── uDataModule.pas        # Gerencia conexão e acesso a dados
│   ├── uMainForm.pas          # Formulário principal com interface CRUD
├── Model/
│   └── uPessoa.pas            # Entidade Pessoa + ORM com Spring4D
├── spring4dteste.dpr          # Arquivo do projeto Delphi (console ou GUI)
├── spring4dteste.dproj        # Projeto Delphi GUI
├── spring4dteste.res          # Recursos locais (opcional)
├── boss.json / boss-lock.json # Gerenciamento de dependências via Boss
├── .gitignore                 # Define arquivos ignorados
├── coletionpostman.json       # Coleção para testar API REST (opcional)



⚙️ Pré-requisitos
Antes de rodar o projeto, certifique-se de que você tem:

Delphi 10.x ou outra versão compatível.

Firebird 5.0 instalado e em execução localmente.

Banco de dados já criado e com credenciais configuradas.

Boss instalado (para gerenciar dependências), ou adição manual da Spring4D à sua Search Path.

🔧 Instalação e Configuração
Clone o repositório:

```bash

git clone https://github.com/mabreu2022/spring4dteste.git
cd spring4dteste
Instale dependências via Boss:


```bash

boss install
Ajuste a conexão com o banco no uDataModule.pas. Exemplo:



```pascal

FConnection.Params.Clear;
FConnection.Params.Add('Database=localhost:C:\caminho\para\seu.fdb');
FConnection.Params.Add('User=SYSDBA');
FConnection.Params.Add('Password=masterkey');


Abra o projeto no Delphi:


Use spring4dteste.dproj para ambiente visual (GUI).

Ou spring4dteste.dpr para rodar como console, conforme preferência.

🚀 Uso
No formulário principal:

Insira dados de Pessoa como Nome e Idade.

Clique em criar, editar, buscar ou excluir.

O DataModule interage com o Firebird via Spring4D.

Caso tenha API REST (a coleção Postman está incluída):

Importe coletionpostman.json no seu Postman para testar endpoints CRUD.

🧱 Tecnologias Usadas
Delphi – Desenvolvimento principal.

Spring4D – Injeção de dependência, ORM leve, repositórios.

Firebird 5.0 – Banco de dados relacional rápido e livre.

Boss – Gerenciador de pacotes Delphi.

Postman – (Opcional) para testar API endpoints HTTP.

✅ Pontos de Aprendizado
Configuração de conexão Firebird em Delphi.

Uso de padrão repositório e injeção de dependência via Spring4D.

Operações CRUD usando Spring4D + FireDAC ou IBX.

Fluxo básico de dados e event handling em formulários.

🛠️ Personalização
Adapte o módulo de dados para outro provedor (MySQL, PostgreSQL).

Adicione logging com Spring.Logging.

Evolua para uma API REST utilizando datasnap, mORMot ou WebBroker.

Crie testes unitários para camada de modelo e repositório.

📄 Licença
Compartilhado sob a licença MIT (sugestão).

🤝 Contribuição
Pull requests são bem-vindos! Se encontrar bugs ou precisar de mudanças, abra uma issue e discutimos.

✅ Exemplo de uso

```pascal

var
  repo: IRepository<TPessoa>;
  pes: TPessoa;
begin
  repo := GlobalContainer.Resolve<IRepository<TPessoa>>;
  pes := TPessoa.Create;
  try
    pes.Nome := 'João';
    pes.Idade := 30;
    repo.Add(pes);       // Insere no Firebird
    repo.UnitOfWork.Commit;
  finally
    pes.Free;
  end;
end;


Desenvolvido por @mabreu2022 em 2025.
