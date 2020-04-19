import mysql.connector

import adapter
import credentials

from mysql.connector import errorcode
from json import dumps


CREDENTIALS = {
    'user': credentials.USER,
    'password': credentials.PASSWORD,
    'database': credentials.DBNAME,
    'host': credentials.HOST,
    'raise_on_warnings': credentials.RAISE_ON_WARNINGS,
    'use_pure': credentials.USE_PURE
}



def lambda_handler(event, context):
    try:
        cnx = mysql.connector.connect(**CREDENTIALS)

        data = event['queryStringParameters']
        query = adapter.get_query(data)

        cursor = cnx.cursor()
        cursor.execute(query)
        cnx.commit()

        output = adapter.get_data(cursor)

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Username o password incorrecto")
            output = "Username o password incorrecto"
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("La base de datos no existe")
            output = "La base de datos no existe"
        else:
            print(err)
            output = err
    else:
        cursor.close()
        cnx.close()
        return {
            "isBase64Encoded": False,
            "statusCode": 200,
            "body": dumps(output),
            "headers": {
                "Content-Type": "application/json"
            }
        }
