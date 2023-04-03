from google.cloud.sql.connector import Connector
import sqlalchemy
from sqlalchemy.orm import sessionmaker
from secrets import get_secret_by_id, DB_SECRET_ID
from sqlalchemy.ext.declarative import declarative_base


def init_connection_engine() -> sqlalchemy.engine.Engine:
    def getconn():
        secret_url = get_secret_by_id(DB_SECRET_ID)
        instance_name = secret_url.split("/")[-1]
        user = "postgres"
        password = secret_url.replace("postgres://postgres:", "").split("@")[0]
        with Connector() as connector:
            conn = connector.connect(
                instance_name,
                "pg8000",
                user=user,
                password=password,
                db="postgres",
                enable_iam_auth=True
            )
            return conn

    pool = sqlalchemy.create_engine(
        "postgresql+pg8000://",
        creator=getconn,
    )
    return pool


engine = init_connection_engine()
session_local = sessionmaker(autocommit=False, autoflush=False, bind=engine)
base = declarative_base()


def get_db():
    db = None
    try:
        db = session_local()
        yield db
    finally:
        db.close()
