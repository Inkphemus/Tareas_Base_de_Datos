import requests
url_root = "http://localhost:3000/api"

def setup():
    print("**** *** ** BIENBENIDO A CommuniKen ** *** ****")
    print("**** **** *** ** INICIO SESION ** *** **** ****")
    print()
    mail_usr = input("INGRESE MAIL: ")
    pass_usr = input("INGRESE PASS: ")
    tup = (mail_usr , pass_usr)
    return tup

def loop():
    print()
    print("**** **** *** ** ************* ** *** **** ****")
    print("**** **** *** ** ************* ** *** **** ****")
    print()
    print("MENU")
    print("1 - Enviar un correo")
    print("2 - Ver información de un correo electrónico")
    print("3 - Ver correos marcados como favoritos")
    print("4 - Marcar un correo como favorito")
    print("5 - Terminar la ejecución del cliente")
    print()
    print("**** **** *** ** ************* ** *** **** ****")
    print("**** **** *** ** ************* ** *** **** ****")

## SERVICOS 0 : VALIDAR USUARIO
def srv_00(tup):
    url = url_root + "/validar"
    dat = {"mail":tup[0] , "pass":tup[1]}
    rr = requests.post(url,dat)
    ss = rr.status_code
    print(ss)
    if ss == 200:
        return True
    else:
        return False

## SERVICOS 1 : CREAR USUARIO
def srv_01():
    url = url_root + "/registar"
    i1 = input("nombre: ")
    i2 = input("relato: ")
    i3 = input("mail: ")
    i4 = input("pass: ")
    dat = {"nombre":i1 , "relato":i2 , "mail":i3 , "pass":i4 }
    rr = requests.post(url,dat)
    ss = rr.status_code
    print(ss)

## SERVICOS 2 : BLOQUEAR USUARIO
def srv_02():
    url = url_root + "/bloquear"
    i1 = input("mail: ")
    i2 = input("pass: ")
    i3 = input("ban: ")
    dat = {"mail":i1 , "pass":i2 , "ban":i3 }
    rr = requests.post(url,dat)
    ss = rr.status_code
    print(ss,rr.text)

## SERVICOS 3 : INFORMAR
def srv_03():
    mail = input("mail: ")
    url = url_root + "/informacion/" + mail
    rr = requests.get(url)
    ss = rr.status_code
    print(ss,"\n",rr.text)

## SERVICOS 4 : MARCAR CORREO
def srv_04():
    url = url_root + "/marcarcorreo"
    i1 = input("mail: ")
    i2 = input("pass: ")
    i3 = input("add: ")
    dat = {"mail":i1 , "pass":i2 , "add":i3 }
    rr = requests.post(url,dat)
    ss = rr.status_code
    print(ss,rr.text)

## SERVICOS 5 : DE-MARCAR CORREO
def srv_05():
    url = url_root + "/desmarcarcorreo"
    i1 = input("mail: ")
    i2 = input("pass: ")
    i3 = input("del: ")
    dat = {"mail":i1 , "pass":i2 , "del":i3 }
    rr = requests.delete(url,data=dat)
    ss = rr.status_code
    print(ss,rr.text)

## SERVICOS 6 : VER FAV 'S
def srv_06():
    url = url_root + "/verfavs"
    rr = requests.get(url)
    ss = rr.status_code
    print(ss,"\n",rr.text)

def main():
    tup = setup()
    if srv_00(tup) == True:
        loop()
        op = input("\nSELECCIONE UNA OPCION DE 1-5 ")

        while op != "5":
            if   op == "1":
                print("[ 1 ] NO DISPONIBLE")
            elif op == "2":
                print("[ 2 ] VER INFORMACION")
                srv_03()
            elif op == "3":
                print("[ 3 ] VER FAVORITOS")
                srv_06()
            elif op == "4":
                print("[ 4 ] MARCAR FAVORITO")
                srv_04()
            else:
                print("OPCION NO VALIDA, SELECCIONAR 1-5")

            loop()
            op = input("\nSELECCIONE UNA OPCION DE 1-5 ")
            
        print("[ 5 ] TERMINAR")
        print("¡Gracias por usar CommuniKen! Hasta luego.")
    else:
        print("¡Gracias por usar CommuniKen! Hasta luego.")

if __name__ == "__main__":
    main()
    ## TEST SERVICES
    ## srv_00()
    ## srv_01()
    ## srv_02()
    ## srv_03()
    ## srv_04()
    ## srv_05()
    ## srv_06()
    ## ...

    ## AQUI SE PUEDEN PROBAR EN ORDEN VAROS SERVICIOS
    ## TRAS APRETAR [5] O TERMINAR EL CLIENTE






