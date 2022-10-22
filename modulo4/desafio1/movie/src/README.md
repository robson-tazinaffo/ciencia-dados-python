# dio-live-dynamodb
Repositório para o live coding do dia 30/09/2021 sobre o Amazon DynamoDB

### Serviço utilizado
  - Amazon DynamoDB

    

  - Amazon CLI para execução em linha de comando

### Comandos para execução do experimento:

- Fazendo o download do AWS Command Line Interfaces.

   [AWS Command Line Interface download](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- Configurando a conexão com o DynamoDB da AWS via Amazon CLI

   ```
   $ aws configure
   AWS Access Key ID [****************0102]: ABCDEFGHIJKLMNOPQRS
   AWS Secret Access Key [****************DgI$]: KKKKKKKKKKKK/89uuWSHKBKBSBJBHSBJBJoooL
   Default region name [None]: us-east-1
   Default output format [None]: json
   
   ```
   
   [AWS Command Line Interface configure](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region)


- Criar uma tabela

```
aws dynamodb create-table \
    --table-name Movie \
    --attribute-definitions \
        AttributeName=Directed,AttributeType=S \
        AttributeName=MovieTitle,AttributeType=S \
    --key-schema \
        AttributeName=Directed,KeyType=HASH \
        AttributeName=MovieTitle,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5
```

- Inserir um item

```
aws dynamodb put-item \
    --table-name Movie \
    --item file://itemmovie.json \
```

- Inserir múltiplos itens

```
aws dynamodb batch-write-item \
    --request-items file://batchmovie.json
```

- Criar um index global secundário baseado no produtor do filme

```
aws dynamodb update-table \
    --table-name Movie \
    --attribute-definitions AttributeName=Development,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"Development-index\",\"KeySchema\":[{\"AttributeName\":\"Development\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar index baseado no título do filme

  ```
  aws dynamodb update-table \
      --table-name Movie \
      --attribute-definitions AttributeName=MovieTitle,AttributeType=S \
      --global-secondary-index-updates \
          "[{\"Create\":{\"IndexName\": \"MoviesTitle-index\",\"KeySchema\":[{\"AttributeName\":\"MovieTitle\",\"KeyType\":\"HASH\"}], \
          \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
  ```

  

- Criar um index global secundário baseado no nome do produtor e no título do filme

```
aws dynamodb update-table \
    --table-name Movie \
    --attribute-definitions\
        AttributeName=Development,AttributeType=S \
        AttributeName=MovieTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"DevelopmentMovieTitle-index\",\"KeySchema\":[{\"AttributeName\":\"Development\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"MovieTitle\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar um index global secundário baseado no título do filme e no ano de lançamento

```
aws dynamodb update-table \
    --table-name Movie \
    --attribute-definitions\
        AttributeName=MovieTitle,AttributeType=S \
        AttributeName=MovieYear,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"MovieTitleYear-index\",\"KeySchema\":[{\"AttributeName\":\"MovieTitle\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"MovieYear\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Pesquisar item por diretor

```
aws dynamodb query \
    --table-name Movie \
    --key-condition-expression "Directed = :directed" \
    --expression-attribute-values  '{":directed":{"S":"Joseph Kosinski"}}'
```
- Pesquisar item por diretor e título do filme

```
aws dynamodb query \
    --table-name Movie \
    --key-condition-expression "Directed = :directed and MovieTitle = :title" \
    --expression-attribute-values file://keyconditions.json
```

- Pesquisa pelo index secundário baseado no nome do produtor no título do filme

```
aws dynamodb query \
    --table-name Movie \
    --index-name DevelopmentMovieTitle-index \
    --key-condition-expression "Development = :v_development and MovieTitle = :v_title" \
    --expression-attribute-values  '{":v_development":{"S":"Marvel Studios"},":v_title":{"S":"Iron Man 3"} }'
```

- Pesquisa pelo index secundário baseado no título do filme e no ano

```
aws dynamodb query \
    --table-name Movie \
    --index-name MovieTitleYear-index \
    --key-condition-expression "MovieTitle = :v_movie and MovieYear = :v_year" \
    --expression-attribute-values  '{":v_movie":{"S":"Captain America: Civil War"},":v_year":{"S":"2016"} }'
```
