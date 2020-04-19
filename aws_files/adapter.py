from base64 import b64decode



def get_query(data):
    key = list(data.keys())[0]
    return key, b64decode(data[key])


def get_data(cursor):
    return [
        [element for element in register]
        for register in cursor
    ]