# Amazon Dynamodb


### Serviço utilizado
  - Amazon DynamoDB

    

  - Amazon CLI para execução em linha de comando

### Comandos para execução do experimento:

- Fazendo o download do AWS Command Line Interfaces.

   [AWS Command Line Interface download](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- Configurando a conexão com o DynamoDB da AWS via Amazon CLI

   [AWS Command Line Interface configure](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region)
   
   ```
   $ aws configure
   AWS Access Key ID [****************TJTD]: AMNASDMBMNASDMBSDBAS
   AWS Secret Access Key [****************0unL]: algmglsmdasdkl/7klkasklsjdlakjadlsjnL
   Default region name [us-east-1]: us-east-1
   Default output format [json]: json
   ```
   
   


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
    --item file://itemMovie.json \
```

- Inserir múltiplos itens

```
aws dynamodb batch-write-item \
    --request-items file://batchMovie.json
```

- Criar um index global secundário baseado no título do filme

```
aws dynamodb update-table \
    --table-name Movie \
    --attribute-definitions AttributeName=MovieTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"MovieTitle-index\",\"KeySchema\":[{\"AttributeName\":\"MovieTitle\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar um index global secundário baseado no nome do Diretor e no título do filme

```
aws dynamodb update-table \
    --table-name Movie \
    --attribute-definitions\
        AttributeName=Directed,AttributeType=S \
        AttributeName=MovieTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"DirectedMovieTitle-index\",\"KeySchema\":[{\"AttributeName\":\"Directed\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"MovieTitle\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar um index global secundário baseado no título do filme e no ano

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
    --key-condition-expression "Directed = :Directed" \
    --expression-attribute-values  '{":Directed":{"S":"Joseph Kosinski"}}'
```
- Pesquisar item por diretor título do filme

```
aws dynamodb query \
    --table-name Movie \
    --key-condition-expression "Directed = :directed and MovieTitle = :title" \
    --expression-attribute-values file://keyconditions.json
```

- Pesquisa pelo index secundário baseado no título do filme

```
aws dynamodb query \
    --table-name Movie \
    --index-name MovieTitle-index \
    --key-condition-expression "MovieTitle = :name" \
    --expression-attribute-values  '{":name":{"S":"Top Gun Maverick"}}'
```

- Pesquisa pelo index secundário baseado no nome do Diretor e no título do filme

```
aws dynamodb query \
    --table-name Movie \
    --index-name DirectedMovieTitle-index \
    --key-condition-expression "Directed = :v_Directed and MovieTitle = :v_title" \
    --expression-attribute-values  '{":v_Directed":{"S":"Joseph Kosinski"},":v_title":{"S":"Top Gun Maverick"} }'
```

- Pesquisa pelo index secundário baseado no título do filme e no ano

```
aws dynamodb query \
    --table-name Movie \
    --index-name MovieTitleYear-index \
    --key-condition-expression "MovieTitle = :v_movie and MovieYear = :v_year" \
    --expression-attribute-values  '{":v_movie":{"S":"Top Gun Maverick"},":v_year":{"S":"2022"} }'
```
