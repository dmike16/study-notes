const listener = Deno.listen({port: 8080});
console.info('Listening on port 8080');

for await (const conn of listener) {
	Deno.copy(conn, conn);
}
