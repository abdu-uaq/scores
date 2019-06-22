import json

from sqlalchemy import Column, MetaData, String, Integer
from orm.base import Base

meta = MetaData()


class Player(Base):
    __tablename__ = 'players'
    id = Column(Integer, primary_key=True)
    name = Column(String(50))

    def to_dict(self):
        return dict(
            id=self.id,
            name=self.name,
        )

    def to_json(self):
        return json.dumps(self.to_dict())
