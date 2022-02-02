#File Name: weather.py
#
#This file creates a weather based gui
#
#Author: Mj Burog

import tkinter as tk

root = tk.Tk()

HEIGHT = 350
WIDTH = 400

canvas = tk.Canvas(root, height=HEIGHT, width=WIDTH)
canvas.pack()

frame = tk.Frame(root, bg='blue')
frame.place(relx=0.1, rely=0.1, relwidth=0.8, relheight=0.8)

button = tk.Button(frame, text="Test Button", bg='gray', fg='red')
#button.pack(side = 'left', fill='y', expand=True)
button.grid(row=0, column=0)

label = tk.Label(frame, text="This is a label", bg='yellow')
#label.pack(side ='left', fill='both')
label.grid(row=0, column=0)

entry = tk.Entry(frame, bg='green')
#entry.pack(side = 'left', fill='both')
entry.grid(row=0, column=0)

root.mainloop()