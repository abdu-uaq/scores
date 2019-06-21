import asyncio

from motorengine import Document, StringField, connect


class User(Document):
    name = StringField(required=True)


async def go():
    bernardo = await User(name='Bernardo').save()
    someone = await User.objects.create(name='Someone')

    user = await User.objects.get(bernardo._id)
    assert user.name == 'Bernardo'

    users = await User.objects.filter(name='Someone').find_all()
    assert len(users) == 1
    assert users[0].name == 'Someone'

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    connect("scores", host="localhost", port=27017, io_loop=loop)

    loop.run_until_complete(go())