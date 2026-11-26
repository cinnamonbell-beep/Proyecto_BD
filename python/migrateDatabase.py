import streamlit as st
import pymysql
from pymongo import MongoClient
from decimal import Decimal

MYSQL_DB_NAME = "GroceryStore"
MONGO_DB_NAME = "GroceryStore"

st.set_page_config(page_title="Migrador MySQL → MongoDB", page_icon="🔄", layout="wide")
st.title("🔄 Migrador MySQL → MongoDB")

@st.cache_resource
def get_mysql_conn(host, user, password, db_name):
    return pymysql.connect(host=host, user=user, password=password, database=db_name)

@st.cache_resource
def get_mongo_db(host, port, db_name):
    return MongoClient(f"mongodb://{host}:{port}/")[db_name]

with st.sidebar:
    st.header("Configuración")
    mysql_host = st.text_input("Host MySQL", value="localhost")
    mysql_user = st.text_input("Usuario MySQL", value="root")
    mysql_pass = st.text_input("Password MySQL", value="", type="password")
    mysql_db = st.text_input("Base de datos", value=MYSQL_DB_NAME)
    mongo_host = st.text_input("Host Mongo", value="localhost")
    mongo_port = st.number_input("Puerto Mongo", value=27017, step=1)
    btn_conectar = st.button("Conectar", type="primary", use_container_width=True)

if "conectado" not in st.session_state:
    st.session_state.conectado = False
if "tablas" not in st.session_state:
    st.session_state.tablas = []

if btn_conectar:
    try:
        conn = get_mysql_conn(mysql_host, mysql_user, mysql_pass, mysql_db)
        with conn.cursor() as cursor:
            cursor.execute("SHOW DATABASES")
            dbs = [r[0].lower() for r in cursor.fetchall()]
        if mysql_db.lower() not in dbs:
            st.error(f"❌ La base de datos '{mysql_db}' no existe.")
            st.session_state.conectado = False
        else:
            with conn.cursor() as cursor:
                cursor.execute("SHOW TABLES")
                st.session_state.tablas = [r[0] for r in cursor.fetchall()]
            st.session_state.conectado = True
            st.session_state.mongo_host = mongo_host
            st.session_state.mongo_port = int(mongo_port)
            st.success("✔ Conectado")
    except Exception as e:
        st.error(f"❌ Error de conexión: {e}")
        st.session_state.conectado = False

def migrar_tabla(conn, mongo_db, table_name, use_sp=False):
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            if use_sp:
                cursor.callproc(f"getAll{table_name.capitalize()}")
            else:
                cursor.execute(f"SELECT * FROM `{table_name}`")
            rows = cursor.fetchall()
        if not rows:
            return False, f"⚠ Sin datos en '{table_name}'"
        rows = [{k: float(v) if isinstance(v, Decimal) else v for k, v in r.items()} for r in rows]
        mongo_db[table_name].delete_many({})
        mongo_db[table_name].insert_many(rows)
        return True, f"✔ '{table_name}' ({len(rows)} filas)"
    except Exception as e:
        return False, f"❌ Error en '{table_name}': {e}"

if st.session_state.conectado:
    st.subheader("Tablas detectadas")
    if not st.session_state.tablas:
        st.warning("No hay tablas.")
    else:
        seleccion = st.multiselect(
            "Selecciona tablas a migrar",
            options=st.session_state.tablas,
            default=st.session_state.tablas,
        )
        use_sp = st.checkbox("Usar Stored Procedures", value=False)

        if st.button("Migrar", type="primary"):
            if not seleccion:
                st.warning("Selecciona al menos una tabla.")
            else:
                conn = get_mysql_conn(mysql_host, mysql_user, mysql_pass, mysql_db)
                mongo_db = get_mongo_db(
                    st.session_state.mongo_host,
                    st.session_state.mongo_port,
                    MONGO_DB_NAME,
                )
                progress = st.progress(0, text="Iniciando...")
                for i, tabla in enumerate(seleccion, 1):
                    ok, msg = migrar_tabla(conn, mongo_db, tabla, use_sp=use_sp)
                    (st.success if ok else st.warning)(msg)
                    progress.progress(i / len(seleccion), text=f"{i}/{len(seleccion)}")
                progress.progress(1.0, text="✅ Finalizado")
else:
    st.info("Configura y presiona Conectar.")