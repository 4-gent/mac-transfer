#File Name: greanTea.py
#
#This is the python gui for teaBag.cpp
#
#Author: Marlon Burog

import tkinter as tk

root = tk.Tk()

HEIGHT = 700
WIDTH = 500

canvas = tk.Canvas(root, height = HEIGHT, width = WIDTH)
canvas.pack()

frame = tk.Frame(root, bg='#ffe591')
frame.place(relwidth=1, relheight=1)

button = tk.Button(frame, text="Open Application")
button.pack(side = 'left', expand=False)

button2 = tk.Button(frame, text="Developer Tool Download")
button2.pack(side = 'left', expand=False)

root.mainloop()
