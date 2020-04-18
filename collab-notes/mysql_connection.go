package collabnotes

import (
	"database/sql"
	"fmt"

	credentials "collabnotes/credentials"

	_ "github.com/go-sql-driver/mysql" // driver package for mysql
)

func init() {

	fmt.Println("Connecting to db")
	db, err := sql.Open("mysql", credentials.ROUTE)

	if err != nil {
		panic(err.Error())
	}

	fmt.Println("Succesfully connected")
	defer db.Close()
}

func query(query string) {
	result, err := db.Query(query)
	if err != nil {
		panic(err.Error())
	}
	defer result.Close()
	return result
}
