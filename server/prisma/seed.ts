import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
    await prisma.categorias_alimentos.create({
        data: {
            descricao: 'Salgados'
        }
    })

    await prisma.categorias_alimentos.create({
        data: {
            descricao: 'Doces'
        }
    })

    await prisma.categorias_alimentos.create({
        data: {
            descricao: 'Bebidas'
        }
    })
}

main()