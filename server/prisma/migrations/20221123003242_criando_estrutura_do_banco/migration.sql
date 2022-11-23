-- CreateTable
CREATE TABLE "alimentos" (
    "alimento_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "preco" DECIMAL NOT NULL,
    "restaurante_id" INTEGER NOT NULL,
    "categoria_id" INTEGER NOT NULL,
    CONSTRAINT "alimentos_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categorias_alimentos" ("categoria_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "alimentos_restaurante_id_fkey" FOREIGN KEY ("restaurante_id") REFERENCES "restaurantes" ("restaurante_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "clientes" (
    "cliente_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "imagem_id" INTEGER,
    "data_hora_cadastro" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "clientes_imagem_id_fkey" FOREIGN KEY ("imagem_id") REFERENCES "imagens" ("imagem_id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pedidos" (
    "pedido_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "forma_pagamento" TEXT NOT NULL DEFAULT 'C',
    "tempo_estimado" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'R',
    "data_hora_pedido" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "data_hora_entrega" DATETIME,
    "cliente_id" INTEGER NOT NULL,
    "entregador_id" INTEGER,
    "cartao_id" INTEGER,
    CONSTRAINT "pedidos_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pedidos_entregador_id_fkey" FOREIGN KEY ("entregador_id") REFERENCES "entregadores" ("entregador_id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "pedidos_cartao_id_fkey" FOREIGN KEY ("cartao_id") REFERENCES "cartoes_cliente" ("cartao_id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "avaliacoes" (
    "avaliacao_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nota" DECIMAL NOT NULL,
    "comentario" TEXT,
    "cliente_id" INTEGER NOT NULL,
    "pedido_id" INTEGER NOT NULL,
    CONSTRAINT "avaliacoes_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "avaliacoes_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "pedidos" ("pedido_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pedido_alimento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pedido_id" INTEGER NOT NULL,
    "alimento_id" INTEGER NOT NULL,
    CONSTRAINT "pedido_alimento_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "pedidos" ("pedido_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pedido_alimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("alimento_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "enderecos" (
    "endereco_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cep" TEXT NOT NULL,
    "logradouro" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "complemento" TEXT,
    "cod_cidade" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "categorias_alimentos" (
    "categoria_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descricao" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "imagens" (
    "imagem_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_arquivo" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "excluida" TEXT NOT NULL DEFAULT 'N',
    "data_hora_exclusao" DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "cartoes_cliente" (
    "cartao_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numero_cartao" TEXT NOT NULL,
    "validade" DATETIME NOT NULL,
    "cvv" TEXT NOT NULL,
    "titular" TEXT NOT NULL,
    "cpf_cnpj" TEXT NOT NULL,
    "apelido" TEXT,
    "cliente_id" INTEGER NOT NULL,
    CONSTRAINT "cartoes_cliente_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "restaurantes_favoritos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cliente_id" INTEGER NOT NULL,
    "restaurante_id" INTEGER NOT NULL,
    CONSTRAINT "restaurantes_favoritos_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "restaurantes_favoritos_restaurante_id_fkey" FOREIGN KEY ("restaurante_id") REFERENCES "restaurantes" ("restaurante_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "entregadores" (
    "entregador_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "celular" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "enderecos_clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tipo" TEXT NOT NULL DEFAULT 'C',
    "cliente_id" INTEGER NOT NULL,
    CONSTRAINT "enderecos_clientes_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "restaurantes" (
    "restaurante_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "celular" TEXT,
    "imagem_id" INTEGER NOT NULL,
    "endereco_id" INTEGER NOT NULL,
    CONSTRAINT "restaurantes_imagem_id_fkey" FOREIGN KEY ("imagem_id") REFERENCES "imagens" ("imagem_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "restaurantes_endereco_id_fkey" FOREIGN KEY ("endereco_id") REFERENCES "enderecos" ("endereco_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "clientes_cpf_key" ON "clientes"("cpf");
