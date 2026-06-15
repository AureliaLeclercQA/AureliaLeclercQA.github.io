@echo off
cd C:\Users\aulecler\AppData\Local\TESTFACTORY_LOCAL\workspace\project
venv /venv/Script/activate
call robot -d Results Tests/project.robot
venv /venv/Script/deactivate 


#call robot -d Results --include Training Tests/project.robot
