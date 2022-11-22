import Fastify from "fastify"

async function start() {
    const fastify = Fastify({
        logger: true
    })

    fastify.get('/', () => {
        return { data: 'A API está funcionando!' }
    })

    await fastify.listen({ port: 3333 })
}

start()