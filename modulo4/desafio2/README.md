## Bootcamp Geração Tech Unimed-BH - Ciência de Dados



# **Modulo 4** - Imersão Cloud Computer





## Links Úteis

[Site da Dio](https://dio.me/)

[Sintaxe Básica Markdown](https://www.markdownguide.org/basic-syntax/)

[Download do git](https://git-scm.com/downloads)



## Tecnologias utilizadas nos projetos

<div style="display: inline_block">
<img align="center" alt="git" height="70" width="60" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original-wordmark.svg"/>
<img align="center" alt="GitHub" height="70" width="60" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original-wordmark.svg" />
<img align="center" alt="Python" height="120" width="90" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" />


## Desafio

**Explorando Dados Demográficos com Serviços de Big Data na AWS**

```
Objetivo:

Explorar o poder do SQL em uma ferramenta de BigData totalmente gerenciada na AWS, o Amazon Athena. Para isso, o expert apresenta na prática esse serviço de consultas interativas que facilita a análise de dados no Amazon S3 usando SQL padrão.

```



# Amazon Athena



### Serviços utilizados nessa atividade prática

 - Amazon S3
 - Amazon Glue
 - Amazon Athena
 - Amazon QuickSight

### Etapas para desenvolvimento

### Criar bucket no Amazon S3

- Amazon S3 Console -> Buckets -> Create bucket -> Bucket name [nome_do bucket] - Create bucket
- Create folder (Criar uma pasta chamada ```/output``` e outra com o nome do seu conjunto de dados. Este nome irá definir o nome da tabela criada no Glue)
- Upload dos arquivos de dados localizados na pasta ```/data```

#### Criar Glue Crawler

- Amazon Glue Console -> Crawlers -> Add Crawler
- Source type [Data Stores] -> Crawl all folders
- Data store [S3] -> Include path [caminho do diretório dos dados de entrada]
- Create IAM Role
- Frequency [Run on demand]
- Database name [seu_nome_de_db]
- Group behavior [Create a single schema for each S3 path]
- Finish
- Databases -> Tables -> Visualizar dados das tabelas criadas

### Criar aplicação no Amazon Athena

- Query editor -> Settings -> Manage settings -> Query result location and encryption -> Browse S3 -> selecionar o bucket criado
- Selecionar Database -> criar queries (exemplos na pasta ```/src```)
- Verificar queries não salvas no bucket criado no S3
- Salvar queries -> Executar novamente -> Verificar no bucket criado no S3

#### Criando nova tabela

- Generate table DDL
- Copiar a query gerada
- Selecionar o DB e criar a nova tabela em uma nova query

### Visualizar dados no Amazon QuickSight

- Signup (caso não tenha conta) -> Escolher [Standard]
- Datasets -> Create new dataset -> Athena -> Name [NomeDoDataSet] -> Create
- Select database -> select table -> Edit or preview -> Save & visualize
- Criar visualizações selecionando colunas, criando filtros e parâmetros e selecionando Visual types para gráficos.

### Eliminar recursos

 - Excluir os elementos criados
