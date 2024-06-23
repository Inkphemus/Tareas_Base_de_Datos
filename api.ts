//  INICIO
//  INICIO


/*

//  SCHEMA PRISMA UTILIZADO A CONTINUACION EN ESTE COMENTARIO

model usuario {
  id_usr Int    @id @default(autoincrement())
  nombre String
  relato String
  mail   String @unique
  pass   String
  ban    ban[]
  fav    fav[]
}

model fav {
  id_fav  Int     @id @default(autoincrement())
  id_usr  Int     @unique
  usuario usuario @relation(fields: [id_usr], references: [id_usr])
}

model ban {
  id_ban  Int     @id @default(autoincrement())
  id_usr  Int     @unique
  usuario usuario @relation(fields: [id_usr], references: [id_usr])
}

*/


//  PRISMA ENDPOINTS 
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

//  ENDPOINT 00 : VALIDAR
async function end_00(dt)
 	{
  	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	const dicc = dt.body;
    	const usuarios = await prisma.usuario.findMany({ where: dicc, });
    	numb = usuarios.length;
    	}
  	catch (error) { flag = false; }

  	if (flag && numb>0) { console.log('EXITO'); }
  	else                { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

//  ENDPOINT 01 : REGISTRAR
async function end_01(dt)
 	{
 	let flag: boolean = true;
 	try
    	{
    	const dicc = dt.body;
    	try { await prisma.usuario.create({ data:dicc, }) }
    	catch (error) { flag = false; }
    	}
  	catch (error) { flag = false; }

  	if (flag) { console.log('EXITO'); }
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

 //  ENDPOINT 02 : BLOQUEAR
async function end_02(dt)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	const dicc = dt.body;
    	let dicc_aux = {"mail":dicc["mail"] , "pass":dicc["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = {"mail":dicc["ban"]};
    		let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    		if (reg.length===0) { flag = false; }
    		else
    			{
    			let dicc_aux = { "id_usr" : reg[0]["id_usr"] };
    			try { await prisma.ban.create({ data:dicc_aux, }); }
    			catch (error) { flag = false; }
    			}
    		}
    	}
  	catch (error) { flag = false; }

  	if (flag) { console.log('EXITO'); }
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

 //  ENDPOINT 03 : INFORMAR
async function end_03(dt)
 	{
 	let flag: boolean = true;
 	let dicc = {0:0};
 	try
    	{
    	let dicc_aux = {"mail":dt};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else                { dicc = reg[0]; }
    	}
  	catch (error) { flag = false; }
  	if (flag) { console.log('EXITO'); return dicc;}
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

//  ENDPOINT 04 : MARCAR
async function end_04(dt)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	const dicc = dt.body;
    	let dicc_aux = {"mail":dicc["mail"] , "pass":dicc["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = { "id_usr" : parseInt(dicc["add"],10) };
    		let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    		if (reg.length===0) { flag = false; }
    		else
    			{
    			let dicc_aux = { "id_usr" : reg[0]["id_usr"] };
    			try { await prisma.fav.create({ data:dicc_aux, }); }
    			catch (error) { flag = false; }
    			}
    		}
    	}
  	catch (error) { flag = false; }

  	if (flag) { console.log('EXITO'); }
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

//  ENDPOINT 05 : DE-MARCAR
async function end_05(dt)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	const dicc = dt.body;
    	let dicc_aux = {"mail":dicc["mail"] , "pass":dicc["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = { "id_usr" : parseInt(dicc["del"],10) };
    		let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    		if (reg.length===0) { flag = false; }
    		else
    			{
    			let dicc_aux = { "id_usr" : reg[0]["id_usr"] };
    			try { await prisma.fav.deleteMany({ where:dicc_aux, }); }
    			catch (error) { flag = false; }
    			}
    		}
    	}
  	catch (error) { flag = false; }

  	if (flag) { console.log('EXITO'); return 0; }
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}

//  ENDPOINT 06 : MOSTRAR
async function end_06(dt)
 	{
 	let flag: boolean = true;
 	let dicc = {0:0};
 	try
    	{
    	let reg = await prisma.fav.findMany();
    	if (reg.length===0) { flag = false; }
    	else                { dicc = reg; }
    	}
  	catch (error) { flag = false; }
  	if (flag) { console.log('EXITO'); return dicc;}
  	else      { console.log('ERROR'); dt.sendResponse(500, 'server_bad'); }
 	}


//  ELYSIA ENDPOINTS 
const { Elysia } = require("C:\\Users\\asusr\\Desktop\\TAREA2\\myapp\\node_modules\\elysia");
const server = new Elysia();

//  ENDPOINT 00
server.post( '/api/validar' , (dt) => end_00(dt) );

//  ENDPOINT 01
server.post( '/api/registar' , (dt) => end_01(dt) );

//  ENDPOINT 02
server.post( '/api/bloquear' , (dt) => end_02(dt) );

//  ENDPOINT 03
server.get( '/api/informacion/:correo' , ({ params: { correo } }) => end_03(correo) );

//  ENDPOINT 04
server.post( '/api/marcarcorreo' , (dt) => end_04(dt) );

//  ENDPOINT 05
server.delete( '/api/desmarcarcorreo' , (dt) => end_05(dt) );

//  ENDPOINT 06
server.get( '/api/verfavs' , (dt) => end_06(dt) );

// DES-REGISTRO DES-BLOQUEO DES-FAVORITO
//await prisma.usuario.deleteMany({ where:{"id_usr":2}, });
//await prisma.fav.deleteMany({ where:{"id_fav":1}, });
//await prisma.ban.deleteMany({ where:{"id_ban":1}, });

server.listen(3000);
console.log('run...');


//  FIN
//  FIN
