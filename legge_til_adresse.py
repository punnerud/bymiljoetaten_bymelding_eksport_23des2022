import sqlite3

# Åpne tilkobling til database
conn = sqlite3.connect('database.db')
cursor = conn.cursor()

# Definer dummy-funksjonen
def dummy_function(value):
    return value * 2

# Hent første rad fra tabellen
cursor.execute("SELECT * FROM table")
row = cursor.fetchone()

# Gå gjennom alle rader og kjør dummy-funksjonen på verdiene
while row is not None:
    id = row[0]
    value = row[1]
    result = dummy_function(value)
    
    # Skriv resultatet tilbake til tabellen
    cursor.execute("UPDATE table SET result_column=? WHERE id=?", (result, id))

    # Hent neste rad
    row = cursor.fetchone()

# Lagre endringene og lukk tilkoblingen
conn.commit()
conn.close()
