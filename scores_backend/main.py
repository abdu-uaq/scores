import json
from typing import List

from quart import Quart, request
from sqlalchemy.orm import Session, sessionmaker

from orm import Player, Score, engine

app = Quart(__name__)

SessionMaker = sessionmaker(bind=engine)


@app.route('/')
async def index():
    return 'Hello World'


@app.route('/player', methods=['GET'])
async def get_players():
    session: Session = SessionMaker()
    players: List[Player] = session.query(Player).all()
    players_dict = [p.to_dict() for p in players]

    return json.dumps(players_dict)


@app.route('/player', methods=['POST'])
async def create_player():
    form = await request.get_json()
    p = Player()
    p.name = form["name"]
    session: Session = SessionMaker()
    session.add(p)
    session.commit()

    return p.to_json()


@app.route('/player/<id>', methods=['PUT'])
async def update_player(id):
    id = int(id)
    form = await request.get_json()
    session: Session = SessionMaker()
    p = session.query(Player).get(id)
    p.name = form["name"]
    session.commit()

    return p.to_json()


@app.route('/player/<id>', methods=['DELETE'])
async def delete_player(id):
    id = int(id)
    session: Session = SessionMaker()
    p = session.query(Player).get(id)
    session.delete(p)
    session.commit()

    return p.to_json()


##### SCORES

@app.route('/score', methods=['GET'])
async def get_scores():
    session: Session = SessionMaker()
    scores: List[Score] = session.query(Score).all()
    scores_dict = [p.to_dict() for p in scores]

    return json.dumps(scores_dict)


@app.route('/score', methods=['POST'])
async def create_score():
    form = await request.get_json()
    s = Score()
    s.player_one_id = form["player_one_id"]
    s.player_two_id = form["player_two_id"]
    s.score_player_one = form["score_player_one"]
    s.score_player_two = form["score_player_two"]
    session: Session = SessionMaker()
    session.add(s)
    session.commit()

    return s.to_json()


@app.route('/score/<id>', methods=['DELETE'])
async def delete_score(id):
    id = int(id)
    session: Session = SessionMaker()
    s = session.query(Score).get(id)
    session.delete(s)
    session.commit()

    return s.to_json()


if __name__ == '__main__':
    app.run()
