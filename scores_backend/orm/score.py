import json

from sqlalchemy import Column, ForeignKey, Integer
from sqlalchemy.orm import relationship

from orm.base import Base


class Score(Base):
    __tablename__ = 'scores'
    id = Column(Integer, primary_key=True)
    player_one_id = Column(Integer, ForeignKey('players.id'), nullable=False)
    player_two_id = Column(Integer, ForeignKey('players.id'), nullable=False)
    player_one = relationship("Player", foreign_keys=[player_one_id], cascade="all,delete")
    player_two = relationship("Player", foreign_keys=[player_two_id], cascade="all,delete")
    score_player_one = Column(Integer, nullable=False)
    score_player_two = Column(Integer, nullable=False)

    def to_dict(self):
        return dict(
            id=self.id,
            player_one_id=self.player_one_id,
            player_two_id=self.player_two_id,
            score_player_one=self.score_player_one,
            score_player_two=self.score_player_two,
        )

    def to_json(self):
        return json.dumps(self.to_dict())
