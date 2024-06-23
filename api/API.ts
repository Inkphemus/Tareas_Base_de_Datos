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

//  MSG CASE
async function msg(ii)
	{
 	const ahora = new Date();
    const hora = ahora.toTimeString().slice(0, 5);
    let mensaje;
    switch (ii)
    	{
        case 0:
            mensaje = `[${hora}]  Se ha validado el usuario`;
            break;
        case 1:
            mensaje = `[${hora}]  Se ha registrado el usuario`;
            break;
        case 2:
            mensaje = `[${hora}]  Se ha bloqueado el usuario`;
            break;
        case 3:
            mensaje = `[${hora}]  Se ha informado al usuario`;
            break;
        case 4:
            mensaje = `[${hora}]  Se ha marcado el correo`;
            break;
        case 5:
            mensaje = `[${hora}]  Se ha demarcado el correo`;
            break;
        case 6:
            mensaje = `[${hora}]  Se han mostrado los favoritos`;
            break;
        case 7:
            mensaje = `[${hora}]  ENDPOINT fallo !!!`;
            break;
        case 8:
            mensaje = `{"codigo":200,"mensaje":"PETECION EXITOSA"}`;
            break;
        case 9:
            mensaje = `{"codigo":400,"mensaje":"PETECION FALLIDA"}`;
            break;
        default:
            mensaje = `defult msg`;
            break;
    	}
    return mensaje;
 	}

//  ENDPOINT 00 : VALIDAR
async function end_00(dt,er)
 	{
  	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	const usuarios = await prisma.usuario.findMany({ where: dt, });
    	numb = usuarios.length;
    	}
  	catch (error) { flag = false; }
  	
  	if (flag && numb>0) { console.log(await msg(0)); return   (     await msg(8)); }
  	else                { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

//  ENDPOINT 01 : REGISTRAR
async function end_01(dt,er)
 	{
 	let flag: boolean = true;
 	try
    	{
    	try { await prisma.usuario.create({ data:dt, }) }
    	catch (error) { flag = false; }
    	}
  	catch (error) { flag = false; }

  	if (flag) { console.log(await msg(1)); return   (     await msg(8)); }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

 //  ENDPOINT 02 : BLOQUEAR
async function end_02(dt,er)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	let dicc_aux = {"mail":dt["mail"] , "pass":dt["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = {"mail":dt["ban"]};
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

  	if (flag) { console.log(await msg(2)); return   (     await msg(8)); }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

 //  ENDPOINT 03 : INFORMAR
async function end_03(dt,er)
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

  	dicc = {"estado":200, "nombre":dicc["nombre"],"mail":dicc["mail"],"relato":dicc["relato"]};
  	if (flag) { console.log(await msg(2)); return dicc; }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

//  ENDPOINT 04 : MARCAR
async function end_04(dt,er)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	let dicc_aux = {"mail":dt["mail"] , "pass":dt["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = { "id_usr" : parseInt(dt["add"],10) };
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

  	if (flag) { console.log(await msg(4)); return   (     await msg(8)); }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

//  ENDPOINT 05 : DE-MARCAR
async function end_05(dt,er)
 	{
 	let flag: boolean = true;
  	let numb: number  = 0;
 	try
    	{
    	let dicc_aux = {"mail":dt["mail"] , "pass":dt["pass"]};
    	let reg = await prisma.usuario.findMany({ where: dicc_aux, });
    	if (reg.length===0) { flag = false; }
    	else
    		{
    		let dicc_aux = { "id_usr" : parseInt(dt["del"],10) };
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

  	if (flag) { console.log(await msg(5)); return   (     await msg(8)); }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}

//  ENDPOINT 06 : MOSTRAR
async function end_06(er)
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
  	let dicc_new = await msg(8);
	dicc.unshift(dicc_new);
  	if (flag) { console.log(await msg(6)); return dicc; }
  	else      { console.log(await msg(7)); return er(400, await msg(9)); }
 	}


//  ELYSIA ENDPOINTS 
const { Elysia } = require("C:\\Users\\asusr\\Desktop\\TAREA2\\myapp\\node_modules\\elysia");
const server = new Elysia();

//  ENDPOINT 00
server.post( '/api/validar' , ({body,error}) => end_00(body,error) );

//  ENDPOINT 01
server.post( '/api/registar' , ({body,error}) => end_01(body,error) );

//  ENDPOINT 02
server.post( '/api/bloquear' , ({body,error}) => end_02(body,error) );

//  ENDPOINT 03
server.get( '/api/informacion/:correo' , ({ params: { correo },error}) => end_03(correo,error) );

//  ENDPOINT 04
server.post( '/api/marcarcorreo' , ({body,error}) => end_04(body,error) );

//  ENDPOINT 05
server.delete( '/api/desmarcarcorreo' , ({body,error}) => end_05(body,error) );

//  ENDPOINT 06
server.get( '/api/verfavs' , (error) => end_06(error) );

// DES-REGISTRO DES-BLOQUEO DES-FAVORITO
//await prisma.usuario.deleteMany({ where:{"id_usr":2}, });
//await prisma.fav.deleteMany({ where:{"id_fav":1}, });
//await prisma.ban.deleteMany({ where:{"id_ban":1}, });

server.listen(6969);
console.log('run...');


//  FIN
//  FIN