@echo off
cd C:\Users\aulecler\AppData\Local\TESTFACTORY_LOCAL\workspace\cortexia
venv /venv/Script/activate
call robot -d Results Tests/CortexIa.robot
venv /venv/Script/deactivate 


#call robot -d Results --include Training Tests/CortexIa.robot
