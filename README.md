# BibliotecaPhoenix
Usando o Phoenix pra criar uma API simples de biblioteca.<br><br>

## Rotas
GET    /biblioteca/livros <br>
GET    /biblioteca/livros/:id <br>
POST   /biblioteca/livros <br>
PATCH  /biblioteca/livros/:id <br>
PUT    /biblioteca/livros/:id <br>
DELETE /biblioteca/livros/:id <br>

## Livros
Estão organizados por: <br>
"titulo": "...." <br>
"autor":  "...." <br>
<br>

## observações
Formato para post: <br>
{ <br>
  "titulo": "...." <br>
  "autor": "...." <br>
} <br>

PATCH e PUT(pode ser passado apenas o titulo ou o autor): <br>
{ <br>
  "titulo": "...." <br>
  "autor": "...." <br>
}
