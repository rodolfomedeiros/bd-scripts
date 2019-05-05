
// INSERT

// insert pessoas
CREATE
    (p1:Pessoa {nome: 'João', conta: 'BB'}),
    (p2:Pessoa {nome: 'Maria', conta: 'Caixa'}),
    (p3:Pessoa {nome: 'Valentina', conta: 'Bradesco'}),
    (p4:Pessoa {nome: 'Yuri', conta: 'Itaú'}),
    (p5:Pessoa {nome: 'Alexandre', conta: 'Santander'})

// insert transações

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'João' AND pF.nome = 'Maria'
CREATE (pI)-[t:Transacao  {value: '1000.00'}]->(pF)

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'Maria' AND pF.nome = 'Valentina'
CREATE (pI)-[t:Transacao  {value: '500.00'}]->(pF)

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'Maria' AND pF.nome = 'Yuri'
CREATE (pI)-[t:Transacao  {value: '350.00'}]->(pF)

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'Maria' AND pF.nome = 'Alexandre'
CREATE (pI)-[t:Transacao  {value: '150.00'}]->(pF)

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'Valentina' AND pF.nome = 'Alexandre'
CREATE (pI)-[t:Transacao  {value: '500.00'}]->(pF)

MATCH (pI:Pessoa),(pF:Pessoa)
WHERE pI.nome = 'Yuri' AND pF.nome = 'Alexandre'
CREATE (pI)-[t:Transacao  {value: '350.00'}]->(pF)

// SELECT

// all
MATCH (n:Pessoa) RETURN n

// one node
MATCH (n:Pessoa) WHERE n.nome = 'Alexandre' RETURN n

// UPDATE

// update one node
MATCH (n:Pessoa) WHERE n.nome = 'João' SET n.nome = 'Anonynous'

// update one relationships
MATCH (pI:Pessoa)-[t:Transacao]->(pF:Pessoa)
WHERE pI.nome = 'Yuri' AND pF.nome = 'Alexandre'
SET t.value = '250.00'

// DELETE

// delete one relationship
MATCH (p:Pessoa)-[t:Transacao]->() WHERE p.nome = 'Yuri' DELETE t

// all relationships
MATCH (p)-[t:Transacao]->() DELETE t

// all nodes
MATCH (n) DELETE n