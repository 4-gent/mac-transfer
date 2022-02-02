#File Name: fuckYou.py

import tkinter as tk
import os

root = tk.Tk()

HEIGHT = 1000
WIDTH = 1500

canvas = tk.Canvas(root, height = HEIGHT, width = WIDTH, bg = 'black')
canvas.pack()

frame = tk.Frame(root, bg = 'black')
frame.place(relx=1, rely=1)

label = tk.Label(frame, text = 'You don\'t get to DDOS me and get away with it bitch', bg = 'green')
#label.grid(row = 0, column = 0)
label.pack(fill = 'both', anchor = 'center')
#os.system("./fuckYou.exe")

root.mainloop()