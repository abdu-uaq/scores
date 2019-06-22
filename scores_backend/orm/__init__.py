import os

from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
from sqlalchemy.orm import sessionmaker, Session

from orm.base import Base

USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")
DATABASE = os.getenv("DATABASE")
HOST = os.getenv("HOST")

engine: Engine = create_engine(f'postgresql://{USER}:{PASSWORD}@{HOST}/{DATABASE}')

from orm.player import Player
from orm.score import Score

if __name__ == '__main__':
    Score.__table__.drop(engine)
    Player.__table__.drop(engine)
    Base.metadata.create_all(engine)
    p1 = Player()
    p1.name = "player1"
    p2 = Player()
    p2.name = "player2"
    score = Score()
    score.player_one = p1
    score.player_two = p2
    score.score_player_one = 10
    score.score_player_two = 2
    SessionMaker = sessionmaker(bind=engine)
    session: Session = SessionMaker()

    session.add(p1)
    session.add(p2)
    session.add(score)
    session.commit()
