import mysql.connector
import json
import tables

from mysql.connector import errorcode


CREDENTIALS = {
    'user': 'admin',
    'password': 'NNuhNHh37OUBgBr0vuvu',
    'host': 'collabnotesdb.cwklxoe8cxlj.us-east-1.rds.amazonaws.com',
    # 'database': 'ceddie_users',
    'raise_on_warnings': True,
    'use_pure': True
}



def lambda_handler(event, context):
    try:
        txt_return = list((""))
        cnx = mysql.connector.connect(**CREDENTIALS)

        # ----------BUSCAR REGISTRO---------------
        data = event['queryStringParameters']
        query = tables.get_query(data)

        cursor = cnx.cursor()
        cursor.execute(query)
        
        # TODO generar funcion que parse el output y remplazar esto:

        datosUsuario = {}  # Diccionario para agregar
        for (idDocente, nombre) in cursor:
          datosUsuario['idDocente'] = idDocente
          datosUsuario['nombre'] = nombre

        txt_return.append(datosUsuario.copy())
        print("{}, {}".format(idDocente, nombre))

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Username o password incorrecto")
            txt_return = "Username o password incorrecto"
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("La base de datos no existe")
            txt_return = "La base de datos no existe"
        else:
            print(err)
            txt_return = err
    else:
        cnx.close()
        return {
            "isBase64Encoded": False,
            "statusCode": 200,
            "body": json.dumps(txt_return),
            "headers": {
                "Content-Type": "application/json"
            }
        }