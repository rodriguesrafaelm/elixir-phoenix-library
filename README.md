# BibliotecaPhoenix
Usando o Phoenix pra criar uma API simples de biblioteca.<br><br>

## Rotas
GET    /biblioteca/livros
GET    /biblioteca/livros/:id
POST   /biblioteca/livros
PATCH  /biblioteca/livros/:id
PUT    /biblioteca/livros/:id
DELETE /biblioteca/livros/:id

## Livros
Estão organizados por:
"titulo": "...."
"autor":  "...."
<br>

## Obs
Formato para post:
{
  "titulo": "...."
  "autor": "...."
}

PATCH e PUT(pode ser passado apenas o titulo ou o autor):
{
  "titulo": "...."
  "autor": "...."
}
