
# Shortly  

App used to shorten long URLS and monitor clicks and all users links shortened




## Deploy

Deployed in Heroku


https://shortlyapi-viniciuscoassis.herokuapp.com/


## Autor

- [@viniciuscoassis](https://github.com/viniciuscoassis)

## Functionalities

- signup
- signin
- link shortener
- links visits rank
- check your links




## Stack

**Back-end:** Node, Express 

- bcrypt: encrypt sensitive data 
- joi: all validations
- nanoid: generate random code for shortened urls 
- uuid: generate session token

**Database**: Postgres




## Learnings

Learned how to develop a complete API with genuine functionality from scratch, using popular tools from actual market such as node.js and express, also dealing with SQL Database Postgres.

## Rodando localmente

Clone o projeto

```bash
  git clone https://github.com/viniciuscoassis/projeto16-shortly.git
```

Entre no diretório do projeto

```bash
  cd my-project
```

Instale as dependências

```bash
  npm install
```

Inicie o servidor

```bash
  npm run start
```


## API Documentation

const baseUrl = 'https://shortlyapi-viniciuscoassis.herokuapp.com'

#### Basic usage
VERB ${baseUrl}/details

**details as especified below

#### Return most visited links rank

```http
  GET /ranking
```

(...)
