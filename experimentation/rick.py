import os
import pyglet

path = '../roll/rickRoll.mp4'
window = pyglet.window.Window()
player = pyglet.media.Player()
source = pyglet.media.StreamingSource()
loadMedia = pyglet.media.load(path)

player.queue(loadMedia)
player.play()

@window.event
def on_draw():
    if player.source and player.source.video_format:
        player.get_texture().blit(50,50)

pyglet.app.run()