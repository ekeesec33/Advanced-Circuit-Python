#pylint: disable-msg=import-error
import time
import board
from analogio import AnalogIn
import busio
import simpleio
import pulseio
import servo

angle = 0
angle2 = 0
 
pwm = pulseio.PWMOut(board.A2, duty_cycle=2 ** 15, frequency=50) 
pwm2 = pulseio.PWMOut(board.A3, duty_cycle=2 ** 15, frequency=50)  
my_servo1 = servo.Servo(pwm)
my_servo2 = servo.Servo(pwm2) 

uart = busio.UART(board.TX, board.RX, baudrate=9600)

print("hi")
servoString = ""
S = True
sSboolean = False

while True:
    
    myData = uart.read(1)
    if myData is not None:
        decoded = myData.decode("utf-8")
        #print(decoded)

    time.sleep(0.01)

    if(decoded == "*"):
        #print("star")
        S = False
        A = False
        #servoString = ""
        sSboolean = True

    elif(decoded == "-"):
        #print("dash")
        S = False
        A = True
        #servoString = ""
        sSboolean = True

    else: 
        servoString = servoString + decoded
        #print(servoString)
        sSboolean = False

    if S == False and sSboolean == True and A == False:
        if servoString is not "":
            my_servo1.angle = int(servoString)
        #print(servoString)
        servoString = ""
        #sSboolean = False

    if S == False and sSboolean == True and A == True:
        if servoString is not "":
            my_servo2.angle = int(servoString)
        print(servoString)
        servoString = ""
        #sSboolean = True