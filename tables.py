DOCENTE = {
    "all": "*",
}
QUERY = (
    "SELECT {0} "
    "FROM collabnotes.{0}"
)


def get_query(data):
    table = list(data.keys())[0].upper()
    call = data[table]
    if call == "all":
        return 
        
    return process_data(call, table)


def process_data(call, table):
    # TODO: format the calls to improve the QUERY
    return QUERY.format(call, table)