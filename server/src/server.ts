import Fastify from "fastify"
import { PrismaClient } from '@prisma/client'
import cors from '@fastify/cors'

const prisma = new PrismaClient({
    log: ['query']
})

async function start() {
    const fastify = Fastify({
        logger: true
    })

    await fastify.register(cors, {
        origin: true
    })

    fastify.get('/categorias', async () => {
        const categorias = await prisma.categorias_alimentos.findMany()
        return { data: categorias }
    })

    fastify.get('/restaurantes', async () => {
        const restaurantes = await prisma.restaurantes.findMany({
            select: {
                restaurante_id: true,
                nome: true,
                imagem_id: true
            }
        })

        return { data: restaurantes }
    })

    await fastify.listen({ port: 3333 })
}

start()