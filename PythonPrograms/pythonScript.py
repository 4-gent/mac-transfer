#File Name: pythonScript.py
#
#This file tests if python can call upon c++
#
#Author: Mj Burog

import os
import tkinter as tk
from tkinter import ttk
import platform

root = tk.Tk()

HEIGHT = 500
WIDTH = 350

def toolScript():
    #os.system('./toolScript.o')
    os.system('open -a Google\\ Chrome -n')

style = ttk.Style()
style.configure('buttonColor.TButton', background='#ffc75e', foreground='#ffe9c9')

#frame = tk.Frame(root, bg='#ebdcae')
#frame.place(relwidth = WIDTH, relheight = HEIGHT)

canvas = tk.Canvas(root, bg='#ebdcae', height=HEIGHT, width=WIDTH)
canvas.pack()

#button = ttk.Button(frame, text='Open Google Chrome', command=toolScript, style='buttonColor.TButton')
#button.pack()

button = tk.Button(root, text='Open Google Chrome', command=toolScript, bg='#ffc75e', fg='#ffe9c9')
button.pack(side='top')

root.mainloop()
